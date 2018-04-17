<%@ Page  Title="Realizar pedido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Realizar_pedido.aspx.cs" Inherits="BazarYasmin.Realizar_pedido" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav navbar-nav side-nav ">
                        <li ><a runat="server" href="/"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
                        <li class="active"><a runat="server" href="Realizar_pedido"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Realizar Pedido</a></li>
                        <li><a runat="server" href="About"><i class="fa fa-users" aria-hidden="true"></i> Quienes Somos</a></li>
                        <li><a runat="server" href="Contact"><i class="fa fa-address-book-o" aria-hidden="true"></i> Contacto</a></li>
                    
    </ul>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    
<asp:Panel CssClass="alert alert-success" runat="server" ID="alertproducto" Visible="False">
    <%--<div class="alert alert-success">--%>
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Producto: </strong><asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
<%--</div>--%>
    </asp:Panel>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [codcategoria], [descategoria] FROM [categorias]"></asp:SqlDataSource>
    
    <div class="container">

        <div class="row">

            <div class="col-md-3 thumbnail" style="margin-bottom:10px">
                <asp:ImageButton ID="ImageButton1" style="float:right;margin-bottom:20px"  runat="server" Height="70px" OnClick="ImageButton1_Click" Width="70px" ImageUrl="~/img/carro-de-compras.jpg" />

                
                    <asp:Label style="margin-left:20px" ID="Label1" runat="server" Text="Articulos" Font-Size="XX-Large"></asp:Label>   
                <br />
                <div style="margin-top: 20px">
                <div class="form-group">
    <label for="categoria">Categorias :</label>
    <asp:DropDownList ID="DropDownList1" type="categoria" runat="server"  DataSourceID="SqlDataSource3" DataTextField="descategoria" DataValueField="codcategoria" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" Height="30px" Width="100%">
 
</asp:DropDownList>
                 </div>

<div class="form-group">
    <label for="busqueda">Buscar producto :</label>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="Button2">
    <asp:TextBox ID="TextBox1"  style="width:100%;max-width: 800px;" Height="30px" runat="server" CssClass="form-control"></asp:TextBox>
    </asp:Panel>
        <asp:Button ID="Button2" runat="server" style="margin-top:10px" cssclass="btn btn-primary" Text="Buscar" Height="36px"  OnClick="Button2_Click" />
    <asp:Button ID="Button3" type="reset" runat="server" style="margin-top:10px;float:right"  CssClass="btn btn-default" Text="Limpiar" Height="36px" OnClick="Button3_Click" />
  </div>
                  
            </div>
                </div>
            <div class="col-md-9">

                <div class="thumbnail">
                    <style>
                    @media (max-width: 1200px) {
                      #catalogo {
                        overflow: scroll;
                      }
                    }

                        .auto-style1 {
                            width: 100%;
                            margin-left: 0px;
                        }

                    </style>
                    <div id="catalogo" class="auto-style1">
    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#666666" BorderStyle="None" BorderWidth="1px" CellPadding="4"  ForeColor="#333333" GridLines="Both" HorizontalAlign="Center" RepeatDirection="Horizontal" Width="180px" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
        <ItemTemplate >
            <asp:Image ID="Image1"  style="margin-top:5px" runat="server" Height="90px" ImageUrl='<%# "~/img/productos/"+Eval("imagen") %>' Width="90px" ImageAlign="Middle" />
            <br />
            <table style="width: 180px; height: 66px;">
                <tr>
                    <td style="width: 6px; height: 22px"><strong>Codigo: </strong></td>
                    <td style="height: 22px; width: 178px;">
                        <asp:Label ID="codproductoLabel" runat="server" Text='<%# Eval("codigoproducto") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 6px"><strong>Producto: </strong></td>
                    <td style="width: 178px">
                        <asp:Label ID="descproductoLabel" runat="server" Text='<%# Eval("descproducto") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="width: 6px"><strong>Precio: </strong></td>
                    <td style="width: 178px">
                        <asp:Label ID="preproductoLabel" runat="server" Text='<%# Eval("preproducto")%>' />
                        &nbsp;CLP</td>
                </tr>
            </table>
            
            <asp:Button style="margin-top:5px" ID="Button1" runat="server" Text="agregar"  CommandName="Seleccionar" cssclass="btn btn-success" OnClick="Button1_Click" Width="122px"  />
            
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="divPagina" id="divPagina"></div>
   
    <!-- /.container -->
    </asp:Content>
