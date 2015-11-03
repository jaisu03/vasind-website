using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class jobedit : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["loveservices"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["login"] = "Suraj";
        sqljobs.SelectCommand = "SELECT [Id], [Name], [abstract], [experience], [expires], [img],[Category] FROM [job] where users='"+Session["login"].ToString()+"'";

    }
    protected void ListView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  
    protected void onitemcommand(object sender, ListViewCommandEventArgs e)
    {
        
        Label lblid = (Label)e.Item.FindControl("lblid");
        TextBox txtname = (TextBox)e.Item.FindControl("txtname");
        TextBox txtdes = (TextBox)e.Item.FindControl("txtdes");
        TextBox txtexp = (TextBox)e.Item.FindControl("txtexp");
        TextBox txtcat = (TextBox)e.Item.FindControl("txtcategory");
        FileUpload upimg =(FileUpload)e.Item.FindControl("upimg");

        SqlCommand cmd;
      if(upimg.HasFile)      
      {
          string imgname=upimg.PostedFile.FileName;
          upimg.PostedFile.SaveAs(Server.MapPath("~/Img/") + imgname);
        cmd = new SqlCommand("update job set name=@name,abstract=@des,experience=@exp,img=@img,category=@category where id=@id", c);
          cmd.Parameters.AddWithValue("@id", lblid.Text);
          cmd.Parameters.AddWithValue("@name",txtname.Text);
          cmd.Parameters.AddWithValue("@des",txtdes.Text);
          cmd.Parameters.AddWithValue("@exp",txtexp.Text);
          cmd.Parameters.AddWithValue("@img","img/"+imgname);
          cmd.Parameters.AddWithValue("@category",txtcat.Text);
      }
      else
      {
          cmd = new SqlCommand("update job set name=@name,abstract=@des,experience=@exp,category=@category where id=@id", c);
          cmd.Parameters.AddWithValue("@id", lblid.Text);
          cmd.Parameters.AddWithValue("@name",txtname.Text);
          cmd.Parameters.AddWithValue("@des",txtdes.Text);
          cmd.Parameters.AddWithValue("@exp",txtexp.Text);
          cmd.Parameters.AddWithValue("@category", txtcat.Text);
                     
      }
      c.Open();
      int check = Convert.ToInt32(cmd.ExecuteNonQuery());
      if (check > 0)
          Response.Write("<script>alert('Job Updated')</script>");
      else
          Response.Write("<script>alert('Please try again!')</script>");

      c.Close();
                //[Name], [abstract], [experience], [expires], [img]


        //TextBox1.Text = lblid.Text;
      //  Response.Write("<script>alert('vdfvfd')</script>");
      
    }

    protected void onlistcat(object sender, ListViewCommandEventArgs e)
    { 
    //Label lblid = (Label)e.Item.FindControl("lblid");
        LinkButton hypcat = (LinkButton)e.Item.FindControl("hypcat");
      //  Response.Write("<script>alert('" + hypcat.Text + "')</script>");
        sqljobs.SelectCommand = "SELECT [Id], [Name], [abstract], [experience], [expires], [img],[Category] FROM [job] where [category]='"+hypcat.Text+"' and users='"+Session["login"].ToString()+"'";
        ListView2.DataBind();
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        int val;
        if (int.TryParse(txtsearch.Text, out val))
        {
            sqljobs.SelectCommand = "SELECT [Id], [Name], [abstract], [experience], [expires], [img],[Category] FROM [job] where [id]='" + txtsearch.Text + "' and users='" + Session["login"].ToString() + "'";
            ListView2.DataBind();
        }else
            Response.Write("<script>alert('Id not found')</script>");

        txtsearch.Text = "";

    }
    protected void btnrefresh_Click(object sender, EventArgs e)
    {
        txtsearch.Text="";
        sqljobs.SelectCommand = "SELECT [Id], [Name], [abstract], [experience], [expires], [img],[Category] FROM [job] where users='" + Session["login"].ToString() + "'";
        ListView2.DataBind();
        
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}