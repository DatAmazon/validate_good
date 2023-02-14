using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;

namespace ThucHanhWeb
{
    public partial class Dangky : System.Web.UI.Page
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
        protected void btnResgister_Click(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;

            SqlConnection myCnn = new SqlConnection(ConnectionString);
            myCnn.Open();
            SqlCommand myCmd = new SqlCommand("tblUsers_register", myCnn);
            myCmd.CommandType = CommandType.StoredProcedure;
            myCmd.Parameters.AddWithValue("@userName", txtName.Text);
            myCmd.Parameters.AddWithValue("passWord", encryption(txtPass.Text.ToString()));
            int i = myCmd.ExecuteNonQuery();
            if (i != 0)
            {
                lblErrorPass.Text = "Register successfully";
            }
            else
            {
                lblErrorPass.Text = "Resgister fail";
            }
            myCmd.Dispose();
            myCnn.Close();
            myCnn.Dispose();
        }

        protected void lbtLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dangnhap.aspx");
        }
    }
}