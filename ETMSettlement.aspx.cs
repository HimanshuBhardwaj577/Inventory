using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Timers;

namespace Repair_Center
{
    public partial class ETMSettlement : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["RepairConnectionString"].ConnectionString;
        string str;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["otp"] == null )
            Response.Redirect("Login.aspx");
            Label1.Text = "" + Session["otp"];

            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select otp from Login_ where Email_Id = '"+Label1.Text+"' ";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Label2.Text = reader["otp"].ToString();
            reader.Close();
            con.Close();



            if (string.IsNullOrEmpty(Label2.Text) || string.IsNullOrWhiteSpace(Label2.Text))
            {

                Session.Abandon();
                Session.Contents.RemoveAll();
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("Login.aspx");
            }
            else {

                if (!this.IsPostBack)
                {
                    this.BindRepeater();
                }

               if (!this.IsPostBack)
                {
                    this.BindRepeaterr();
                }



            }


        }



        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ReceivingPartion", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                }
            }
        }

        private void BindRepeaterr()
        {
            string constr = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DispatchPartition", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater2.DataSource = dt;
                        Repeater2.DataBind();
                    }
                }
            }
        } 

        protected void log_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Contents.RemoveAll();
            System.Web.Security.FormsAuthentication.SignOut();
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("logoutt", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Email_Id", Label1.Text);
            cmd.ExecuteNonQuery();
            Response.Redirect("Login.aspx");


        }

    }
}