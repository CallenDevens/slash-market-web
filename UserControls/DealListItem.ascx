<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DealListItem.ascx.cs" Inherits="UserControls_DealListItem" %>
<div class=" deal_item " style=" border:1px solid;margin-bottom:5px;">
<div class ="row" style="margin-bottom:15px;">
    <div class="col-md-2">
         <asp:Image runat="server" Width="50px" Height="50px" style="margin-top:10px" ID="imgDesc" />
    </div>
    <div class="col-md-10" style="float:left">
        <div>
        <h5><asp:Label ID="lblUsername" runat="server">name</asp:Label></h5> 
        <h4><asp:Label ID="lblTitle" runat="server"> Title</asp:Label></h4>
        <asp:Literal runat="server" ID="pDesc"></asp:Literal>
        </div>
    </div> 
</div>
<div class="row" >
    <div id="deal_tags" runat="server" class="col-md-8">
        <i class="glyphicon glyphicon-tag"></i>
    </div>
</div>
<div class="row text-center" style="margin:5px 0px;">
    <div class="col-md-4">
        <a><span class="glyphicon glyphicon-star-empty"></span>Collect </a>

    </div>
    <div class="col-md-4">
        <a><span class="glyphicon glyphicon-comment"></span>Comment</a>
    </div>

    <div class="col-md-4">
        <a><span class="glyphicon glyphicon-pushpin"></span>Deal </a>
    </div>
</div>
</div>