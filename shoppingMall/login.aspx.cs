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
                "SELECT member.id, member.firstName, member.lastName, member.userName, member.profilePicture, member.email, member.sex, member.dateOfBirth, member.createdAt, memberRole.name AS userRole FROM member LEFT JOIN memberRole ON memberRole.memberId=member.id WHERE member.email='{0}' AND member.password='{1}'",
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
                    HttpCookie cookie = new HttpCookie("userInfo");
                    cookie.Values.Add("id", reader.GetValue(0).ToString());
                    cookie.Values.Add("firstName", reader.GetValue(1).ToString());
                    cookie.Values.Add("lastName", reader.GetValue(2).ToString());
                    cookie.Values.Add("userName", reader.GetValue(3).ToString());
                    cookie.Values.Add("profilePicture", reader.GetValue(4).ToString());
                    cookie.Values.Add("email", reader.GetValue(5).ToString());
                    cookie.Values.Add("sex", reader.GetValue(6).ToString());
                    cookie.Values.Add("dateOfBirth", reader.GetValue(7).ToString());
                    cookie.Values.Add("createdAt", reader.GetValue(8).ToString());
                    cookie.Values.Add("userRole", reader.GetValue(9).ToString());
                    cookie.Expires = DateTime.Now.AddDays(3);
                    Response.Cookies.Add(cookie);

                    String userRole = reader.GetValue(9).ToString();
                    LLoginMessage.Text = "Logged in Successfully! Redirecting to userHome page.";
                    if (userRole == "admin")
                        Response.Redirect("~/admin/home.aspx");
                    else
                        Response.Redirect("~/users/index.aspx");
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


            /*
// https://stackoverflow.com/questions/12891968/invalid-column-name-error-in-sqldatareader
using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL Connection String"].ConnectionString)) {
    var sql = "Select * from TB_User where UserID=@UserID";
    using (var cmd = new SqlCommand(sql, con)) {
        cmd.Parameters.AddWithValue("@UserID", Label1.Text);
        con.Open();
        using(var reader = cmd.ExecuteReader())
        {
            while(reader.Read())
            {
                // ...
            }
        }
    }
}
             */

            /*
// https://stackoverflow.com/questions/53175674/system-data-sqlclient-sqlexception-invalid-column-name
string connectionString = @"Data Source=DESKTOP-IE39262;Initial Catalog=Hospital;Integrated Security=True";
string sqlQuery = "INSERT INTO Dept (Dept_No, DNombre, Loc) VALUES (@Dept_No,@DNombre,@Loc)";
using (SqlConnection connection = new SqlConnection(connectionString))
using (SqlCommand command = new SqlCommand(sqlQuery, connection))
{
    command.Parameters.Add("@Dept_No", SqlDbType.VarChar,100).Value = dept.Dept_No;
    command.Parameters.Add("@DNombre", SqlDbType.VarChar, 100).Value = dept.DNombre;
    command.Parameters.Add("@Loc", SqlDbType.VarChar, 100).Value = dept.Loc;
    connection.Open();
    command.ExecuteNonQuery();
}             
             */