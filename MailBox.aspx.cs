using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text.RegularExpressions;


namespace Repair_Center
{
    public partial class UnderRepair : System.Web.UI.Page
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
                if (string.IsNullOrEmpty(TextBox1.Text) && string.IsNullOrEmpty(TextBox2.Text) && string.IsNullOrEmpty(TextBox4.Text) && string.IsNullOrEmpty(TextBox6.Text) || string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox4.Text) || string.IsNullOrEmpty(TextBox6.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "emtytext();", true);
                }
                else
                {
                    string constr = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmdd = new SqlCommand("Maildetail", con))
                        {

                            using (SqlDataAdapter sda = new SqlDataAdapter(cmdd))
                            {
                                cmdd.CommandType = CommandType.StoredProcedure;
                                con.Open();
                                if (TextBox6.Text.Contains(' ') || TextBox6.Text.Contains("\r\n"))//checking for you are entered single value or multiple values  
                                {
                                    string val = TextBox6.Text.Replace("\r\n", " ");//split values with ‘,’  
                                    string[] arryval = val.Split(' ');//split values with ‘,’ 
                                    int j = arryval.Length;
                                    int i = 0;

                                    DataTable dt = new DataTable();
                                    for (i = 0; i < j; i++)
                                    {
                                        if (arryval[i] != "")
                                        {
                                            cmdd.Parameters.Clear();
                                            cmdd.Parameters.AddWithValue("@ETM_Number", arryval[i]);
                                            cmdd.ExecuteNonQuery();
                                            sda.Fill(dt);
                                            Repeater1.DataSource = dt;
                                            Repeater1.DataBind();
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "mailing();", true);
                                        }
                                    }



                                }

                            }
                        }

                    }

                }

            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "catching();", true);
            }
        }


        protected void lbEdi_Click(object sender, EventArgs e)

        {
            if (Button2.Enabled == false)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox4.Text = "";
                TextBox6.Text = "";
                Response.Redirect("MailBox.aspx");

            }

            else if (Button2.Enabled == true)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox4.Text = "";
                TextBox6.Text = "";
                Response.Redirect("MailBox.aspx");

            }

        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void outlook_Click(object sender, EventArgs e)
        {

            try
            {
                StringWriter sw = new StringWriter();
                HtmlTextWriter ht = new HtmlTextWriter(sw);
                example2.RenderControl(ht);

                string onee = @"<!DOCTYPE html>
                                  <html>
                                   <head>
                                   <meta name=""viewport"" content=""width = device - width, initial - scale = 1"">
                                          <style>
                                           #customers tr:hover{background-color:#ddd}
                                     </style>
                                 </ head>
                                 <body>
                                 <pre>" + TextBox4.Text + "</pre>"
                                 + "<br/><hr/>"
                                + sw.ToString() +
                                   "</ body ></ html >";
                TextBox4.Text = onee;

                string from = "Himanshu159357@outlook.com";
                using (MailMessage mail = new MailMessage(from, TextBox1.Text))
                {
                    {
                        mail.Subject = TextBox2.Text;
                        mail.Body = TextBox4.Text;
                        if (FileUpload1.HasFile)
                        {
                            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            mail.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, filename));
                        }
                        mail.IsBodyHtml = Regex.IsMatch(TextBox4.Text, @"<\s*([^ >]+)[^>]*>.*?<\s*/\s*\1\s*>");
                        TextBox4.Visible = false;
                        TextBox5.Visible = true;
                        SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                        client.Port = 587;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = false;
                        System.Net.NetworkCredential credential = new System.Net.NetworkCredential(from, "Bbkivines@123");
                        client.EnableSsl = true;
                        client.Credentials = credential;
                        client.Send(mail);
                        TextBox1.Text = string.Empty;
                        TextBox2.Text = string.Empty;
                        TextBox6.Text = string.Empty;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "sending();", true);
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "redirectjs",
                        "setTimeout(function() {window.location.replace('MailBox.aspx')},5000)", true);


                    }

                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "catching();", true);
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