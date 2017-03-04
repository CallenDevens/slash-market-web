<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="UserControls_AdminHeader" %>
<nav class="navbar navbar-inverse" >
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
        </div>

        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Usrs</a></li>
                <li><a href="#">Deals</a></li>
                <li><a href="#">Tags</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox><i class="glyphicon glyphicon-user form-control-feedback"></i></li>
            </ul>
        </div>
    </div>
</nav>