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

            String FUProfilePictureSrc = null;

            if (FUProfilePicture.HasFile) {
                FUProfilePictureSrc = txUserName.Text + ".jpg";
                FUProfilePicture.SaveAs(Server.MapPath("usersProfilePicture") + "\\" + FUProfilePictureSrc);
            }

            String sqlString = string.Format(
                "INSERT INTO [member] ([firstName], [lastName], [userName], [profilePicture], [email], [password], [sex], [dateOfBirth]) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')",
                txFirstName.Text,
                txLastName.Text,
                txUserName.Text,
                FUProfilePictureSrc,
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

                LRegisterMessage.Text = "Registered Successfully!";
            } catch (Exception err) {
                //if (err.Number == 2677) { }

                LRegisterErrorMessage.Text = err.Message;
            }
            
        }
    }
}