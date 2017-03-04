<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="row">
        
            <asp:Button runat="server" ID="btnNewThd" Text="New Thread" 
               OnClick="btnNewThd_Click" CausesValidation="false" />
  
        </div>
        <div class="row">
        <asp:Table runat="server" CssClass="table table-hover" ID="tblList">
        <asp:TableHeaderRow >
            <asp:TableHeaderCell Width="10%"> </asp:TableHeaderCell>
            <asp:TableHeaderCell Width="60%"> </asp:TableHeaderCell>
            <asp:TableHeaderCell Width="10%">Replies </asp:TableHeaderCell>
            <asp:TableHeaderCell Width="20%">Last Post </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        </asp:Table>
        </div>
    </div>
</div>
</asp:Content>

