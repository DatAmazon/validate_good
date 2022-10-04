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
            if (txtName.Text == "" || txtPass.Text == "")
            {
                lblErrorPass.Text = "Bạn phải nhập đầy đủ tên truy cập và mật khẩu!";
            }
            else
            {
                String ConectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                SqlConnection Cnn = new SqlConnection(ConectionString);
                Cnn.Open();
                SqlCommand Cmd = new SqlCommand("UserLogin", Cnn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@sUserName", txtName.Text);
                Cmd.Parameters.AddWithValue("@sPassword", encryption(txtPass.Text.ToString());
                SqlDataReader rd = Cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        Session["user_id"] = rd.GetInt32(0);
                        Session["user_name"] = rd.GetString(1);
                        Session["user_pass"] = rd.GetString(2);
                    }
                    lblErrorPass.Text = "Đăng nhập thành công";
                }
                else
                {
                    lblErrorPass.Text = "Đăng nhập thất bại";
                }
                rd.Close();
                Cmd.Dispose();
                Cnn.Close();
                Cnn.Dispose();
                CreateAcc.Visible = false;
                btnLogin.Visible = false;
                btnChangePass.Visible = true;
            }
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            lblErrorPass.Text = "";
        }

        protected void CreateAcc_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Dangky.aspx");
        }
    }
}