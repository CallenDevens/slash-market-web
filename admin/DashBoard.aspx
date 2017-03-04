<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DashBoard.aspx.cs" Inherits="admin_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView runat="server" ID="grvUsers" AllowPaging="True" 
    AutoGenerateColumns="False"  ViewStateMode="Enabled"  Cellpadding="20" CellSpacing="10"
        BackColor="LightGoldenrodYellow" BorderColor="Tan" 
    BorderWidth="1px"  DataKeyNames="username" 
    DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" >
       <AlternatingRowStyle BackColor="PaleGoldenrod" />
       <Columns>
           <asp:CommandField ShowSelectButton="True" HeaderText="Select" />
           <asp:BoundField DataField="user_email" HeaderText="Email" 
               SortExpression="user_email" />
           <asp:BoundField DataField="user_password" HeaderText="Password" 
               SortExpression="user_password" />
           <asp:BoundField DataField="username" HeaderText="User name" 
               SortExpression="username" ReadOnly="True" />
           <asp:BoundField DataField="user_birthday" HeaderText="Birthday" 
               SortExpression="user_birthday" DataFormatString="{0:f}" />
           <asp:BoundField DataField="user_register_dt" HeaderText="Register date" 
               SortExpression="user_register_dt" DataFormatString="{0:f}" />
               <asp:CommandField ShowEditButton="True" />
       </Columns>
       <FooterStyle BackColor="Tan" />
       <HeaderStyle BackColor="Tan" Font-Bold="True" />
       <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
           HorizontalAlign="Center" />
       <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
       <SortedAscendingCellStyle BackColor="#FAFAE7" />
       <SortedAscendingHeaderStyle BackColor="#DAC09E" />
       <SortedDescendingCellStyle BackColor="#E1DB9C" />
       <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
   <br />

   <asp:DetailsView runat="server" ID="dtvUser" AutoGenerateRows="False" 
    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px"  Width="130px"
    CellPadding="2" DataKeyNames="username" DataSourceID="SqlDataSource2" 
    ForeColor="Black" GridLines="None" ViewStateMode="Enabled" >
       <AlternatingRowStyle BackColor="PaleGoldenrod" />
       <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
       <Fields>
           <asp:BoundField DataField="user_email" HeaderText="user_email" 
               SortExpression="user_email" />
           <asp:BoundField DataField="user_password" HeaderText="user_password" 
               SortExpression="user_password" />
           <asp:BoundField DataField="username" HeaderText="username" 
               SortExpression="username" ReadOnly="True" />
           <asp:BoundField DataField="user_birthday" HeaderText="user_birthday" 
               SortExpression="user_birthday" />
           <asp:BoundField DataField="user_register_dt" HeaderText="user_register_dt" 
               SortExpression="user_register_dt" />
       </Fields>
       <FooterStyle BackColor="Tan" />
       <HeaderStyle BackColor="Tan" Font-Bold="True" />
       <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
           HorizontalAlign="Center" />
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:slashmarketConnectionString %>" 
    
        SelectCommand="SELECT [user_email], [user_password], [username], [user_birthday], [user_register_dt] FROM [slash_users]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:slashmarketConnectionString %>" 
    SelectCommand="SELECT * FROM [slash_users] WHERE ([username] = @username)" 
        onselecting="SqlDataSource2_Selecting">
    <SelectParameters>
        <asp:ControlParameter ControlID="grvUsers" Name="username" 
            PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

