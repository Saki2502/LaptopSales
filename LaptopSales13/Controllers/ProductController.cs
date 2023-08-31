using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Controllers
{
    public class ProductController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ProductListPartial(int? page, int? category, string sort, string fbrand, string fprice, string keyword)
        {
            List<string> brands = new List<string>();
            var brand = db.Products.Where(s => s.CategoryID == category).Select(s => new { s.Brand.BrandName });
            foreach (var i in brand.Distinct())
            {
                brands.Add(i.BrandName);
            }
            ViewBag.BrandName = brands;

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
                PagedList<Product> productList = (PagedList<Product>)db.Products
                                .OrderByDescending(x => x.ProductID)
                                .Where(x => x.CategoryID == category)
                                .ToPagedList(pageNumber, pageSize);

                // Tìm sản phẩm theo tên sản phẩm                
                if (!String.IsNullOrEmpty(keyword))
                {
                    ViewBag.keyword = keyword;
                    productList = (PagedList<Product>)productList.Where(s => s.ProductName.Contains(keyword))
                                                                 .ToPagedList(pageNumber, pageSize);
                }

                // Lọc product theo thương hiệu
                if (fbrand != null)
                {
                    foreach (var i in ViewBag.BrandName)
                    {
                        if (fbrand == i)
                        {
                            ViewBag.fbrand = i;
                            productList = (PagedList<Product>)productList.Where(x => x.Brand.BrandName == i)
                                                                         .ToPagedList(pageNumber, pageSize);
                        }
                    }
                }

                // Lọc product theo giá
                if (fprice != null)
                {
                    ViewBag.fprice = fprice;
                    if (fprice == "Dưới 15 triệu")
                    {                        
                        productList = (PagedList<Product>)productList.Where(x => x.Price < 15000000)
                                                                     .ToPagedList(pageNumber, pageSize);
                    }
                    else if (fprice == "Từ 15 - 25 triệu")
                    {
                        productList = (PagedList<Product>)productList.Where(x => (x.Price >= 15000000) && (x.Price <= 25000000))
                                                                     .ToPagedList(pageNumber, pageSize);
                    }
                    else if (fprice == "Trên 25 triệu")
                    {
                        productList = (PagedList<Product>)productList.Where(x => x.Price > 25000000)
                                                                     .ToPagedList(pageNumber, pageSize);
                    }
                }

                // Sắp xếp product
                if (sort != null)
                {
                    if (sort == "Giá giảm dần")
                    {
                        productList = (PagedList<Product>)productList.OrderByDescending(x => x.Price)
                                                                     .ToPagedList(pageNumber, pageSize);
                    }
                    else if (sort == "Giá tăng dần")
                    {
                        productList = (PagedList<Product>)productList.OrderBy(x => x.Price)
                                                                     .ToPagedList(pageNumber, pageSize);
                    }
                    else if (sort == "Tên A-Z")
                    {
                        productList = (PagedList<Product>)productList.OrderBy(x => x.ProductName)
                                                                     .ToPagedList(pageNumber, pageSize);
                    }
                }

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
    }
}
