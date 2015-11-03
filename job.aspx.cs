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
        SqlCommand cmd = new SqlCommand("",c);
    }
}