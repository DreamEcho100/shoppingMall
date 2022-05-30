using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoppingMall
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Uri theRealURL = new Uri(HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl);
                string id = HttpUtility.ParseQueryString(theRealURL.Query).Get("id");

                // Load sample data only once, when the page is first loaded.
                if (id == null)
                {
                    DLProducts.DataSource = CreateProductsDataSource();
                    DLProducts.DataBind();
                }
                else
                {
                    DLProduct.DataSource = CreateProductByIdDataSource(Int32.Parse(id));
                    DLProduct.DataBind();
                }

                // Manually register the event-handling method for the 
                // ItemCommand event.
                DLProducts.ItemCommand +=
                    new DataListCommandEventHandler(this.ShowProducts);
                // ItemCommand event.
                DLProducts.ItemCommand +=
                    new DataListCommandEventHandler(this.ShowProductById);
            }
        }

        ICollection CreateProductsDataSource()
        {

            // Create sample data for the DataList control.
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection
            {
                ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True"
            };

            String sqlString = "SELECT id, image, name, brand, category, price FROM product";

            SqlCommand command = new SqlCommand(sqlString, conn);

            try
            {
                conn.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    dt.Load(reader);
                }
                conn.Close();
            }
            catch (Exception err)
            {
                //LLoginErrorMessage.Text = err.Message;
            }

            DataView dv = new DataView(dt);
            return dv;
        }
        public void ShowProducts(object source, DataListCommandEventArgs e)
        {
            // Set the SelectedIndex property to select an item in the DataList.
            DLProducts.SelectedIndex = e.Item.ItemIndex;

            // Rebind the data source to the DataList to refresh the control.
            DLProducts.DataSource = CreateProductsDataSource();
            DLProducts.DataBind();
        }

        ICollection CreateProductByIdDataSource(int id)
        {

            // Create sample data for the DataList control.
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection
            {
                ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|ShopingMallDatabase.mdf;Integrated Security=True"
            };

            String sqlString = string.Format("SELECT id, image, name, description, brand, category, countInStock, price FROM product WHERE id='{0}'", id);

            SqlCommand command = new SqlCommand(sqlString, conn);

            try
            {
                conn.Open();
                SqlDataReader reader;
                using (reader = command.ExecuteReader())
                {
                    dt.Load(reader);
                }
                conn.Close();
            }
            catch (Exception err)
            {
                //LLoginErrorMessage.Text = err.Message;
                HttpCookie cookie = new HttpCookie("error_product");
                cookie.Values.Add("error", err.Message);
                cookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(cookie);
            }

            foreach (DataRow row in dt.Rows)
            {
                if (row["id"].ToString() != null)
                {
                    HttpCookie cookie = new HttpCookie("productInfo");
                    cookie.Values.Add("id", row["id"].ToString());
                    cookie.Values.Add("image", row["image"].ToString());
                    cookie.Values.Add("name", row["name"].ToString());
                    cookie.Values.Add("description", row["description"].ToString());
                    cookie.Values.Add("brand", row["brand"].ToString());
                    cookie.Values.Add("category", row["category"].ToString());
                    cookie.Values.Add("countInStock", row["countInStock"].ToString());
                    cookie.Values.Add("price", row["price"].ToString());
                    cookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(cookie);

                    HttpCookie toAddToCartCookie = new HttpCookie("toAddToCart");
                    toAddToCartCookie.Value = "true";
                    toAddToCartCookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(toAddToCartCookie);
                }
            }

            DataView dv = new DataView(dt);
            return dv;
        }
        public void ShowProductById(object source, DataListCommandEventArgs e)
        {
            // Set the SelectedIndex property to select an item in the DataList.
            DLProduct.SelectedIndex = e.Item.ItemIndex;

            Uri theRealURL = new Uri(HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.RawUrl);
            string id = HttpUtility.ParseQueryString(theRealURL.Query).Get("id");

            // Rebind the data source to the DataList to refresh the control.
            if (id != null)
            {
                DLProduct.DataSource = CreateProductByIdDataSource(Int32.Parse(id));
                DLProduct.DataBind();
            }
        }

        protected void AddProductToCartButton_Click(object sender, EventArgs e)
        {
            HttpCookie toAddToCartCookie = new HttpCookie("toAddToCart");
            toAddToCartCookie.Value = "true";
            toAddToCartCookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(toAddToCartCookie);
            Response.Redirect("~/cart.aspx");
        }
    }
}