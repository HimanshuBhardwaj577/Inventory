using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace Repair_Center
{
    public partial class Asset : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True");

        string strConnString = ConfigurationManager.ConnectionStrings["RepairConnectionString"].ConnectionString;
        string str;
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["otp"] == null)
                Response.Redirect("Login.aspx");
            Label1.Text = "" + Session["otp"];


            SqlConnection conn = new SqlConnection(strConnString);
            conn.Open();
            str = "select otp from Login_ where Email_Id = '" + Label1.Text + "' ";
            com = new SqlCommand(str, conn);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            Label2.Text = reader["otp"].ToString();
            reader.Close();
            conn.Close();


            if (string.IsNullOrEmpty(Label2.Text) || string.IsNullOrWhiteSpace(Label2.Text))
            {

                Session.Abandon();
                Session.Contents.RemoveAll();
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("Login.aspx");
            }

            if (Request.QueryString["ok"] != null)
            {

                using (SqlCommand cmdd = new SqlCommand("select Location , Asset_Type ,ETM_Number , Ptid , Receiving_Date ,  Receiving_Gtr , Received_Awb_Number from Receiving_Terminal where Received_Awb_Number = " + Request.QueryString["ok"].ToString() + "", con))

                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmdd))
                    {
                        DataTable dtbrand = new DataTable();
                        sda.Fill(dtbrand);
                        Repeater1.DataSource = dtbrand;
                        Repeater1.DataBind();
                    }


                }

                string constr = ("Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True");
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select Service_Center , Customer , Location , Etm_Count , Received_Courier_Name ,Days_Count  from Receiving_Terminal where Received_Awb_Number = " + Request.QueryString["ok"].ToString() + ""))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            TextBox1.Text = sdr["Service_Center"].ToString();
                            TextBox2.Text = sdr["Customer"].ToString();
                            TextBox3.Text = sdr["Location"].ToString();
                            TextBox4.Text = sdr["Etm_Count"].ToString();
                            TextBox5.Text = sdr["Received_Courier_Name"].ToString();
                            TextBox6.Text = sdr["Days_Count"].ToString();
                        }
                        con.Close();
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