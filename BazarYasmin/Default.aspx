<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BazarYasmin._Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav navbar-nav side-nav ">
                        <li class="active"><a runat="server" href="/"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
                        <li ><a runat="server" href="Realizar_pedido"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Realizar Pedido</a></li>
                        <li><a runat="server" href="About"><i class="fa fa-users" aria-hidden="true"></i> Quienes Somos</a></li>
                        <li><a runat="server" href="Contact"><i class="fa fa-address-book-o" aria-hidden="true"></i> Contacto</a></li>
                    
    </ul>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
        <style>
            .itemscarusel{
                border-radius:20%;opacity: 0.8;-moz-border-radius: 0 50% / 0 100%;-webkit-border-radius: 0 50% / 0 100%;border-radius: 0 50% / 0 100%;background: #5cb85c;border: 3px solid white;
            }
            .auto-style1 {
                width: 199px;
                height: 200px;
            }
        </style>
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="img/bannerArticulosEscolares.jpg"   alt="Articulos Escolares">
      <div class="carousel-caption itemscarusel">
        <h3>Articulos Escolares</h3>
        <p>Ofrecemos gran variedad de marcas y precios en articulos escolares.</p>
      </div>
    </div>

    <div class="item">
      <img  src="img/banner-chocolate.jpg" alt="Chocolate"/>
      <div class="carousel-caption itemscarusel" >
      
 <h3 >Chocolates artesanales</h3>
        <p >Disfruta de los exquisitos productos que tenemos para ti.</p>

      </div>
      
    </div>

    <div class="item">
      <img  src="img/bannerArticuloLimpieza.jpg" alt="Articulos Limpieza"/>
      <div class="carousel-caption itemscarusel">
        <h3>Articulos de aseo</h3>
        <p>Variedad de productos de la mas alta calidad.</p>
      </div>
    </div>

    <div  class="item">
      <img src="img/bannercarrito.jpg"  alt="CarroPedidos"/>
      <div class="carousel-caption">
        
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <%--<div class="jumbotron" >
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>--%>

    <div class="row">
        <div class="col-md-4"  style="align-content:center;text-align:center">
            <h2>Entrega a Domicilio</h2>
               <img src="img/entregaDomicilio.png" class="auto-style1" width="200" height="200"/>
            <br/>
            <p  style="margin-top:10px">
                Paga con tarjeta de crédito o transferencia y recíbelas en cualquier parte de Chile.
            </p>
            <p>
                <a class="btn btn-default" href="#">Leer mas &raquo;</a>
            </p>
        </div>
        <div class="col-md-4"  style="align-content:center;text-align:center">
            <h2>Entrega en local</h2>
                        <img src="img/EntregaLocal.png" width="200" height="200" />
            <br/>
            <p style="margin-top:10px">
              Paga con tarjeta de crédito, transferencia de forma online o cuando vengas a retirar tu pedido.

            </p>
            <p>
                <a class="btn btn-default" href="#">Leer mas &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" style="align-content:center;text-align:center">
            <h2>Contra entrega</h2>
                        <img src="img/ContraEntrega.jpg" width="200" height="200" />
            <br/>
            <p style="margin-top:10px">
                Paga en tu domicilio cuando te entregemos el pedido en tu hogar.(Solo Region metropolitana)
            </p>
            <p>
                <a class="btn btn-default" href="#">Leer mas &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
