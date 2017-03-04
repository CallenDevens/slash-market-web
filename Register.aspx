<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    
    <!--jQuery files -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
    <div class="row" style="height:200px;"></div>
        <div class="row" >
                <div class="col-md-4 col-md-offset-4">
                    <form id="form1"  runat="server">
                        <asp:Panel ID="panelRegStep1" runat="server">
                            <div class="panel panel-default">
                            <asp:Label ID="Label1" runat="server" ><h1>Slash Market</h1></asp:Label>
                            <br />
                            <asp:Button  CssClass="btn-primary btn-block btn-lg" ID="btnReg" runat="server" Text="REGISTER" onclick="btnReg_Click" />
                            <br />
                            <asp:Button  CssClass="btn-primary btn-block btn-lg" ID="btnLogin" runat="server" Text="LOGIN" />
                            </div>
                        </asp:Panel>
                        
                        <asp:Panel ID="panelRegStep2"  Visible="false" runat="server">
                        <div>
                            <div class="col-md-10 col-mg-offset-1">
                                <div class="input-group">
                                    <span class="input-group-addon" id="mail-addon"> <i class="glyphicon glyphicon glyphicon-envelope"></i></span>
                                     <asp:TextBox runat="server"  CssClass="form-control" id="txtEmail" placeholder="Email" aria-describedby="mail-addon1" ></asp:TextBox>
                                 </div>
                                 
                                 <asp:RequiredFieldValidator runat="server" ID="emailRequiredValidator" 
                                    ControlToValidate="txtEmail" 
                                    ErrorMessage="Email Required." />
                                 <br />
                                <br />
                                <div class="input-group">
                                     <span class="input-group-addon" id="pwd-addon"> <i class="glyphicon glyphicon glyphicon-lock"></i></span>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPwd" TextMode="Password" 
                                        placeholder="Password" aria-describedby="pwd-addon"></asp:TextBox>     
                                </div>                         
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" 
                                    ControlToValidate="txtPwd" 
                                     ErrorMessage="Password Required." />
                                <br />
                                <br />

                                <div class="input-group">
                                    <span class="input-group-addon" id="user-addon"> <i class="glyphicon glyphicon glyphicon-user"></i></span>
                                    <asp:TextBox runat="server" ID="txtUsername" placeholder="User name" 
                                       CssClass="form-control" aria-describedby="pwd-addon"></asp:TextBox>    
                                </div>
                                
                                <br />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" 
                                    ControlToValidate="txtUsername" 
                                     ErrorMessage="User name Required." />
                                <br />
                                <asp:Button runat="server" Text="REGISTER" CssClass="btn-lg btn-block" ID="btnSubmit" OnClick="btnSubmit_Click" />
                            </div>
                          </div>
                     </asp:Panel>

 `             </form>
            </div>
        </div>
            </div>
</body>
</html>
