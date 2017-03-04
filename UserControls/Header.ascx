<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="header" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp"%>
 
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" />


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topNavBar" aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="topNavBar">
      <ul id="nav_menu" class="nav navbar-nav">
        <li class="active"><asp:HyperLink runat="server" ID="lnkHome">HOME</asp:HyperLink></li>
        <li><a href="#">My Deals</a></li>
        <li class="dropdown">
          <a href="#"> My Works</a>
        </li>
        <li class="dropdown">
          <asp:HyperLink runat="server" NavigateUrl="~/forum">HOT TOPICS</asp:HyperLink>
        </li>
        <li class="dropdown">
          <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/forum">FORUM</asp:HyperLink>
        </li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
         <li>
         <div class="navbar-form navbar-left">
           <div  class="input-group" >
            <asp:TextBox runat="server" ID="txtKeyword" type="text" cssClass="form-control" placeholder="Search for..." />
            <span class="input-group-btn">
                <button type="button" class="btn btn-secondary" ><i class="glyphicon glyphicon glyphicon-search"></i></button>
            </span>
            </div>
         </div>
        
        </li>
        <li><asp:HyperLink id="hyperlink1" 
                  NavigateUrl="#"
                  Text=""
                  runat="server" > <span class="glyphicon glyphicon-envelope"> </span></asp:HyperLink></li>
        <li >
        <asp:HyperLink id="hyperlink2" 
                  NavigateUrl="~/transaction"
                  Text=""
                  runat="server" >
                  <span aria-hidden="true"   class="glyphicon glyphicon-pencil"></span>
                  </asp:HyperLink>

                  
                  </li>

        <li class="dropdown">
        <asp:HyperLink id="hyperlink4" 
                  NavigateUrl="~/settings"
                   CssClass="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                  Text=""
                  runat="server" >
                  <span aria-hidden="true"   class="glyphicon glyphicon-cog"></span></asp:HyperLink>
               <ul class="dropdown-menu">
                     <li><a href="#">Profile Settings</a></li>
                     <li><a href="#">Tag Management</a></li>
                    <li><a href="#">Account Settings</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="#">Log out</a></li>
                </ul>   
          </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<%-- 
<asp:AutoCompleteExtender ID="autoCompleteKeyword" runat="server" Enabled="true"
    TargetControlID="txtKeyword" ServiceMethod="GetKeyWords" MinimumPrefixLength="2"
    CompletionSetCount="2" />

--%>

<%--
<nav class="navbar navbar-inverse" >
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
             <a class="navbar-brand" href="#">Brand</a>
        </div>

        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><asp:LinkButton runat="server" PostBackUrl="~/transactions" Text="My works" /> </li>
                <li><a href="#">My Deals</a></li>
                <li><a href="#">Hot Topics</a></li>
                <li><a href="#">Forum</a></li>
              </ul>

 <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
            
            <ul class="nav navbar-nav navbar-right">
                <li>Message<span class="glyphicon glyphicon-envelope"> </span></li>
                <li>Setting<span aria-hidden="true" OnClick="btnDeal_Click"  class="glyphicon glyphicon-pencil"></span></li>
            </ul>
        </div>
    </div>
</nav>
    
--%>
