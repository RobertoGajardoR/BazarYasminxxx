<%@ Page Title="Pedidos" Language="C#" MasterPageFile="~/adm.Master" AutoEventWireup="true" CodeBehind="pedidos.aspx.cs" Inherits="BazarYasmin.adm.pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <ul class="nav navbar-nav side-nav">
                    <li >
                        <a href="../adm/inicio.aspx"><i class="fa fa-fw fa-dashboard"></i> Inicio</a>
                    </li>
                    <li class="active">
                        <a href="../adm/pedidos.aspx"><i class="fa fa-fw fa-shopping-basket"></i> Pedidos</a>
                    </li>
              
                    <li >
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
                        Pedidos <small>Mantenedor</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active">
                            <i class="fa fa-shopping-basket"></i> Pedidos
                            </li>
                        <li class="active">
                            </li>
                        </ol>
                    <style>
                        .GridHeader
                        {
                            text-align:center ;   
                        }
                    </style>
                        <div class="col-lg-12" style="overflow: scroll;">

                            <asp:GridView ID ="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="3"  Width="1000px" EmptyDataText="No se encuentran Pedidos"  DataKeyNames="codpedido" DataSourceID="SqlDataSource1" HorizontalAlign="Center" ShowFooter="True" OnRowEditing="GridView1_RowEditing">
                                <AlternatingRowStyle HorizontalAlign="Center" Height="35px" BackColor="#F7F7F7" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Codigo" InsertVisible="False" SortExpression="codpedido">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("codpedido") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fecha" SortExpression="fechpedido">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("fechpedido") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    
                                    
                                    <asp:TemplateField HeaderText="Total" SortExpression="totalpedido">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("totalpedido") %>'></asp:Label> CLP
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nombre User" SortExpression="UserName">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entrega" SortExpression="entrega">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("entregad") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Estado">
                                        <ItemTemplate>
                                            <asp:Label ID="Labelestado" runat="server"  Text='<%# Bind("descripcion") %>'></asp:Label>
<%--                                            <asp:DropDownList ID="DropDownList1"   runat="server" DataSourceID="SqlDataSource2"   DataTextField="descripcion"   DataValueField="cod_par" Enabled="False" ></asp:DropDownList>--%>
                                        </ItemTemplate>
                                        <EditItemTemplate>

                                            <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" cssclass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="descripcion" DataValueField="cod_par">
                                                   <asp:ListItem Value="0" Text="seleccione" Selected="True"  ></asp:ListItem>

                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                         <HeaderStyle CssClass="GridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Actualizar" />
                                            &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" CausesValidation="False" CommandName="Edit" Text="Cambiar Estado" />
                                            <asp:Button runat="server" CssClass="btn btn-info" Text="Detalle" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#B5C7DE" Height="35px" ForeColor="#4A3C8C" />
                                <HeaderStyle   BackColor="#4A3C8C" Height="40px" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle    BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
                                <RowStyle  HorizontalAlign="Center" Height="35px" BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle   BackColor="#738A9C" Font-Bold="True" Height="35px" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle   BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle   BackColor="#3E3277" />
                    </asp:GridView>
                            </div>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT cod_par, descripcion FROM tabla_par WHERE (cod_tab = 1)"></asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pedidos.codpedido, CONVERT (varchar, pedidos.fechpedido, 103) AS fechpedido, pedidos.subtotal, pedidos.iva, pedidos.totalpedido, AspNetUsers.UserName, pedidos.estado, tabla_par.descripcion,pedidos.entrega, par1.descripcion as entregad FROM pedidos INNER JOIN AspNetUsers ON AspNetUsers.Id = pedidos.codcliente INNER JOIN tabla_par ON tabla_par.cod_tab = 1 AND tabla_par.cod_par = pedidos.estado INNER JOIN tabla_par as par1 ON par1.cod_tab = 2 AND par1.cod_par = pedidos.entrega" UpdateCommand="select * from pedidos" OnUpdated="updatepedido"></asp:SqlDataSource>

                    </div>
                </div>

</asp:Content>
