<%@ Page Title="" Language="C#" MasterPageFile="~/headfooter.master" AutoEventWireup="true" CodeFile="job.aspx.cs" Inherits="job" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.ListView2{width:50%;}
  html {
           
        }
 
        #dialog {
            border: 2px solid black;
            width: 500px;
            background-color: White;
        }
 
        #dialogContents {
               background: white;
               border: 2px solid black;
                   padding: 0 5%;
        }
 
        .modalBackground {
             background-color:Gray;
            filter:alpha(opacity=70);
            opacity:0.7;
        }
        
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">

					<header class="major">
						<h2>JOBS</h2>
						<p>We help you get more from your Job. Here You can get experts in Jobs.</p>
						
						<div class="12u$ 12u$(medium) ">
						<ul class="actions pull-right">
								
								<li><asp:Button ID="btnShow" Text="Post your Job" runat="server" CssClass="button icon fa-download" /></li>
								<li><a href="#" class="button icon fa-download ">Edit your Job</a></li>
							</ul>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                             <asp:Panel ID="dialog" runat="server">
        <div id="dialogContents" class="txtleft">
           
         <table>
    <tr>
    <td colspan=2>
    <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Post Job"></asp:Label>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="Label2" runat="server" CssClass="lbl" Text="Title"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txttitle" runat="server" Font-Size="14px" CssClass="textbox" ></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Label ID="Label4" runat="server" CssClass="lbl" Text="Category"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtcategory" runat="server" Font-Size="14px" CssClass="textbox"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td colspan=2>
    <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Description"></asp:Label>
    <p></p>
    
    <asp:TextBox ID="txtdes" runat="server" Font-Size="14px" width="100%" Height="100px" CssClass="textbox"></asp:TextBox>
    </td>
    </tr>
    
    <tr>
    <td>
    <asp:Label ID="Label5" runat="server" CssClass="lbl" Text="Required Experience"></asp:Label>
    </td>
    <td>
    <asp:TextBox ID="txtexp" runat="server" Font-Size="14px" CssClass="textbox"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td><asp:Button ID="btnOK" Text="Back" runat="server" /></td>
    <td><asp:Button ID="btnpost" Text="Post" runat="server" onclick="btnpost_Click" /></td>    
    </tr>
        </table>
            
             <p></p>
        </div>
       
    </asp:Panel>
 

    <ajaxToolkit:ModalPopupExtender  TargetControlID="btnShow"
        PopupControlID="dialog"
        OkControlID="btnOK"
        DropShadow="true"
        BackgroundCssClass="modalBackground"
        runat="server"></ajaxToolkit:ModalPopupExtender>

					</div>
					</header>
				<div class="12u$ 12u$(medium)">
					
					
				</div>
				
					<!-- Table -->
						<section>
							
                            <asp:SqlDataSource ID="sqljobs" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Loveservices %>" 
                        SelectCommand="SELECT [Id], [Name], [abstract], [experience], [expires], [img],[Category] FROM [job]">
                    </asp:SqlDataSource>
                                               
                            <h4>&nbsp;</h4>
							<div class="table-wrapper">
								<table class="alt tabjob">
									<tr class="headerrow">
											<th class="col1 bbot">List of JobsOffers</th>
                                            <th class="clo2 bbot" style="border-left-width:0;">Jobs</th>
											<th class="col3 bbot" style="border-left-width:0;">Apply below</th>
									</tr>
									
									<tr>
											<td><b><a href="job.aspx">All Jobs</a></b>
                                            <p></p>
                                              <asp:ListView ID="listcat" runat="server" DataSourceID="jobcategory" OnItemCommand="onlistcat" 
                                                 >
                                                     <EmptyDataTemplate>
           <div id="Table1" runat="server">          
             No data was returned.          
          </div>
          </EmptyDataTemplate>
           
          <GroupTemplate>
            <div ID="itemPlaceholderContainer" runat="server" class="mar3">
             <div ID="itemPlaceholder" runat="server" ></div>
            </div>
          </GroupTemplate>
           <ItemTemplate>
           <div class="w70 txtleft divcenter ">
              <asp:LinkButton ID="hypcat" runat="server" Text='<%# Eval("Category") %>'></asp:LinkButton>
           </div>
           </ItemTemplate>          
          </asp:ListView> 

  <asp:SqlDataSource ID="jobcategory" runat="server" ConnectionString="<%$ ConnectionStrings:Loveservices %>" 
                                                    SelectCommand="SELECT [category] FROM [job]"></asp:SqlDataSource>
                                            
                                            </td>
											<td>											
										   <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="sqljobs">
          <EmptyDataTemplate>
           <div id="Table1" runat="server">          
             No data was returned.          
          </div>
          </EmptyDataTemplate>
           
          <GroupTemplate>
            <div ID="itemPlaceholderContainer" runat="server">
             <div ID="itemPlaceholder" runat="server"></div>
            </div>
          </GroupTemplate>
           <ItemTemplate>
           
                    <div class="title">
                         <strong><%# Eval("ID")%> : <%# Eval("name")%></strong> <span class="floatr"><strong>Category: <%# Eval("Category") %></strong></span>
                    </div>
                    <div>
                     <div class="floatl w20">
                      <a href="">
                      <img src="<%# Eval("img")%>" style="width:90%" /></a>
                     </div>                
                     <div class="floatl w70">
                       <span>
                         <b>Description: </b><%# Eval("abstract")%>
                       </span>
                       <br />
                       <span>
                         <b>Experience: </b><%# Eval("experience")%>
                       </span>
              <p></p>
                    <a href="#" class="button small">Apply</a>
                     </div>
                    </div>
                    <div style="clear:both;margin:0"></div>
                    <br />
                    
                    <p class="hr1" ></p>
                  </ItemTemplate>
        </asp:ListView>
    
                                         
											</td>
									        <td><a href="#" class="button small">Apply</a></td>
		</tr>
										
								
									<tfoot>
										<tr>
											<td colspan="2"></td>
											<td>100.00</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</section>

					

				</div>
			</section>
</asp:Content>

