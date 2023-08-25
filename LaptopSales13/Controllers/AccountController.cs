using LaptopSales13.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Scrypt;
using System.Security.Cryptography;
using System.Text;

namespace LaptopSales13.Controllers
{
    public class AccountController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        //Get: Đăng ký
        public ActionResult Register()
        {
            return View();
        }

        // Post: Đăng ký
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterViewModel r)
        {
            if (ModelState.IsValid)
            {
                var checkUser = db.Accounts.FirstOrDefault(x => x.UserName == r.Username);
                if (checkUser != null)
                {
                    ViewBag.error = "Username đã tồn tại!";
                    return View();
                }
                else
                {          
                    Account account = new Account();
                    account.UserName = r.Username;
                    account.Password = GetMD5(r.Password);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    // Thêm người dùng  mới
                    db.Accounts.Add(account);
                    // Lưu lại vào cơ sở dữ liệu
                    db.SaveChanges();
                    // Thông báo
                    ViewBag.error = "Đăng ký thành công! Vui lòng đăng nhập tài khoản";
                    // Trả về trang đăng nhập
                    return RedirectToAction("Login");
                }
            }
            return View();
        }

        // Get: Đăng nhập
        public ActionResult LogIn()
        {
            return View();
        }

        // Post: Đăng nhập
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangNhap(LoginViewModel l)
        {            
            if (ModelState.IsValid)
            {
                var password = GetMD5(l.Password);
                var data = db.Accounts.Where(s => s.UserName.Equals(l.Username) && s.Password.Equals(password)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["UserID"] = data.FirstOrDefault().AccountID;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.error = "Đăng nhập không thành công!";
                    return RedirectToAction("LogIn");
                }
            }
            return View(l);
        }

        // Đăng nhập phân quyền
        [HttpPost]
        public ActionResult LogIn(LoginViewModel l)
        {
            string userName = l.Username.ToString();
            var password = GetMD5(l.Password);
            var islogin = db.Accounts.SingleOrDefault(x => x.UserName.Equals(userName) && x.Password.Equals(password));

            if (islogin != null)
            {
                if (userName == "admin")
                {
                    Session["use"] = islogin;
                    return RedirectToAction("Index", "Admin/Home");
                }
                else
                {
                    Session["use"] = islogin;
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                ViewBag.Fail = "Đăng nhập thất bại";
                return View("LogIn");
            }

        }

        // Đăng xuất
        public ActionResult LogOut()
        {
            Session.Clear();//remove session
            Session["use"] = null;
            return RedirectToAction("Index", "Home");
        }

        //hàm hash password MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
    }
}