<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserSetting.aspx.cs" Inherits="UserSetting" Async="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagName="TagControl" TagPrefix="aya" Src="~/UserControls/TagControl.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link id="Link1" rel="stylesheet" href="~/css/style.css"  type="text/css" runat="server" /> 
    <script  src="js/tag_manage.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<asp:Literal runat="server" ClientIDMode="Static" ID="ActiveTab" Visible="false" ></asp:Literal>
    <div class="row">
        <div class="col-md-3">
            <!-- Nav tabs -->
            <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="#edit_profile" data-toggle="tab">Profile</a></li>
            <li><a href="#avatar" data-toggle="tab"><i="glyphicon glyphicon-info-sign"></i>Avatar</a></li>
            <li><asp:HyperLink runat="server" ID="tabTags" href="#tags" data-toggle="tab"  >Tags</asp:HyperLink></li>
            <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <!-- Tab panes -->
            <div class="tab-content" id="setting_tab">
                <div class="tab-pane active" id="edit_profile">
                    <asp:UpdatePanel runat="server" ID="udpProfile">
                            <ContentTemplate>
                            <div class="row">
                                <label class="control-label col-md-3">
                                    Gender:</label>
                                <div class="col-md-8">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="rbMale" runat="server" GroupName="gender"  Text="Male" /></label>
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="rbFemale" runat="server" GroupName="gender" Text="Female" /></label>
                                </div>
                            </div>
                            <div class="row">
                                <label class="control-label col-md-3">
                                    Brief Introduction:</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtIntroduction" MaxLength="120" Style="resize: none;" Rows="4"
                                        runat="server" TextMode="MultiLine" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <label class="control-label col-md-3">
                                    Blog:</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtBlog" MaxLength="200" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <label class="control-label col-md-3">
                                    Birthday:</label>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtDate" runat="server"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="btnPopup" CssClass="btn btn-secondary" OnClientClick="getTodayDate(); return false"
                                                runat="server">
                            <i class="glyphicon glyphicon-calendar"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <asp:CalendarExtender ID="Calendar1" PopupButtonID="btnPopup" runat="server" TargetControlID="txtDate"
                                        Format="MM/dd/yyyy"></asp:CalendarExtender>
                                    <%--
                        <asp:Calendar runat="server" ID="calBirth"  OnClientClick="return false" ></asp:Calendar>
                                    --%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="btnSubmit"  OnClick="btnSubmit_Click" runat="server" Text="Save" CausesValidation="false"
                                        CssClass="btn btn-default" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="avatar">
                    <asp:UpdatePanel runat="server" ID="udpAvatar" >
                        <triggers>
                            <asp:PostBackTrigger ControlID="btnUpload" />
                        </triggers>
                        <ContentTemplate>
                            <div class="col-md-4">
                                <asp:Image runat="server" ID="imgIcon" CssClass="center-block img-responsive" Width="150px"
                                    Height="150px" />
                            </div>
                            <div class="col-md-6">
                                <asp:FileUpload runat="server" ID="uploadImg" accept="image/*" />
                                <asp:Button  cssClass="btn btn-default" ID="btnUpload"  OnClick="btnUpload_Click" runat="server" Text="Upload" />
                            </div>
                            <div class="col-md-10" style="margin-top: 20px">
                                <asp:Panel Style="padding: 5px" runat="server" ID="pnlFileInfo" CssClass="alert alert-success fade in"
                                    Visible="false">
                                    <div id="pnlContent" runat="server">
                                    
                                    </div>
                                    
                                </asp:Panel>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!--manage tags -->
                <div class="tab-pane" id="tags">
                    <div class="col-md-9 col-md-offset-1" style="padding-top: 50px; padding-bottom: 100px;">
                    <asp:UpdatePanel runat="server"  ID="udpTags" >
                       <ContentTemplate>
                            <asp:Panel runat="server" ID="pnlTags"  ClientIDMode="Static" style="margin-top: 50px;">
                            <div class="progress">                 
                            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100"
                                aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                LOADING...
                            
                            </div>
                            </div>
                            </asp:Panel>

                            <asp:Panel  CssClass="input-group" ID="divAddTags" runat="server" style="padding-top:20px;" >
                      <input type="text" class="form-control"  id="tag_input" placeholder="tag name" />
                       <span class="input-group-btn">
                       <button type="button"   id="btn_add_tag" class="btn btn-default" >ADD</button>
                       </span>
                     </asp:Panel>
                       </ContentTemplate>
                    </asp:UpdatePanel>
                     
                        
                    </div>
                </div>
                <div class="tab-pane" id="settings">
                    Settings Tab.</div>
            </div>
        </div>
    </div>
</asp:Content>
