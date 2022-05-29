using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall.admin
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GVOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = GVOrders.Rows[index];

            if (e.CommandName == "UpdateDeliveryDate")
            {
                String id = Convert.ToString(GVOrders.DataKeys[selectedRow.RowIndex][0]);

                try
                {
                    LCNPUodateDeliveryDateSuccess.Text = "";
                    LCNPUodateDeliveryDateError.Text = "";

                    SqlConnection conn = new SqlConnection();

                    conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True";

                    String sqlString = string.Format(
                        "UPDATE [order] SET [deliveredAt]=GETDATE() WHERE [order].[id]='{0}'",
                        id
                    );
                    SqlCommand command = new SqlCommand(sqlString, conn);

                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();

                    GVOrders.DataBind();
                    LCNPUodateDeliveryDateSuccess.Text = string.Format("Updated order with id ({0}) Delivey date successfully!", id);
                }
                catch (Exception err)
                {
                    LCNPUodateDeliveryDateError.Text = err.Message;
                }
            }
        }
    }
}