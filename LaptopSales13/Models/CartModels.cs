using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace LaptopSales13.Models
{
    public class CartModels
    {
        PasokonEntities1 db = new PasokonEntities1();

        public Product Product { get; set; }
        //public int ProductID { get; set; }
        //public string ProductName { get; set; }
        //public string ProductImage { get; set; }
        //public decimal? UnitPrice { get; set; }
        public int Quantity { get; set; }
        //public decimal? Total { get { return UnitPrice * Quantity; } }


        public CartModels(Product product, int quantity)
        {
            Product = product;
            //ProductID = p.ProductID;
            //ProductName = p.ProductName;
            //ProductImage = p.ImageURL;
            //UnitPrice = p.Price;
            Quantity = quantity;
        }
    }
}