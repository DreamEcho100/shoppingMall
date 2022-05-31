using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userInfoCookie = new HttpCookie("userInfo");
            userInfoCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(userInfoCookie);

            HttpCookie cartCookie = new HttpCookie("cart");
            cartCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cartCookie);

            Response.Redirect("~/login.aspx");
        }
    }
}