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
    public partial class AssetDetail : System.Web.UI.Page
    {
        SqlConnection zon = new SqlConnection("Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True");
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

                using (SqlCommand cmdd = new SqlCommand("select  ETM_Number,Ptid  ,Asset_Type , Receiving_Date , Received_AWB_No , Receiving_Gtr , Dispatch_AWB , Dispatch_Date , Terminal_Remark  from InOut where Dispatch_AWB = " + Request.QueryString["ok"].ToString() + "", zon))

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
                    using (SqlCommand cmd = new SqlCommand("SELECT Service_center , Customer , Location ,Received_Courier_Name , Dispatch_Courier_Name , Etm_Count , Days_Count FROM Inout where Dispatch_AWB = " + Request.QueryString["ok"].ToString() + ""))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            TextBox7.Text = sdr["Service_Center"].ToString();
                            TextBox8.Text = sdr["Customer"].ToString();
                            TextBox9.Text = sdr["Location"].ToString();
                            TextBox10.Text = sdr["Received_Courier_Name"].ToString();
                            TextBox11.Text = sdr["Dispatch_Courier_Name"].ToString();
                            TextBox12.Text = sdr["Etm_Count"].ToString();
                            TextBox13.Text = sdr["Days_Count"].ToString();
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
