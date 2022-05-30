using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall.admin
{
    public partial class images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uploadImageButton_Click(object sender, EventArgs e)
        {
            try
            {
                LUploadImageSuccess.Text = "";
                LUploadImageError.Text = "";
                String FUProductsImagesSrc = null;

                if (FUImage.HasFile)
                {
                    FUProductsImagesSrc = FUImage.FileName + ".jpg";
                    FUImage.SaveAs(Server.MapPath("..\\images\\" + DDLPaths.SelectedValue) + "\\" + FUProductsImagesSrc);
                }
                LUploadImageSuccess.Text = "Uploaded Successfully!, Path: " + "\\images\\" + DDLPaths.SelectedValue + "\\" + FUProductsImagesSrc;
            }
            catch (Exception err)
            {
                LUploadImageError.Text = err.Message;
            }
        }
    }
}