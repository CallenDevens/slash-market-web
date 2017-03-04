<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewThread.aspx.cs" Inherits="NewThread" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
<div class="col-md-6 col-md-offset-2">
    <div class="row">
    <div class="input-group">
      <div class="input-group-btn">
        <button type="button" class="btn btn-secondary dropdown-toggle" 
            data-toggle="dropdown" >
          Select Topic &nbsp;<span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="#">HTML</a></li>
            <li><a href="#">CSS</a></li>
            <li><a href="#">JavaScript</a></li>
        </ul>
      </div>
      <asp:TextBox runat="server" ID="txtTitle" cssClass="form-control" aria-label="" placeholer="Title" />
    </div>
    <br />
    </div>


    <div class="row">
         <div class="input-group col-md-12">
            <asp:TextBox ID="txtContent" Rows="20"  TextMode="MultiLine" style="resize:none;"  CssClass="form-control " runat="server"  MaxLength="500" />
        </div>
    </div>
    <br />

    <div class="row">
    <div class="col-md-3">
         <asp:CheckBox runat="server" ID="chlAnonymous" Text="Anonymous" />
    </div>
    <div class="col-md-3 col-md-offset-5">
        <asp:Button Text="Submit" ID="btnSubmit" runat="server"  
            onclick="btnSubmit_Click"  />    
    </div>

        <br />
        <asp:Label runat="server" ID="lblError" />
    </div>
</div>
</div>
</asp:Content>

