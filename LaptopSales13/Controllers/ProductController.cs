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
    public class ProductController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Product 
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ProductListPartial(int? page, int? category)
        {
            var pageNumber = page ?? 1;
            var pageSize = 20;
            var cate = db.Categories.Where(s => s.CategoryID == category).Select(s => new { s.CategoryName }).Take(1);
            foreach (var i in cate)
            {
                ViewBag.CateName = i.CategoryName;
            }
            if (category != null)
            {
                ViewBag.category = category;                
                var productList = db.Products
                                .OrderByDescending(x => x.ProductID)
                                .Where(x => x.CategoryID == category)
                                .ToPagedList(pageNumber, pageSize);
                return PartialView(productList);
            }
            else
            {
                var productList = db.Products.OrderByDescending(x => x.ProductID).ToPagedList(pageNumber, pageSize);
                return PartialView(productList);
            }
        }

        // GET: Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Product/Create
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

        // GET: Product/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Product/Edit/5
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

        // GET: Product/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Product/Delete/5
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
