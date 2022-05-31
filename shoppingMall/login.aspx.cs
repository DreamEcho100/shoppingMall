using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e) {
            SqlConnection conn = new SqlConnection
            {
                ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True"
            };
            // C:\\Users\\elmohandes\\source\\repos\\shoppingMall\\shoppingMall\\App_Data\\

            String sqlString = string.Format(
                "SELECT member.id, member.firstName, member.lastName, member.userName, member.profilePicture, member.email, member.sex, member.dateOfBirth, member.createdAt, member.role FROM member WHERE member.email='{0}' AND member.password='{1}'",
                txEmail.Text,
                txPassword.Text
            );

            SqlCommand command = new SqlCommand(sqlString, conn);

            SqlDataReader reader;

            try {
                conn.Open();
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    HttpCookie userInfoCookie = new HttpCookie("userInfo");
                    userInfoCookie.Values.Add("id", reader.GetValue(0).ToString());
                    userInfoCookie.Values.Add("firstName", reader.GetValue(1).ToString());
                    userInfoCookie.Values.Add("lastName", reader.GetValue(2).ToString());
                    userInfoCookie.Values.Add("userName", reader.GetValue(3).ToString());
                    userInfoCookie.Values.Add("profilePicture", reader.GetValue(4).ToString());
                    userInfoCookie.Values.Add("email", reader.GetValue(5).ToString());
                    userInfoCookie.Values.Add("sex", reader.GetValue(6).ToString());
                    userInfoCookie.Values.Add("dateOfBirth", reader.GetValue(7).ToString());
                    userInfoCookie.Values.Add("createdAt", reader.GetValue(8).ToString());
                    userInfoCookie.Values.Add("role", reader.GetValue(9).ToString());
                    userInfoCookie.Expires = DateTime.Now.AddDays(3);
                    Response.Cookies.Add(userInfoCookie);

                    String userRole = reader.GetValue(9).ToString();
                    LLoginMessage.Text = "Logged in Successfully! Redirecting to userHome page.";
                    if (userRole == "admin")
                        Response.Redirect("~/admin/home.aspx");
                    else
                        Response.Redirect("~/users/home.aspx");
                }
                else LLoginErrorMessage.Text = "Incorrect Email and/or password, Please try again!";
                conn.Close();
            } catch (Exception err) {
                //if (err.Number == 2677) { }

                LLoginErrorMessage.Text = err.Message;
            }
        }
    }
}
