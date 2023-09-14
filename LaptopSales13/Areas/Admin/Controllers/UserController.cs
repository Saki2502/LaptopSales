using LaptopSales13.Models;
using LaptopSales13.Others;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Admin/User
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            int pageSize = 5;
            int pageNumber = (page ?? 1);

            var sp = db.Accounts.OrderByDescending(x => x.AccountID);
            return View(sp.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/User/Details/5
        public ActionResult Details(int id)
        {
            var a = db.Accounts.Find(id);
            return View(a);
        }

        // GET: Admin/User/Create
        public ActionResult Create()
        {
            
            return View();
        }

        // POST: Admin/User/Create
        [HttpPost]
        public ActionResult Create(FormCollection c, Account account)
        {
            try
            {
                Account a = new Account();
                a = account;

                a.UserName = account.UserName;
                a.Password = Util.GetMD5(account.Password);
                a.Email = account.Email;
                a.FirstName = account.FirstName;
                a.LastName = account.LastName;
                a.PhoneNumber = account.PhoneNumber;
                a.Address = account.Address;

                db.Accounts.Add(a);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/User/Edit/5
        public ActionResult Edit(int id)
        {
            Account a = db.Accounts.FirstOrDefault(s => s.AccountID == id);
            return View(a);
        }

        // POST: Admin/User/Edit/5
        [HttpPost]
        public ActionResult Edit(Account account, FormCollection collection)
        {
            try
            {
                Account a = db.Accounts.FirstOrDefault(s => s.AccountID == account.AccountID);

                a.UserName = account.UserName;
                a.Password = Util.GetMD5(account.Password);
                a.Email= account.Email;
                a.Role = account.Role;
                a.FirstName = account.FirstName;
                a.LastName = account.LastName;
                a.Address= account.Address;

                // lưu lại
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/User/Delete/5
        public ActionResult Delete(int id)
        {
            Account account = db.Accounts.FirstOrDefault(s=>s.AccountID == id);
            return View(account);
        }

        // POST: Admin/User/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Account account= db.Accounts.First(s=>s.AccountID == id);
                db.Accounts.Remove(account);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
