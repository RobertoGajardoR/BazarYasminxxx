<%@ Page EnableEventValidation="true" Title="Productos" Language="C#" MasterPageFile="~/adm.Master" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="BazarYasmin.adm.productos" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <ul class="nav navbar-nav side-nav">
                    <li >
                        <a href="../adm/inicio.aspx"><i class="fa fa-fw fa-dashboard"></i> Inicio</a>
                    </li>
                    <li>
                        <a href="../adm/pedidos.aspx"><i class="fa fa-fw fa-shopping-basket"></i> Pedidos</a>
                    </li>
              
                    <li class="active">
                        <a href="../adm/productos.aspx"><i class="fa fa-fw fa-futbol-o"></i> Productos</a>
                    </li>
                    <li >
                        <a href="../adm/clientes.aspx"><i class="fa fa-fw fa-user-circle-o"></i> Clientes</a>
                    </li>
                    
                </ul>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Productos <small>Mantenedor</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active">
                            <i class="fa fa-futbol-o"></i> Productos
                            </li>
                        </ol>
                    </div>
                </div>

    
<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Agregar nuevo producto</button>
    <br />
    <br />
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nuevo producto</h4>
        </div>
        <div class="modal-body" >
  <div class="form-group" style="margin-left:auto;margin-right:auto;width:300px">
    <label for="nombre">Nombre Descripcion:</label>
      <asp:TextBox ID="nombre" CssClass="form-control" Width="100%" runat="server"></asp:TextBox>
  </div>
  <div class="form-group" style="margin-left:auto;margin-right:auto;width:300px">
    <label for="categoria"  >Categoria:</label>
      <asp:DropDownList Width="100%" ID="categoria" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="descategoria" DataValueField="codcategoria"></asp:DropDownList>
      <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [categorias] WHERE ([codcategoria] <> @codcategoria)">
          <SelectParameters>
              <asp:Parameter DefaultValue="0" Name="codcategoria" Type="Int32"></asp:Parameter>
          </SelectParameters>
      </asp:SqlDataSource>
  </div>
        
            <div class="row" style="margin-left:auto;margin-right:auto;width:300px">  
      <div class="form-group col-md-6" >
    <label for="precio">Precio:</label>
      <asp:TextBox  type="number" ID="precio" style="width:100%" CssClass="form-control" runat="server"></asp:TextBox>
  </div>
  <div class="form-group col-md-6" >
    <label for="cantidad">Cantidad:</label>
      <asp:TextBox  type="number" ID="cantidad" style="width:100%" CssClass="form-control" runat="server"></asp:TextBox>
  </div>
</div>  
 <div class="form-group" style="margin-left:auto;margin-right:auto;width:300px" >
    <label for="cantidad">Imagen:</label>
     <asp:FileUpload ID="FileUpload1" runat="server" />
  </div>

        </div>
        <div class="modal-footer">
          <button type="button" style="float:left" class="btn btn-default " data-dismiss="modal">Cerrar</button>
              <%--<button type="submit" class="btn btn-success" style="float:right">Guardar</button>--%>
            <asp:Button ID="Button1" class="btn btn-success" style="float:right" Text="Guardar" runat="server" OnClick="Button1_Click" />

        </div>
      </div>
      
    </div>
  </div>
  
</div>
    <div class="col-lg-12" style="overflow: scroll;">
        <style>
                        .GridHeader
                        {
                            text-align:center ;   
                        }
                    </style>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="codigoproducto" DataSourceID="SqlDataSource1" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True" BackColor="White" BorderColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="1000px" EmptyDataText="No se encuentran productos" PageSize="7" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#F7F7F7" />
    <Columns>
        <asp:TemplateField HeaderText="Codigo" SortExpression="codigoproducto">
                    <ItemTemplate>
                        <asp:Label ID="Labelg" runat="server" Text='<%# Bind("codigoproducto") %>'></asp:Label>
                    </ItemTemplate>
            <HeaderStyle CssClass="GridHeader" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Imagen" SortExpression="imagen">
                    <ItemTemplate>
<%--                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("imagen") %>'></asp:Label>--%>
                        <asp:Image ID="Image1" Width="30" Height="30" runat="server"   ImageUrl='<%# Eval("imagen", "~/img/productos/{0}") %>' />
                    </ItemTemplate>
           <HeaderStyle CssClass="GridHeader" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Descripcion" SortExpression="descproducto">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("descproducto") %>'></asp:Label>
                    </ItemTemplate>
            <HeaderStyle CssClass="GridHeader" />
            <EditItemTemplate>
                        <asp:TextBox ID="editdescripcion" runat="server"></asp:TextBox>
                    </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Categoria" SortExpression="codcategoria">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEstadoGrid" runat="server" Height="27px" Width="61px">
                            <asp:ListItem Value="1">Activo</asp:ListItem>
                            <asp:ListItem Value="2">Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("codcategoria") %>'></asp:Label>
                    </ItemTemplate>
            <HeaderStyle CssClass="GridHeader" />
            </asp:TemplateField>
        <asp:TemplateField HeaderText="Precio" SortExpression="´preproducto">

                    <ItemTemplate>
                        <asp:Label ID="Labelr" runat="server" Text='<%# Bind("preproducto") %>'></asp:Label>
                    </ItemTemplate>
            <HeaderStyle CssClass="GridHeader" />
            <EditItemTemplate>
                        <asp:TextBox ID="editprecio" runat="server"></asp:TextBox>
                    </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Cantidad" SortExpression="canproducto">
                    <ItemTemplate>
                        <asp:Label ID="Label51" runat="server" Text='<%# Bind("canproducto") %>'></asp:Label>
                    </ItemTemplate>
            <HeaderStyle CssClass="GridHeader" />
            <EditItemTemplate>
                        <asp:TextBox ID="editcant" runat="server"></asp:TextBox>
                    </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField  ButtonType="Image"  ControlStyle-Width="30" ControlStyle-Height="30" ShowDeleteButton="True" ShowEditButton="True" CancelImageUrl="~/img/dialog-error.png" DeleteImageUrl="~/img/trashcan_full_alt.png" DeleteText="Baja" EditImageUrl="~/img/edit.png" UpdateImageUrl="~/img/148752.png" >
                         

<ControlStyle Height="30px" Width="30px"></ControlStyle>
        </asp:CommandField>
                         

    </Columns>
        <EditRowStyle Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataRowStyle Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" Height="40px" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#E7E7FF" ForeColor="#4A3C8C" Height="35px" Wrap="True" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" HorizontalAlign="Justify" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:GridView>
 </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="SELECT * FROM [productos]" SelectCommand="SELECT * FROM [productos] where estado = 0"></asp:SqlDataSource>

    
</asp:Content>
