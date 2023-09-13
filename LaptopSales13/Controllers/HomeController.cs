using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopSales13.Controllers
{
    public class HomeController : Controller
    {
        PasokonEntities db = new PasokonEntities();

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

        [HttpGet]
        public ActionResult Search(string keyword, int? page)
        {
            var pageNumber = page ?? 1; // Lấy trang hiện tại từ tham số page, nếu không có thì mặc định là 1
            var pageSize = 20;

            if (string.IsNullOrWhiteSpace(keyword))
            {
                // Trường hợp người dùng không nhập keyword, có thể hiển thị thông báo lỗi hoặc chuyển hướng về trang chính.
                return RedirectToAction("Index");
            }

            var searchResults = db.Products
                .OrderByDescending(x => x.ProductID)
                .Where(x => x.Description.Contains(keyword))
                .ToPagedList(pageNumber, pageSize);

            // Gán kết quả tìm kiếm vào ViewBag để hiển thị trong view.
            ViewBag.SearchResults = searchResults;

            // Trả về view kết quả tìm kiếm hoặc làm gì đó khác với kết quả tìm kiếm này.

            // Tính toán số lượng kết quả và mục bắt đầu và kết thúc trên trang hiện tại.
            int totalItems = searchResults.TotalItemCount;
            int startItem = (pageNumber - 1) * pageSize + 1;
            int endItem = Math.Min(startItem + pageSize - 1, totalItems);

            // Gán thông tin này vào ViewBag để sử dụng trong view.
            ViewBag.TotalItems = totalItems;
            ViewBag.StartItem = startItem;
            ViewBag.EndItem = endItem;

            return View(searchResults);
        }
    }
}