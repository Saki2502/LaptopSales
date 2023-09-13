using LaptopSales13.Models;
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
        public ActionResult Index()
        {
            var sp = db.Accounts.OrderByDescending(x => x.AccountID);
            return View(sp);
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
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

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
            return View();
        }

        // POST: Admin/User/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

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
            return View();
        }

        // POST: Admin/User/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
