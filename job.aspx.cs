using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class job : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["loveservices"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["login"] = "Suraj";
    }
    protected void onlistcat(object sender, ListViewCommandEventArgs e)
    {
        //Label lblid = (Label)e.Item.FindControl("lblid");
        LinkButton hypcat = (LinkButton)e.Item.FindControl("hypcat");
        //  Response.Write("<script>alert('" + hypcat.Text + "')</script>");
        sqljobs.SelectCommand = "SELECT [Id], [Name], [abstract], [experience], [expires], [img],[Category] FROM [job] where [category]='" + hypcat.Text + "'";
        ListView2.DataBind();
    }
    protected void btnpost_Click(object sender, EventArgs e)
    {
        SqlCommand cmd;
        if (fileimg.HasFile)
        {
            string imgname = fileimg.PostedFile.FileName.ToString();
            fileimg.PostedFile.SaveAs(Server.MapPath("~/Img/") + imgname);
            string exdate = DateTime.Now.ToString("M/d/yyyy");
            cmd = new SqlCommand("insert into job values(@name,@abs,@exprience,@exp,@img,@category,@users)", c);
            cmd.Parameters.AddWithValue("@name", txttitle.Text);
            cmd.Parameters.AddWithValue("@abs", txtdes.Text);
            cmd.Parameters.AddWithValue("@exprience", txtexp.Text);
            cmd.Parameters.AddWithValue("@exp", exdate);
            cmd.Parameters.AddWithValue("@img", "img/" + imgname);
            cmd.Parameters.AddWithValue("@category", txtcategory.Text);
            cmd.Parameters.AddWithValue("@users", Session["login"].ToString());
        }
        else
        {
            string exdate = DateTime.Now.ToString("M/d/yyyy");
            cmd = new SqlCommand("insert into job values(@name,@abs,@exprience,@exp,@img,@category,@user)", c);
            cmd.Parameters.AddWithValue("@name", txttitle.Text);
            cmd.Parameters.AddWithValue("@abs", txtdes.Text);
            cmd.Parameters.AddWithValue("@exprience", txtexp.Text);
            cmd.Parameters.AddWithValue("@exp", exdate);
            cmd.Parameters.AddWithValue("@img", "img/default.jpg");
            cmd.Parameters.AddWithValue("@category", txtcategory.Text);
            cmd.Parameters.AddWithValue("@users", Session["login"].ToString());

        }
        
        c.Open();
        int check= Convert.ToInt32(cmd.ExecuteNonQuery());
        if (check > 0)
            Response.Write("<script>alert('Job Posted')</script>");
        else
            Response.Write("<script>alert('Please try again!')</script>");
        
        c.Close();
        
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {

    }
}