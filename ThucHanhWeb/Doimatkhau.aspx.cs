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
    public partial class Doimatkhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = "Hello " + Session["user_name"].ToString();
            //lblName.Text = Session["user_pass"].ToString();
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

        protected void btnDoiMatKhau_Click(object sender, EventArgs e)
        {
            string check = encryption(txtOldPass.Text);
            Label1x.Text = check.ToString();
            if (check != Session["user_pass"].ToString())
            {
                lblRes.Text = "Mật khẩu cũ không chính xác";
            }
            else
            {
                String connectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
                SqlConnection myCnn = new SqlConnection(connectionString);
                myCnn.Open();
                SqlCommand myCmd = new SqlCommand("tblUsers_changePassword", myCnn);
                myCmd.CommandType = CommandType.StoredProcedure;
                myCmd.Parameters.AddWithValue("@newPassword",encryption(txtNewPass.Text.ToString()));
                myCmd.Parameters.AddWithValue("@userID", Convert.ToInt32(Session["user_id"]));
                int i = myCmd.ExecuteNonQuery();
                if (i != 0)
                {
                    lblRes.Text = "Đổi mật khẩu thành công";
                }
                else
                {
                    lblRes.Text = "Đổi mật khẩu thất bại";
                }
                myCmd.Dispose();
                myCnn.Close();
                myCnn.Dispose();

            }
        }

        protected void btnThemTin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Themtin.aspx");
        }
    }
}