using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall.admin
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateNewProductButton_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection();

                conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True";
                // C:\\Users\\elmohandes\\source\\repos\\shoppingMall\\shoppingMall\\App_Data\\

                //String FUProfilePictureSrc = null;

                //if (FUProfilePicture.HasFile) {
                //    FUProfilePictureSrc = txUserName.Text + ".jpg";
                //    FUProfilePicture.SaveAs(Server.MapPath("usersProfilePicture") + "\\" + FUProfilePictureSrc);
                //}

                String sqlString = string.Format(
                    "INSERT INTO [product] ([name], [price], [image], [description], [countInStock], [brand], [category]) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')",
                    tBCNPName.Text,
                    tBCNPPrice.Text,
                    tBCNPImage.Text,
                    tBCNPDescription.Text,
                    tBCNPCountInStock.Text,
                    tBCNPBrand.Text,
                    tBCNPCategory.Text
                );
                SqlCommand command = new SqlCommand(sqlString, conn);

                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();

                LCNPSuccess.Text = "Inserted Successfully!";
                //Response.Redirect(Request.RawUrl);
                gVProductsList.DataBind();
                tBCNPName.Text = "";
                tBCNPPrice.Text = "0";
                tBCNPImage.Text = "";
                tBCNPDescription.Text = "";
                tBCNPCountInStock.Text = "0";
                tBCNPBrand.Text = "";
                tBCNPCategory.Text = "";
            }
            catch (Exception err)
            {
                //if (err.Number == 2677) { }

                LCNPError.Text = err.Message;
            }

        }
    }
}

/*
 using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall.admin
{
    public partial class productsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateNewProductButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();

            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True";
            // C:\\Users\\elmohandes\\source\\repos\\shoppingMall\\shoppingMall\\App_Data\\

            //String FUProfilePictureSrc = null;

            //if (FUProfilePicture.HasFile) {
            //    FUProfilePictureSrc = txUserName.Text + ".jpg";
            //    FUProfilePicture.SaveAs(Server.MapPath("usersProfilePicture") + "\\" + FUProfilePictureSrc);
            //}

            String sqlString = string.Format(
                "INSERT INTO [product] ([name], [price], [image], [description], [countInStock], [brand], [category]) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')",
                tBCNPName.Text,
                tBCNPPrice.Text,
                tBCNPImage.Text,
                tBCNPDescription.Text,
                tBCNPCountInStock.Text,
                tBCNPBrand.Text,
                tBCNPCategory.Text
            );
            SqlCommand command = new SqlCommand(sqlString, conn);

            try {
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();

                LCNPSuccess.Text = "Registered Successfully!";
                //Response.Redirect(Request.RawUrl);
                gVProductsList.DataBind();
                tBCNPName.Text = "";
                tBCNPPrice.Text = "0";
                tBCNPImage.Text = "";
                tBCNPDescription.Text = "";
                tBCNPCountInStock.Text = "0";
                tBCNPBrand.Text = "";
                tBCNPCategory.Text = "";
            } catch (Exception err) {
                //if (err.Number == 2677) { }

                LCNPError.Text = err.Message;
            }
            
        }
    }
}
 */