using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThucHanhWeb
{
    public partial class Themtin : System.Web.UI.Page
    {
        String conectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((int)Session["user_id"] == 0)
            {
                Response.Redirect("~/Dangnhap.aspx");
            }

            // lstChuyenMuc
            if (!IsPostBack)
            {

                SqlConnection Cnn = new SqlConnection(conectionString);
                Cnn.Open();
                SqlCommand Cmd = new SqlCommand("tblCategories_getAll", Cnn);
                Cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = Cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lstChuyenmuc.Items.Add(new ListItem(reader.GetString(1), reader.GetInt32(0).ToString()));
                    }
                }
                reader.Close();
                Cmd.Dispose();
                Cnn.Close();
                Cnn.Dispose();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePass.aspx");

        }

        protected void LinkButton_Login(object sender, EventArgs e)
        {
            Response.Redirect("~/Dangnhap.aspx");
        }

        protected void lstChuyenmuc_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            SqlConnection Cnn = new SqlConnection(conectionString);
            Cnn.Open();
            SqlCommand cmd = new SqlCommand("tblNews_insertNews", Cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@title", txtTitles.Text);
            cmd.Parameters.AddWithValue("@abstract", txtDescript.Text);
            cmd.Parameters.AddWithValue("@content", txtContents.Text);
            cmd.Parameters.AddWithValue("@postedDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@viewTimes", 1);
            cmd.Parameters.AddWithValue("@isAproved", true);
            cmd.Parameters.AddWithValue("@userID", (int) Session["user_id"]);
            cmd.Parameters.AddWithValue("@thumbnail", Server.MapPath(Fuld.FileName));
            var newsID = cmd.ExecuteScalar();
            cmd.Dispose();

            SqlCommand cmd2 = new SqlCommand("tblNewsCategory_insert", Cnn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.AddWithValue("@categoryID", Int32.Parse(lstChuyenmuc.SelectedValue));
            cmd2.Parameters.AddWithValue("@newsID", newsID);

            Cnn.Close();
            Cnn.Dispose();
            lblMessage.Text = "Ghi nhận thành công";

        }

        protected void txtTitles_TextChanged(object sender, EventArgs e)
        {

        }

        protected void changPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doimatkhau.aspx");
        }

    }
}