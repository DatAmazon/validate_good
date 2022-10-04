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
    public partial class ChangePass : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            if(txtNewPass.Text != txtNewPassAgain.Text)
            {
                lblResultChangePass.Text = "Mật khẩu mới không trùng";
            }
            else
            {
                String connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
                SqlConnection Cnn = new SqlConnection(connectionString);
                Cnn.Open();
                SqlCommand Cmd = new SqlCommand("UserUpdate", Cnn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@Pk_iUserID", (int)Session["user_id"]);
                Cmd.Parameters.AddWithValue("@sNewPass", txtNewPass.Text);
                int a = Cmd.ExecuteNonQuery();
                if(a != 0)
                {
                    lblResultChangePass.Text = "Đổi mật khẩu thành công";
                }
                Cmd.Dispose();
                Cnn.Close();
                Cnn.Dispose();
            }
        }
    }
}