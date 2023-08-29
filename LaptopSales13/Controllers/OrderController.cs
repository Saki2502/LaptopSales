using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Controllers
{
    public class OrderController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Order
        public ActionResult Index(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 5;
            var orderList = db.Orders.OrderByDescending(x => x.OrderID).ToPagedList(pageNumber, pageSize);
            return View(orderList);
        }

        // GET: Order/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }
    }
}