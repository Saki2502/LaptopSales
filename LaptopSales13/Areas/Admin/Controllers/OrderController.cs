using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Admin/Order
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;

            var list = db.Orders.OrderByDescending(x => x.OrderID);

            // Tạo kích thước trang (pageSize) hay là số sản phẩm hiển thị trên 1 trang
            int pageSize = 5;
            int pageNumber = (page ?? 1);

            // 5. Trả về các sản phẩm được phân trang theo kích thước và số trang.
            return View(list.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Order/Details/5
        public ActionResult Details(int id)
        {
            List<OrderDetail> order = db.OrderDetails.Where(s => s.OrderID == id).ToList();
            ViewBag.OrderID = id;
            return View(order);
        }

        // GET: Admin/Order/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Order/Create
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

        // GET: Admin/Order/Edit/5
        public ActionResult Edit(int id)
        {
            Order o = db.Orders.FirstOrDefault(s => s.OrderID == id);
            return View(o);
        }

        // POST: Admin/Order/Edit/5
        [HttpPost]
        public ActionResult Edit(Order order, FormCollection collection)
        {
            try
            {
                Order o = db.Orders.FirstOrDefault(s=>s.OrderID == order.OrderID);

                o.Status = order.Status;
                o.PayType = order.PayType;
                o.EmployeeID = order.EmployeeID;

                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Order/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/Order/Delete/5
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
