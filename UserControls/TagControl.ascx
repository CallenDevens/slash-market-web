<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TagControl.ascx.cs" Inherits="UserControls_TagControl" %>
<asp:Panel runat="server" ID="pnlTag" style="display:inline-block; margin:5px;">
        <span class="tag tag-default" > 
            <asp:Label runat="server" ID="lblTag"> </asp:Label>
            <span class="glyphicon glyphicon-remove remove_tag"></span> 
        </span>
</asp:Panel>