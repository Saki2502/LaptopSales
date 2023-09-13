using LaptopSales13.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CrystalDecisions.CrystalReports.Engine;

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
            var u = Session["use"] as LaptopSales13.Models.Account;
            var orderList = db.Orders.Where(s => s.Customer.AccountID == u.AccountID).OrderBy(x => x.OrderID).ToPagedList(pageNumber, pageSize);

            return View(orderList);
        }

        // Export PDf Invoice
        public ActionResult ExportOrderListing()
        {
            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports/OrderListing.rpt")));
            rd.SetDataSource(db.Orders.ToList());

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();

            Stream str = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            str.Seek(0, SeekOrigin.Begin);
            string savedFilename = string.Format("OrderListing_{0}.pdf", DateTime.Now);
            return File(str, "application/pdf", savedFilename);
        }

        // GET: Order/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
             
            int tam = (int)db.spOrderTotal(5).FirstOrDefault().Value;
            ViewBag.Total = tam;

            List<OrderDetail> order = db.OrderDetails.Where(s=>s.OrderID == id).ToList();
            
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            
            Order o = db.Orders.FirstOrDefault(s=>s.OrderID == id);
            try
            {
                db.Orders.Remove(o);
                db.SaveChanges();
                return View("Index");
            }
            catch
            {
                return View();
            }
            
        }
    }
}