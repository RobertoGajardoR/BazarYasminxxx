<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/adm.Master" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="BazarYasmin.adm.clientes" %>
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
              
                    <li>
                        <a href="../adm/productos.aspx"><i class="fa fa-fw fa-futbol-o"></i> Productos</a>
                    </li>
                    <li class="active">
                        <a href="../adm/clientes.aspx"><i class="fa fa-fw fa-user-circle-o"></i> Clientes</a>
                    </li>
                    
                </ul>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Clientes <small>Mantenedor</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active">
                            <i class="fa fa-user-circle-o"></i> Clientes
                            </li>
                        </ol>
                                        <style>
                        .GridHeader
                        {
                            text-align:center ;   
                        }

                    </style>
                        <div class="col-lg-12" style="overflow: scroll;">

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center"  Width="1000px" EmptyDataText="No se encuentran Clientes" ShowFooter="True" BorderColor="Black"  >
                        <AlternatingRowStyle HorizontalAlign="Center" Height="35px" BackColor="#F7F7F7" />

                        <Columns>
                            <asp:TemplateField HeaderText="Nom Cliente" SortExpression="UserName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="GridHeader" />

                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="Id" SortExpression="Id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                                 <HeaderStyle CssClass="GridHeader" />

                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="GridHeader" />

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Num Celular" SortExpression="PhoneNumber">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="GridHeader" />

                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Direccion">
                                 <ItemTemplate>
                                 </ItemTemplate>
                                <HeaderStyle CssClass="GridHeader" />

                             </asp:TemplateField>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                    <asp:Button ID="Button2" runat="server" cssclass="btn btn-info" Text="Detalle" />

                                     <asp:Button ID="Button1" runat="server" cssclass="btn btn-danger" Text="Dar Baja" />
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

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Email], [PhoneNumber], [UserName], [Id] FROM [AspNetUsers]"></asp:SqlDataSource>


                    </div>
                </div>

</asp:Content>

