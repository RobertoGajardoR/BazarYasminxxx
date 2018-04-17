<%@ Page Title="Quienes Somos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BazarYasmin.About" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav navbar-nav side-nav ">
                        <li ><a runat="server" href="/"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
                        <li ><a runat="server" href="Realizar_pedido"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Realizar Pedido</a></li>
                        <li class="active"><a runat="server" href="About"><i class="fa fa-users" aria-hidden="true"></i> Quienes Somos</a></li>
                        <li><a runat="server" href="Contact"><i class="fa fa-address-book-o" aria-hidden="true"></i> Contacto</a></li>
                    
    </ul>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <div class="thumbnail">
    <h3>Descripcion de bazar yasmin.</h3>
    <pre>Nuestras puertas están abiertas desde el año 2005 ofreciendo  la mejor atención y servicio en nuestro local, sumados a la gran diversidad de productos.
 
Con el aval y la confianza recibidos en estos años es que encaramos este nuevo desafio: Nuestra presencia en el Ciberespacio; que posibilitará mantenernos en permanente contacto con ustedes y nos permitirá interiorizarnos de sus necesidades, inquietudes, etc. 
</pre>

            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d831.3693479613399!2d-70.77245937079891!3d-33.540970798796764!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9662dd04cabcf20f%3A0xfd8e303d38c45f75!2sJacques+Cousteau+269%2C+Maip%C3%BA%2C+Regi%C3%B3n+Metropolitana!5e0!3m2!1ses!2scl!4v1479186698105" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>

    </div>
</asp:Content>
