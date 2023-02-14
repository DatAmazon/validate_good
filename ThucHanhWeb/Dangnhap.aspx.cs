using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThucHanhWeb
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string encryption(string password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdata.Append(encrypt[i].ToString());
            }
            return encryptdata.ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
            SqlConnection myCnn = new SqlConnection(connectionString);
            myCnn.Open();
            SqlCommand myCmd = new SqlCommand("tblUsers_login", myCnn);
            myCmd.CommandType = CommandType.StoredProcedure;
            myCmd.Parameters.AddWithValue("@userName", txtName.Text);
            myCmd.Parameters.AddWithValue("@Password", encryption(txtPass.Text));
            SqlDataReader rd = myCmd.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    Session["user_id"] = rd.GetInt32(0);
                    Session["user_name"] = rd.GetString(1);
                    Session["user_pass"] = rd.GetString(2);
                }
                Response.Redirect("~/Themtin.aspx");
            }
            else
            {
                lblErrorPass.Text = "Đăng nhập thất bại";
            }
            rd.Close();
            myCmd.Dispose();
            myCnn.Close();
            myCnn.Dispose();

        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Doimatkhau.aspx");
        }

        protected void CreateAcc_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Dangky.aspx");
        }

    }
}