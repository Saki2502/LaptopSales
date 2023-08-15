using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Controllers
{
    public class CategoryController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Categories
        public ActionResult Index()
        {         
            return View();
        }

        // Trả về View Category
        public PartialViewResult CategoryPartial()
        {
            var cateList = db.Categories.OrderBy(x => x.CategoryName).ToList();
            return PartialView(cateList);
        }
    }
}