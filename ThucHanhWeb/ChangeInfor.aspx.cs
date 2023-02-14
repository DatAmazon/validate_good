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
    public partial class ChangeInfor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectToDB"].ConnectionString;
            SqlConnection myCnn = new SqlConnection(connectionString);
            myCnn.Open();

            SqlCommand myCmd = new SqlCommand("tblUser_changeInfor", myCnn);
            myCmd.CommandType = CommandType.StoredProcedure;
            myCmd.Parameters.AddWithValue("@userID",(int) Session["user_id1"]);
            myCmd.Parameters.AddWithValue("@userName", (int)Session["user_id1"]);
        }

        protected void rptChangeInfor_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}