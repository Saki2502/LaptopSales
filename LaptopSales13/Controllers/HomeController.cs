using LaptopSales13.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Controllers
{
    public class HomeController : Controller
    {
        PasokonEntities1 db = new PasokonEntities1();

        public ActionResult Index()
        {
            HomeModels model = new HomeModels();
            model.ListCategory = db.Categories.ToList();
            model.ListProduct = db.Products.ToList();
            model.ListTag = db.Tags.ToList();
            model.ListProductTag = db.ProductTags.ToList();
            model.ListSupplier = db.Suppliers.ToList();
            return View(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}