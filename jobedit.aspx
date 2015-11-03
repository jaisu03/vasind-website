<%@ Page Title="" Language="C#" MasterPageFile="~/headfooteredit.master" AutoEventWireup="true" CodeFile="jobedit.aspx.cs" Inherits="jobedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<p></p>
<table class="alt tabjob">
									<tr class="headerrow">
											<th class="col1 bbot" style="border:0"></th>
                                            <th class="clo2 bbot" style="border-left-width:0;border-right-width:0;">
                                            
                                            <span class="floatl w20 search">Search by Job id:</span> 
                                            <span class="floatl w20"><asp:TextBox Width="90%" ID="txtsearch" runat="server"></asp:TextBox></span>
                                                <asp:Button class="button small searchb" ID="btnsearch" runat="server" 
                                                    Text="Search" onclick="btnsearch_Click" />
                                                    <asp:Button class="button small searchb" ID="btnrefresh" runat="server" 
                                                    Text="All" onclick="btnrefresh_Click" />
                                            </th>
											<th class="col3 bbot" style="border:0"></th>
									</tr>
</table>


                            <asp:SqlDataSource ID="sqljobs" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Loveservices %>">
                    </asp:SqlDataSource>
	<div class="table-wrapper">
								<table class="alt tabjob">
									<tr class="headerrow">
											<th class="col1 bbot">List of JobsOffers</th>
                                            <th class="clo2 bbot" style="border-left-width:0;">Jobs</th>
											<th class="col3 bbot" style="border-left-width:0;">Apply below</th>
									</tr>
									
									<tr>
											<td style="text-align:center;">
                                                <asp:ListView ID="listcat" runat="server" DataSourceID="jobcategory" OnItemCommand="onlistcat" 
                                                    onselectedindexchanged="ListView1_SelectedIndexChanged">
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
										   <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="sqljobs" 
                                                    onselectedindexchanged="ListView2_SelectedIndexChanged" OnItemCommand="onitemcommand">
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
                         <strong>Job Id 
                             <asp:Label ID="lblid" runat="server" Text='<%# Eval("ID")%>'></asp:Label> : 
                             <asp:TextBox ID="txtname" runat="server" Width="75%" CssClass="edittxt" Text='<%# Eval("name")%>'></asp:TextBox>
                         
                             <div class="floatr">
                             <strong class="floatr">Category: <asp:TextBox ID="txtcategory" runat="server" CssClass="edittxt" Text='<%# Eval("Category") %>'></asp:TextBox></strong></strong>
                             </div>
                    </div>
                    <div>
                     <div class="floatl w30">
                      <a href="">
                      <img src="<%# Eval("img")%>" style="width:95%"/></a><br /><br />
                         <asp:FileUpload ID="upimg" runat="server" />
                     </div>                
                     <div class="floatl w70">
                       <span>
                         <b>Description: </b><asp:TextBox ID="txtdes" runat="server" CssClass="edittxt" Text='<%# Eval("abstract")%>'></asp:TextBox>
                       </span>
                       <br />
                       <span>
                         <b>Experience: </b><asp:TextBox ID="txtexp" runat="server" CssClass="edittxt" Text='<%# Eval("experience")%>'></asp:TextBox>
                       </span>
              <p></p>
                         <asp:Button ID="btnupdate" class="button small" runat="server" Text="Update" />
                    
                     </div>
                    </div>
                    <div style="clear:both;margin:0"></div>
                    <br />
                    
                    <p class="hr1" ></p>
                  </ItemTemplate>
        </asp:ListView>
    
                                         
											</td>
									        <td></td>
		</tr>
								
								</table>
							</div>
</asp:Content>

