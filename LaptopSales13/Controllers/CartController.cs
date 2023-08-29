using LaptopSales13.Models;
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

            var customer = new LaptopSales13.Models.Customer()
            {
                FirstName = frc["firstName"],
                LastName = frc["lastName"],
                PhoneNumber = frc["phone"],
                Email = frc["email"],
                Address = frc["address"]
            };
            db.Customers.Add(customer);
            db.SaveChanges();

            //1. Lưu thông tin vào bảng Orders
            var order = new LaptopSales13.Models.Order()
            {
                CustomerID = customer.CustomerID,
                OrderDate = DateTime.Now,
                //PayType = "Cash",
                Status = "Processing"
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
                db.urUpdateSLSP();
                db.SaveChanges();                
            }
            //3. xóa giỏ hàng khỏi session
            Session.Remove("Cart");
            return View("OrderSuccess");
        }

        // Work with Paypal Payment
        //private Payment payment;

        // Create a paypment using an APIContext
        //private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        //{
        //    var listItems = new ItemList() { items = new List<Item>() };

        //    List<Cart> listCarts = (List<Cart>)Session[strCart];
        //    foreach (var cart in listCarts)
        //    {
        //        listItems.items.Add(new Item()
        //        {
        //            name = cart.Product.ProductName,
        //            currency = "USD",
        //            price = cart.Product.Price.ToString(),
        //            quantity = cart.Quantity.ToString(),
        //            sku = "sku"
        //        });
        //    }

        //    var payer = new Payer() { payment_method = "paypal" };

        //    // Do the configuration RedirectURLs here with redirectURLs object
        //    var redirUrls = new RedirectUrls()
        //    {
        //        cancel_url = redirectUrl,
        //        return_url = redirectUrl
        //    };

        //    // Create details object
        //    var details = new Details()
        //    {
        //        tax = "1",
        //        shipping = "2",
        //        subtotal = listCarts.Sum(x => x.Quantity * x.Product.Price).ToString()
        //    };

        //    // Create amount object
        //    var amount = new Amount()
        //    {
        //        currency = "USD",
        //        total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) + Convert.ToDouble(details.subtotal)).ToString(),// tax + shipping + subtotal
        //        details = details
        //    };

        //    // Create transaction
        //    var transactionList = new List<Transaction>();
        //    transactionList.Add(new Transaction()
        //    {
        //        description = "Chien Testing transaction description",
        //        invoice_number = Convert.ToString((new Random()).Next(100000)),
        //        amount = amount,
        //        item_list = listItems
        //    });

        //    payment = new Payment()
        //    {
        //        intent = "sale",
        //        payer = payer,
        //        transactions = transactionList,
        //        redirect_urls = redirUrls
        //    };

        //    return payment.Create(apiContext);
        //}

        //// Create ExecutePayment method
        //private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        //{
        //    var paymentExecution = new PaymentExecution()
        //    {
        //        payer_id = payerId
        //    };
        //    payment = new Payment() { id = paymentId };
        //    return payment.Execute(apiContext, paymentExecution);
        //}

        //// Create PaymentWithPaypal method
        //public ActionResult PaymentWithPaypal()
        //{
        //    // Gettings context from the paypal bases on clientId and clientSecret for payment
        //    APIContext apiContext = PaypalConfiguration.GetAPIContext();

        //    try
        //    {
        //        string payerId = Request.Params["PayerID"];
        //        if (string.IsNullOrEmpty(payerId))
        //        {
        //            // Creating a payment
        //            string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/ShoppingCart/PaymentWithPaypal?";
        //            var guid = Convert.ToString((new Random()).Next(100000));
        //            var createdPayment = CreatePayment(apiContext, baseURI + "guid=" + guid);

        //            // Get links returned from paypal response to create call funciton
        //            var links = createdPayment.links.GetEnumerator();
        //            string paypalRedirectUrl = string.Empty;

        //            while (links.MoveNext())
        //            {
        //                Links link = links.Current;
        //                if (link.rel.ToLower().Trim().Equals("approval_url"))
        //                {
        //                    paypalRedirectUrl = link.href;
        //                }
        //            }

        //            Session.Add(guid, createdPayment.id);
        //            return Redirect(paypalRedirectUrl);
        //        }
        //        else
        //        {
        //            // This one will be executed when we have received all the payment params from previous call
        //            var guid = Request.Params["guid"];
        //            var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
        //            if (executedPayment.state.ToLower() != "approved")
        //            {
        //                //Remove shopping cart session
        //                Session.Remove(strCart);
        //                return View("Failure");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        PaypalLogger.Log("Error: " + ex.Message);
        //        //Remove shopping cart session
        //        Session.Remove(strCart);
        //        return View("Failure");
        //    }

        //    //Remove shopping cart session
        //    Session.Remove(strCart);
        //    return View("Success");
        //}
    }
}