using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows.Forms;

namespace LaptopSales13.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        PasokonEntities db = new PasokonEntities();
        // GET: Admin/Home
        public ActionResult Index()
        {
            int userCount = db.Accounts.Count(); // Số user trong cơ sở dữ liệu
            int orderCount = db.Orders.Count(); // Số đơn hàng trong cơ sở dữ liệu

            ViewBag.UserCount = userCount;
            ViewBag.OrderCount = orderCount;

            return View();
        }
    }
}