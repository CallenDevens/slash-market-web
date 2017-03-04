<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
<div class="col-md-6 col-md-offset-2">
    <div class="row">
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-paperclip"></i></span>
        <asp:TextBox ID="txtTitle" runat="server" cssClass="form-control" 
            placeholder="Title" aria-describedby="basic-addon1"  MaxLength="60"></asp:TextBox>
            <%-- 
        <input type="text" class="form-control" placeholder="Title" aria-describedby="basic-addon1">
        --%>
    </div>
    </div>
    <br />
    <div class="row">
    <div class="input-group col-md-12">
    <%--        <textarea rows="40"  id="txtDescription"   class="form-control " runat="server"  maxlength="500" ></textarea> --%>
        <asp:TextBox ID="txtDescription" Rows="20"  TextMode="MultiLine" style="resize:none;"  CssClass="form-control " runat="server"  MaxLength="500" />
    </div>
    </div>

    <asp:ListBox runat="server" ID="lstTags" Width="85px"></asp:ListBox>
    <br />
    <asp:TextBox runat="server" ID="txtTag" ></asp:TextBox>
    <asp:Button Text="Add Tag" ID="btnAddTag" runat="server" onclick="btnAddTag_Click" />
    <br />
    <asp:Button Text="Submit" ID="btnSubmit" runat="server" 
        onclick="btnSubmit_Click" />
        <br />
        <asp:Label runat="server" ID="lblError" />
</div>
</div>
</asp:Content>

