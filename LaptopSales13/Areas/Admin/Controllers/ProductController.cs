using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Admin/Product
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;

            var sp = db.Products.OrderByDescending(x => x.ProductID);

            // Tạo kích thước trang (pageSize) hay là số sản phẩm hiển thị trên 1 trang
            int pageSize = 5;
            int pageNumber = (page ?? 1);

            // 5. Trả về các sản phẩm được phân trang theo kích thước và số trang.
            return View(sp.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Home/Details/5 
        public ActionResult Details(int id)
        {
            var p = db.Products.Find(id);
            return View(p);
        }

        // GET: Admin/Home/Create
        public ActionResult Create()
        {
            ViewData["NCC"] = new SelectList(db.Suppliers, "SupplierID", "CompanyName");
            ViewData["DM"] = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewData["TH"] = new SelectList(db.Brands, "BrandID", "BrandName");
            return View();
        }

        // POST: Admin/Home/Create
        [HttpPost]
        public ActionResult Create(Product product, FormCollection collection)
        {
            try
            {
                Product p = new Product();
                p = product;

                p.CategoryID = int.Parse(collection["DM"]);
                p.SupplierID = int.Parse(collection["NCC"]);
                p.BrandID = int.Parse(collection["TH"]);

                db.Products.Add(p);

                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Home/Edit/5
        public ActionResult Edit(int id)
        {
            // Hiển thị dropdownlist
            Product p = db.Products.FirstOrDefault(s => s.ProductID == id);
            ViewData["NCC"] = new SelectList(db.Suppliers, "SupplierID", "CompanyName", p.SupplierID);
            ViewData["DM"] = new SelectList(db.Categories, "CategoryID", "CategoryName", p.CategoryID);
            ViewData["TH"] = new SelectList(db.Brands, "BrandID", "BrandName", p.BrandID);
            // 
            return View(p);

        }

        // POST: Admin/Home/Edit/5
        [HttpPost]
        public ActionResult Edit(Product product, FormCollection collection)
        {
            try
            {
                // Sửa sản phẩm theo mã sản phẩm
                Product p = db.Products.FirstOrDefault(s => s.ProductID == product.ProductID);

                p.ProductName = product.ProductName;
                p.Description = product.Description;
                p.ImageURL = product.ImageURL;
                p.Price = product.Price;
                p.Quantity = product.Quantity;
                p.CategoryID = int.Parse(collection["DM"]);
                p.SupplierID = int.Parse(collection["NCC"]);
                p.CPU = product.CPU;
                p.VGA = product.VGA;
                p.RAM = product.RAM;
                p.SSD = product.SSD;
                p.Pin = product.Pin;
                p.Weight = product.Weight;
                p.BrandID = int.Parse(collection["TH"]);

                // lưu lại
                db.SaveChanges();
                // xong chuyển qua index
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


        // GET: Admin/Home/Delete/5
        public ActionResult Delete(int id)
        {
            Product p = db.Products.FirstOrDefault(s => s.ProductID == id);
            return View(p);
        }

        // POST: Admin/Home/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                Product p = db.Products.First(s => s.ProductID == id);
                // Xoá
                db.Products.Remove(p);
                // Lưu lại
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