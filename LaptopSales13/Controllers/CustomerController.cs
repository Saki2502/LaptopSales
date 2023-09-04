using LaptopSales13.Models;
using LaptopSales13.Others;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Controllers
{
    public class CustomerController : Controller
    {
        PasokonEntities1 db = new PasokonEntities1();

        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MyProfile()
        {
            return View();
        }

        public ActionResult EditProfile()
        {
            var u = Session["use"] as LaptopSales13.Models.Account;
            Account a = db.Accounts.FirstOrDefault(s => s.AccountID == u.AccountID);
            return View(a);
        }

        [HttpPost]
        public ActionResult EditProfile(FormCollection fc)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var u = Session["use"] as LaptopSales13.Models.Account;
                    Account a = db.Accounts.FirstOrDefault(s => s.AccountID == u.AccountID);
                    a.LastName = fc["lastName"];
                    a.FirstName = fc["firstName"];
                    a.Address = fc["address"];
                    a.PhoneNumber = fc["phone"];
                    // Thông báo
                    //ViewBag.error = "Lưu thành công!";
                    db.SaveChanges();
                    return RedirectToAction("MyProfile");
                }
                catch
                {
                    return View();
                }
            }
            return View();
        }
    }
}