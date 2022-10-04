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
            //string userName = txtName.Text;
            //string userPassword = txtPass.Text;
            //string passEncrypted = encryption(userPassword);

            if (txtPass.Text != txtRePass.Text)
            {
                lblErrorPass.Text = "Mật khẩu không khớp!";
            }
            else
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                SqlConnection myCnn = new SqlConnection(ConnectionString);
                myCnn.Open();
                SqlCommand myCmd = new SqlCommand("UserResgister", myCnn);
                myCmd.CommandType = CommandType.StoredProcedure;
                myCmd.Parameters.AddWithValue("@sUserName", txtName.Text);
                myCmd.Parameters.AddWithValue("@sPassword", encryption(txtPass.Text));
                SqlDataReader rd = myCmd.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        Session["user_id"] = rd.GetInt32(0);
                        Session["user_name"] = rd.GetString(1);
                        //Session["user_pass"] = rd.GetString(2);
                    }
                    Response.Redirect("Dangnhap.aspx");
                }
                rd.Close();
                lblErrorPass.Text = "Đăng ký thành công";
                myCmd.Dispose();
                myCnn.Close();
                myCnn.Dispose();
            }

            //protected void btnLogin_Click(object sender, EventArgs e)
            //{
            //    if (txtName.Text == "" || txtPass.Text == "")
            //    {
            //        lblErrorPass.Text = "Bạn phải nhập đầy đủ tên truy cập và mật khẩu!";
            //    }
            //    else
            //    {
            //        String ConectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            //        SqlConnection Cnn = new SqlConnection(ConectionString);
            //        Cnn.Open();
            //        SqlCommand Cmd = new SqlCommand("UserLogin", Cnn);
            //        Cmd.CommandType = CommandType.StoredProcedure;
            //        Cmd.Parameters.AddWithValue("@sUserName", txtName.Text);
            //        Cmd.Parameters.AddWithValue("@sPassword", txtPass.Text);

            //        Cmd.ExecuteNonQuery();
            //        lblErrorPass.Text = "Đăng nhập thành công!";
            //        Cmd.Dispose();
            //        Cnn.Close();
            //        Cnn.Dispose();
            //    }
            //}
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            lblErrorPass.Text = "dấdas";
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Dangnhap.aspx");
        }

        protected void lbtLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dangnhap.aspx");
        }
    }
}