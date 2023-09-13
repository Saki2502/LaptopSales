using LaptopSales13.Models;
using Microsoft.Owin.BuilderProperties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Header;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace LaptopSales13.Controllers
{
    public class CartController : Controller
    {
        PasokonEntities db = new PasokonEntities();

        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }

        private int IsExistingCheck(int? id)
        {
            List<CartModels> listCart = Session["Cart"] as List<CartModels>;
            for (int i = 0; i < listCart.Count; i++)
            {
                if (listCart[i].Product.ProductID == id) return i;
            }
            return -1;
        }

        // Hàm thêm sản phẩm vào giỏ hàng
        public ActionResult AddCart(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            if (Session["Cart"] == null)
            {
                List<CartModels> listCart = new List<CartModels>
                {
                    new CartModels(db.Products.Find(id),1)
                };
                Session["Cart"] = listCart;
            }
            else
            {
                List<CartModels> listCart = (List<CartModels>)Session["Cart"];
                int check = IsExistingCheck(id);
                if (check == -1)
                    listCart.Add(new CartModels(db.Products.Find(id), 1));
                else
                    listCart[check].Quantity++;
                Session["Cart"] = listCart;
            }
            return View("Index");
        }



        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = IsExistingCheck(id);
            List<CartModels> listCart = (List<CartModels>)Session["Cart"];
            listCart.RemoveAt(check);
            return View("Index");
        }

        public ActionResult UpdateCart(FormCollection frc)
        {
            string[] quantities = frc.GetValues("quantity");
            List<CartModels> listCart = (List<CartModels>)Session["Cart"];
            for (int i = 0; i < listCart.Count; i++)
            {
                listCart[i].Quantity = Convert.ToInt32(quantities[i]);
            }
            Session["Cart"] = listCart;
            return View("Index");
        }

        public ActionResult Checkout()
        {

            return View("Checkout");
        }

        public ActionResult ProcessOrder(FormCollection frc)
        {
            List<CartModels> listCart = (List<CartModels>)Session["Cart"];
            var u = Session["use"] as LaptopSales13.Models.Account;
            Account a = db.Accounts.FirstOrDefault(s => s.AccountID == u.AccountID);
            a.FirstName = frc["firstName"];
            a.LastName = frc["lastName"];
            a.PhoneNumber = frc["phone"];
            a.Address = frc["address"];
            db.SaveChanges();
            if (db.Customers.FirstOrDefault(s => s.AccountID == u.AccountID) == null)
            {
                var customer = new LaptopSales13.Models.Customer()
                {
                    AccountID = u.AccountID
                };
                db.Customers.Add(customer);
                db.SaveChanges();
            }


            //1. Lưu thông tin vào bảng Orders
            //ViewBag.Paytype = "";
            int cus = db.Customers.FirstOrDefault(s => s.AccountID == u.AccountID).CustomerID;
            var order = new LaptopSales13.Models.Order()
            {
                CustomerID = cus,
                OrderDate = DateTime.Now,

                PayType = "Cash",
                Status = "Chờ xác nhận"
            };
            db.Orders.Add(order);
            db.SaveChanges();

            //2. Lưu thông tin vào bảng Order Details
            foreach (CartModels cart in listCart)
            {
                OrderDetail orderDetail = new OrderDetail()
                {
                    OrderID = order.OrderID,
                    ProductID = cart.Product.ProductID,
                    Quantity = short.Parse(cart.Quantity.ToString()),
                    UnitPrice = decimal.Parse(cart.Product.Price.ToString())
                };
                db.OrderDetails.Add(orderDetail);
                //db.urUpdateSLSP();
                db.SaveChanges();
            }
            //3. xóa giỏ hàng khỏi session
            Session.Remove("Cart");
            return View("OrderSuccess");

        }
    }
}