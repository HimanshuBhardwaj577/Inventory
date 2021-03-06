using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Repair_Center
{
    public partial class Receiving : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["RepairConnectionString"].ConnectionString;
        string str;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["otp"] == null)
                Response.Redirect("Login.aspx");
            Label1.Text = "" + Session["otp"];

            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select otp from Login_ where Email_Id = '" + Label1.Text + "' ";
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

        }

        protected void lbEdit_Click(object sender, EventArgs e)

        {
            try
            {
                if (string.IsNullOrEmpty(TextBox1.Text) && string.IsNullOrEmpty(TextBox2.Text) && string.IsNullOrEmpty(TextBox3.Text) && string.IsNullOrEmpty(TextBox4.Text) && string.IsNullOrEmpty(TextBox5.Text) && string.IsNullOrEmpty(TextBox6.Text) && string.IsNullOrEmpty(TextBox8.Text) && string.IsNullOrEmpty(TextBox9.Text) && string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox5.Text) || string.IsNullOrEmpty(TextBox6.Text) || string.IsNullOrEmpty(TextBox8.Text) || string.IsNullOrEmpty(TextBox9.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "nulltextbox();", true);
                }

                else
                {
                    SqlConnection con = new SqlConnection("Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand("ReceivingTerminalInsert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    if (TextBox9.Text.Contains(' ') || TextBox9.Text.Contains("\r\n"))//checking for you are entered single value or multiple values  
                    {
                        string val = TextBox9.Text.Replace("\r\n", " ");//split values with ‘,’  
                        string[] arryval = val.Split(' ');//split values with ‘,’ 
                        int j = arryval.Length;
                        int i = 0;
                        for (i = 0; i < j; i++)
                        {
                            if (arryval[i] != "")
                            {
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@Service_Center", TextBox1.Text);
                                cmd.Parameters.AddWithValue("@Customer", TextBox2.Text);
                                cmd.Parameters.AddWithValue("@Location", TextBox3.Text);
                                cmd.Parameters.AddWithValue("@Receiving_Date", TextBox4.Text);
                                cmd.Parameters.AddWithValue("@Received_Courier_Name", TextBox5.Text);
                                cmd.Parameters.AddWithValue("@Received_Awb_Number", TextBox6.Text);
                                cmd.Parameters.AddWithValue("@Receivng_Gtr", TextBox7.Text);
                                cmd.Parameters.AddWithValue("@Asset_Type", TextBox8.Text);
                                cmd.Parameters.AddWithValue("@Upload", arryval[i]);
                                cmd.ExecuteNonQuery();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "allCorrect();", true);
                                ScriptManager.RegisterStartupScript(this, typeof(Page), "redirectjs",
                                "setTimeout(function() {window.location.replace('ReceivingTerminal.aspx')},5000)", true);


                            }

                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notuploadyourdata();", true);
                            }

                        }

                    }


                }
            }

            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "idontknow();", true);
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