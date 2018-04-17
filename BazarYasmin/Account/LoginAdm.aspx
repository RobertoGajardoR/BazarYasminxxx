<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdm.aspx.cs" Inherits="BazarYasmin.Account.LoginAdm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Login Administrador - Bazar Yasmin</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
        <link href="~/faviconby.png" rel="shortcut icon" type="image/x-icon" />

</head>
<body>
    <style>
.form-signin
{
    max-width: 310px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin #nomusuario
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
    width: 100%;

}
.form-signin #password
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    width: 100%;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}


    </style>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
            <Scripts>
                
                <%--Para obtener más información sobre cómo agrupar scripts en ScriptManager, consulte http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Scripts de marco--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Scripts del sitio--%>
            </Scripts>
        </asp:ScriptManager>
<!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->
<div class="container">
    <div class="row" style="width:320px;margin-left:auto;margin-right:auto;">
<%--        <div class="col-sm-6 col-md-4 col-md-offset-4">--%>
            <h1 class="text-center login-title">Login administrador Bazar Yasmin</h1>
            <div class="account-wall">
                <asp:Image ID="Image2" runat="server"  style="margin-left:20px;margin-right:20px" ImageUrl="~/img/LogoBazarYasmin.png" Width="280px" />
&nbsp;<div class="form-signin">
    <asp:Panel CssClass="alert alert-danger" runat="server" ID="alertNoCoincide" Visible="False">
    <%--<div class="alert alert-success">--%>
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Usuario o contraseña no coinciden</strong>
<%--</div>--%>
    </asp:Panel>
    <asp:TextBox ID="nomusuario" runat="server" type="text" class="form-control" placeholder="Nombre usuario" required autofocus></asp:TextBox>
<asp:TextBox ID="password" type="password" runat="server" class="form-control" placeholder="Contraseña" required></asp:TextBox>
                <%--<input type="text" class="form-control" placeholder="Nombre usuario" required autofocus/>
                <input type="password" class="form-control" placeholder="Contraseña" required>--%>
               <%-- <button class="btn btn-lg btn-primary btn-block" type="submit">
                                        Sign in</button>--%>

                    
                    <asp:Button class="btn btn-lg btn-primary btn-block" ID="Button1" runat="server" Text="Ingresar" OnClick="Button1_Click" />
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me"/>
                    Recordar mi cuenta
                </label>
                </div>
            </div>
        </div>
    </div>
<%--</div>--%>
    </form>
    <script>
 
    </script>
</body>
</html>
