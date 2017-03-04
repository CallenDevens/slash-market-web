<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>
<%@ Register TagName="DealListItem" TagPrefix="aya" Src="~/UserControls/DealListItem.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-3">
 
        <asp:UpdatePanel ID="udpTags" runat="server">
        <ContentTemplate>
            <div class="list-group" id="tagList" runat="server" >
            
                <a class="list-group-item">New <asp:Label runat="server" ID="label999" cssClass="badge">12</asp:Label></a>
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>

        </div>

        <asp:Panel class="col-md-6" id="lstDeals" runat="server" >
        </asp:Panel>

        <div class="col-md-3" style="border:1px solid #d3d3d3" >
        <div class="row" style="padding-top:20px">
                <asp:Image runat="server" CssClass="img-rounded center-block"  Width="180px" Height="180px" ImageUrl="~/default_icon.jpg" ID="imgIcon" />
        </div>
        <div class="row text-center">
                 <br />
                <asp:Label runat="server" ID="lblUserName"  Text="" ></asp:Label>
                <br /><br /> 
        </div>

        <div class="row text-center">
            <div class="col-md-4">
                  <h4> <asp:Label runat="server" ID="Label1"  Text="335" ></asp:Label></h4>
               <h5>following</h5>
                <br /> 
            </div>

            <div class="col-md-4">
                  <h4> <asp:Label runat="server" ID="Label2"  Text="1134" ></asp:Label></h4>
               followers
                <br /> 
            </div>
            <div class="col-md-4">
                  <h4> <asp:Label runat="server" ID="Label3"  Text="10" ></asp:Label></h4>
               deals
                <br /> 
            </div>

        </div>

        <div class="row">
            <ul class="list-group" id="forumList">
                 <li class="list-group-item">hot topic 1</li>
                 <li class="list-group-item">hot topic 2</li>
            </ul>
        </div>
        </div>
    </div>

    <div class="row">
    
    </div>

</asp:Content>