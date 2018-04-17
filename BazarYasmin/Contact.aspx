<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BazarYasmin.Contact" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav navbar-nav side-nav ">
                        <li ><a runat="server" href="/"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
                        <li ><a runat="server" href="Realizar_pedido"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Realizar Pedido</a></li>
                        <li><a runat="server" href="About"><i class="fa fa-users" aria-hidden="true"></i> Quienes Somos</a></li>
                        <li class="active"><a runat="server" href="Contact"><i class="fa fa-address-book-o" aria-hidden="true"></i> Contacto</a></li>
                    
    </ul>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
        <div class="thumbnail">
  <div class="row col-md-6" style="text-align:center" >
    <h3>Nuestros contactos.</h3>
    <address>
        Bazar familiar<br />
        Jaques custeaus #269, Maipu Region Metropolitana<br />
        <abbr title="Telefono">P:</abbr>
        22 445 752
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@BazarYasmin.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@BazarYasmin.com</a>
    </address>
      </div>
            <style>
                .header {
    color: #36A0FF;
    font-size: 27px;
    padding: 10px;
}
                input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"],
input[type="select"] {
    max-width: 1000px;
}

.bigicon {
    font-size: 35px;
    color: #36A0FF;
}
            </style>
            <div style="align-content:center" class="container">
    <div class="row col-md-6">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset  >
                        <legend class="text-center header">CONTÁCTANOS</legend>

                        <div class="form-group">
<%--                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>--%>
                            <div class="col-md-12">
<%--                                <input id="fname" name="name" type="text" placeholder="First Name" class="form-control">--%>
                                <asp:TextBox Width="100%" ID="fname" runat="server" type="text" placeholder="Nombre" class="form-control" MaxLength="50"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
<%--                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>--%>
                            <div class="col-md-12">
<%--                                <input id="lname" name="name" type="text" placeholder="Last Name" class="form-control">--%>
                                <asp:TextBox ID="lname" Width="100%" runat="server" type="text" placeholder="Apellidos" MaxLength="50" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
<%--                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>--%>
                            <div class="col-md-12">
                                <%--<input id="email" name="email" type="text" placeholder="Email Address" class="form-control">--%>
                                <asp:TextBox ID="email" Width="100%" runat="server" type="text" MaxLength="50" placeholder="Correo electronico" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
<%--                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>--%>
                            <div class="col-md-12">
                                <%--<input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">--%>
                                <asp:TextBox ID="phone" Width="100%" runat="server" MaxLength="50" type="text" placeholder="Celular" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
<%--                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>--%>
                            <div class="col-md-12">
<%--                                <textarea class="form-control"  name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>--%>
                                <asp:TextBox ID="message" Width="100%" class="form-control" Rows="7" runat="server" placeholder="Ingrese su masaje para nosotros aquí. Nos pondremos en contacto con usted dentro de 2 dias habiles." TextMode="MultiLine"></asp:TextBox>                            
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Enviar</button>
                            </div>
                        </div>
                    </fieldset>
            </div>
        </div>
    </div>
</div>
            </div>
</asp:Content>
