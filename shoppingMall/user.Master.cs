using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall
{
    public partial class user : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userInfo = Request.Cookies["userInfo"];

            if (userInfo == null)
            {
                Response.Redirect("/login.aspx");
                return;
            }

            if (userInfo.Values["role"] == "admin")
            {
                HLAdminHome.Visible = true;
            }

            if (userInfo.Values["profilePicture"].StartsWith("https")) UserProfilePicture.ImageUrl = userInfo.Values["profilePicture"];
            else UserProfilePicture.ImageUrl = "~/images/users/" + userInfo.Values["profilePicture"];

            WelcomeUserName.Text = userInfo.Values["userName"];
        }
    }
}