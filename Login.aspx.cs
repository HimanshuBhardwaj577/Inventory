using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail;

namespace Repair_Center
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["otp"] != null)
                Response.Redirect("ETMSettlement.aspx");

        }

        protected void getotp_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(TextBox1.Text))
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "emailidull();", true);
                }
                else
                {
                    SqlConnection con = new SqlConnection("Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand("Otp", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@Email_Id", TextBox1.Text);
                    cmd.ExecuteNonQuery();
                    string mainconn = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
                    SqlConnection sqlconn = new SqlConnection(mainconn);
                    string sqlquery = "select Name , Otp from Login_ where Email_Id = @Email_Id ";
                    SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
                    sqlcomm.Parameters.AddWithValue("@Email_Id", TextBox1.Text);
                    sqlconn.Open();
                    SqlDataReader sdr = sqlcomm.ExecuteReader();
                    if (sdr.Read())
                    {
                        string Namee = sdr["Name"].ToString();
                        string otpp = sdr["Otp"].ToString();

                        MailMessage mm = new MailMessage("Your Gmail Id", TextBox1.Text);
                        mm.Subject = "Your Otp";
                        mm.Body = string.Format("Hello : <h1>{0}</h1> your otp is {1} ", Namee, otpp);
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        NetworkCredential nc = new NetworkCredential();
                        nc.UserName = "Your Gmail Id";
                        nc.Password = "Your Gmail Id Password";
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = nc;
                        smtp.Port = 587;
                        smtp.Send(mm);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "mainOtp();", true);


                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "Pleasecorrecthis();", true);
                    }

                }





            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "Pleasecorrecthis();", true);

            }

        }

        protected void okotp_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(TextBox1.Text))
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "otpull();", true);
                }
                else
                {

                    using (SqlConnection sqlcon = new SqlConnection(@"Data Source=DESKTOP-JGOR45I;Initial Catalog=Repair;Integrated Security=True"))
                    {
                        sqlcon.Open();
                        string query = "select count(1) from Login_ where Email_Id = @Email_Id and Otp = @Otp ";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlcon);
                        sqlcmd.Parameters.AddWithValue("@Email_Id", TextBox1.Text.Trim());
                        sqlcmd.Parameters.AddWithValue("@Otp", TextBox2.Text.Trim());
                        int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                        if (count == 1)
                        {
                            Session["otp"] = TextBox1.Text.Trim();
                            Response.Redirect("ETMSettlement.aspx");

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "PleasecorrecthisOtp();", true);
                        }

                    }
                }

            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "otpull();", true);

            }







        }

    }
}
