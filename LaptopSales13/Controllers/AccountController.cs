using LaptopSales13.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Scrypt;
using System.Security.Cryptography;
using System.Text;
using LaptopSales13.Others;
using System.Data.Entity.Infrastructure;

namespace LaptopSales13.Controllers
{
    public class AccountController : Controller
    {
        PasokonEntities1 db = new PasokonEntities1();

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
                    account.Password = Util.GetMD5(r.Password);
                    account.Email = r.Email;
                    db.Configuration.ValidateOnSaveEnabled = false;
                    // Thêm người dùng  mới
                    db.Accounts.Add(account);
                    // Lưu lại vào cơ sở dữ liệu
                    db.SaveChanges();
                    // Thông báo
                    ViewBag.error = "Đăng ký thành công! Vui lòng đăng nhập tài khoản";
                    // Trả về trang đăng nhập
                    return RedirectToAction("LogIn");
                }
            }
            return View();
        }

        // Get: Account/LogIn
        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogIn(LoginViewModel l)
        {
            if (ModelState.IsValid)
            {
                string userName = l.Username.ToString();
                var password = GetMD5(l.Password);
                var islogin = db.Accounts.SingleOrDefault(x => x.UserName.Equals(userName) && x.Password.Equals(password));

                if (islogin != null)
                {
                    Session["idUser"] = islogin.AccountID;
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
                    return RedirectToAction("LogIn");
                }
            }
            return View();
        }

        // Đăng xuất
        public ActionResult LogOut()
        {
            //Session.Clear();//remove session
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

        ////GET: Register

        //public ActionResult Register()
        //{
        //    return View();
        //}

        ////POST: Register
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Register(Account _user)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var check = db.Accounts.FirstOrDefault(s => s.UserName == _user.UserName);
        //        if (check == null)
        //        {
        //            _user.Password = GetMD5(_user.Password);
        //            db.Configuration.ValidateOnSaveEnabled = false;
        //            db.Accounts.Add(_user);
        //            db.SaveChanges();
        //            return RedirectToAction("Index");
        //        }
        //        else
        //        {
        //            ViewBag.error = "Username already exists";
        //            return View();
        //        }
        //    }
        //    return View();


        //}

        ////create a string MD5
        //public static string GetMD5(string str)
        //{
        //    MD5 md5 = new MD5CryptoServiceProvider();
        //    byte[] fromData = Encoding.UTF8.GetBytes(str);
        //    byte[] targetData = md5.ComputeHash(fromData);
        //    string byte2String = null;

        //    for (int i = 0; i < targetData.Length; i++)
        //    {
        //        byte2String += targetData[i].ToString("x2");

        //    }
        //    return byte2String;
        //}

        //public ActionResult LogIn()
        //{
        //    return View();
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult LogIn(string username, string password)
        //{
        //    if (ModelState.IsValid)
        //    {


        //        var f_password = GetMD5(password);
        //        var data = db.Accounts.Where(s => s.UserName.Equals(username) && s.Password.Equals(f_password)).ToList();
        //        if (data.Count() > 0)
        //        {
        //            //add session
        //            Session["FullName"] = data.FirstOrDefault().FirstName + " " + data.FirstOrDefault().LastName;
        //            Session["Email"] = data.FirstOrDefault().Email;
        //            Session["idUser"] = data.FirstOrDefault().AccountID;
        //            return RedirectToAction("Index","Home");
        //        }
        //        else
        //        {
        //            ViewBag.error = "Login failed";
        //            return RedirectToAction("LogIn");
        //        }
        //    }
        //    return View();
        //}


        ////Logout
        //public ActionResult Logout()
        //{
        //    Session.Clear();//remove session
        //    return RedirectToAction("LogIn");
        //}
    }
}