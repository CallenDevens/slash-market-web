<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Slash Market</title>
     <!--jQuery files -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

     <link rel="stylesheet" href="~/css/index_style.css"  type="text/css" runat="server" />
</head>
<body >
   <div class="container">
    <div class="row fill">
        <div class="col-md-4 col-md-offset-4">
            <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="input-group">
                        <span class="input-group-addon" id="user-addon"><i class="glyphicon glyphicon-envelope">
                        </i></span>
                        <asp:TextBox ID="txtEmail" placeholder="Email" runat="server" CssClass="form-control" aria-describedby="user-addon"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="emailRequiredValidator" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is a required Field." ForeColor="Red"></asp:RequiredFieldValidator>
                    <div class="input-group">
                        <span class="input-group-addon" id="pwd-addon"><i class="glyphicon glyphicon-lock"></i>
                        </span>
                        <asp:TextBox ID="txtPwd"  placeholder="Password" CssClass="form-control" aria-describedby="pwd-addon" runat="server"
                            TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="pwdRequiredFieldValidator" runat="server" ControlToValidate="txtPwd"
                        ErrorMessage="Password is a required Field." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-default btn-block" OnClick="btnLogin_Click" Text="Login" />
                <asp:Button ID="btnReg"  CssClass="btn btn-default btn-block" runat="server" Text="Register" OnClick="btnReg_Click" CausesValidation="false" />
                <asp:Label runat="server" ID="lblError" />
                </div>
            </div>
            <div class="row">
            </div>
            </form>
        </div>
    </div>
    </div>
</body>
</html>
