using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace shoppingMall
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterSubmitButton_Click(object sender, EventArgs e) {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True";
            // C:\\Users\\elmohandes\\source\\repos\\shoppingMall\\shoppingMall\\App_Data\\

            String sqlString = string.Format(
                "INSERT INTO [member] ([firstName], [lastName], [email], [password], [sex], [dateOfBirth]) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')",
                txFirstName.Text,
                txLastName.Text,
                txEmail.Text,
                txPassword.Text,
                RBLSex.SelectedValue,
                txDateOfBirth.Text
            );
            SqlCommand command = new SqlCommand(sqlString, conn);

            try {
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            } catch (Exception err) {
                //if (err.Number == 2677) { }

                Console.WriteLine(err.Message);
                TL.Text = err.Message;
            }
            
        }
    }
}