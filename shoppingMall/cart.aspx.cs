using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Json.Net;

namespace shoppingMall
{
    class CartItem
    {
        public string
            id,
            image,
            name,
            brand,
            category,
            countInStock,
            price;

        public CartItem(
            string id,
            string image,
            string name,
            string brand,
            string category,
            string countInStock,
            string price)
        {
            this.id = id;
            this.image = image;
            this.name = name;
            this.brand = brand;
            this.category = category;
            this.countInStock = countInStock;
            this.price = price;
        }
    }
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cartItemsCookie = new HttpCookie("cartItems");
            //HttpCookie cartItemsCookie = HttpContext.Current.Request.Cookies("cartItems");
            //Debug.WriteLine(cartItemsCookie);
            List<CartItem> cartItems;
                //HttpCookie toAddToCartCookie = HttpContext.Current.Request.Cookies["toAddToCart"];
            if (cartItemsCookie.Value != null)
            {
                Label1.Text = cartItemsCookie.Value.ToString(); //  cartItems.Count.ToString();
                cartItems = (List<CartItem>)new JavaScriptSerializer().DeserializeObject(cartItemsCookie.Value);
            }
            else cartItems = new List<CartItem>();


            HttpCookie toAddToCartCookie = Request.Cookies["toAddToCart"];
            if (toAddToCartCookie != null && toAddToCartCookie.Value.ToString() == "true")
            {
                HttpCookie productInfoCookie = Request.Cookies["productInfo"];
                cartItems.Add(new CartItem(
                    productInfoCookie.Values.Get("id").ToString(),
                    productInfoCookie.Values.Get("image").ToString(),
                    productInfoCookie.Values.Get("name").ToString(),
                    productInfoCookie.Values.Get("brand").ToString(),
                    productInfoCookie.Values.Get("category").ToString(),
                    productInfoCookie.Values.Get("countInStock").ToString(),
                    productInfoCookie.Values.Get("price").ToString()
                ));

                HttpCookie cartItemsCookieCurr = new HttpCookie("cartItems");
                var serializer = new JavaScriptSerializer();
                string serializedCartItems = serializer.Serialize(cartItems);
                //var deserializedResult = serializer.Deserialize<List<Person>>(serializedResult);
                //cartItemsCookie.Value = new JavaScriptSerializer().Serialize(cartItems);
                if (serializedCartItems != null)
                {
                    cartItemsCookie.Value = serializedCartItems;
                    cartItemsCookie.Expires = DateTime.Now.AddDays(15);
                    Response.Cookies.Add(cartItemsCookie);

                    //cartItemsCookieCurr.Value = serializedCartItems;
                    //cartItemsCookieCurr.Expires = DateTime.Now.AddDays(15);
                    //Response.Cookies.Add(cartItemsCookieCurr);
                }

                productInfoCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(productInfoCookie);
                toAddToCartCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(toAddToCartCookie);
            }

        }
    }
}