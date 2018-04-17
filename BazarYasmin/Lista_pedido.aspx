<%@ Page Title="Lista pedido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lista_pedido.aspx.cs" Inherits="BazarYasmin.Lista_pedido" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav navbar-nav side-nav ">
                        <li ><a runat="server" href="/"><i class="fa fa-home" aria-hidden="true"></i> Inicio</a></li>
                        <li class="active"><a runat="server" href="Realizar_pedido"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Realizar Pedido</a></li>
                        <li><a runat="server" href="About"><i class="fa fa-users" aria-hidden="true"></i> Quienes Somos</a></li>
                        <li><a runat="server" href="Contact"><i class="fa fa-address-book-o" aria-hidden="true"></i> Contacto</a></li>
                    
    </ul>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2><%: Title %>.</h2>
              <asp:Panel CssClass="alert alert-success" runat="server" ID="alertpedido" Visible="False">
                    <%--<div class="alert alert-success">--%>
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Pedido: </strong><asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
<%--</div>--%>
    </asp:Panel>
        <div class="thumbnail" style="text-align:center">
  
            <div style="padding:10px;">    
                <asp:TextBox ID="txtCodigo" runat="server"  class="form-control" Visible="False"></asp:TextBox>
              <div class="row form-inline">
              <div style="text-align:center" class="form-inline col-sm-4 ">
                <label class="" for="lblFecha">Fecha :</label>
                <asp:Label ID="lblFecha"  class="form-control " runat="server" Text="Label" style="width:250px;margin-left:auto;margin-right:auto" ></asp:Label>
              </div>
            <div style="text-align:center" class="form-inline col-sm-4 ">
                <label class="" for="txtEntrega">Entrega :</label>
                <asp:DropDownList  AppendDataBoundItems="true" class="form-control "  style="width:250px;margin-left:auto;margin-right:auto"   ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="cod_par">
                    <asp:ListItem Value="0">Seleccione</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [cod_par], [descripcion] FROM [tabla_par] WHERE ([cod_tab] = @cod_tab)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="cod_tab" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
                <div style="text-align:center" class="form-inline col-sm-4 ">
                <label class="" for="nombre">Nombre :</label>
                <asp:TextBox ID="nombre" class="form-control " runat="server"  style="width:250px;margin-left:auto;margin-right:auto" ReadOnly="True" ></asp:TextBox>
              </div>
              <%--<div style="text-align:left" class="form-inline col-md-3 ">
                <label class="" for="TextBox2">Email :</label>
                <asp:TextBox ID="TextBox2" class="form-control "  runat="server"  style="" TextMode="Email"></asp:TextBox>
              </div>--%>
            </div>
          
            </div>
            <br/>
            <style>
            @media (max-width: 644px) {
              #listado {
                overflow: scroll;
              }
            }
            </style>
            <div id="listado"> 
                <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="603px" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField HeaderText="Quitar">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" CommandName="Borrar"  runat="server" Height="19px" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  ImageUrl="~/img/quitar.png"  Width="20px"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="codproducto" HeaderText="Codigo" />
                        <asp:BoundField DataField="desproducto" HeaderText="Descripcion" />
                        <asp:BoundField DataField="preproducto" HeaderText="Precio" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                     <asp:TextBox ID="TextBox1"  runat="server" min="1" max="10" type="number" Height="20px" Width="40px" Text="1"></asp:TextBox>
                                
                                

                                 </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="subtotal" HeaderText="Sub Total" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle HorizontalAlign="Center" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    <EmptyDataTemplate>
                        <center>
        <h2 class="letras">No ha agregado ningún producto a su pedido.</h2>
        </center>
                    </EmptyDataTemplate>
                </asp:GridView>
                    </asp:Panel>
             </div>  

            <br />
            <table class="thumbnail" style="width: 220px;margin-left:auto;margin-right:auto;margin-bottom:20px">
                <tr>
                    <td style="text-align:center; width: 110px;">SubTotal :
                </td>
                    <td style="text-align:center;width: 110px;"> 
                <asp:Label ID="lblSubTotal" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr style="text-align:center">
                    <td style="width: 110px">IVA :
                </td>
                    <td style="text-align:center;width: 110px;">
                <asp:Label ID="lblIGV" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr style="text-align:center">
                    <td style="width: 110px">Total :
                </td>
                    <td style="text-align:center;width: 110px;">
                <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label> CLP
                    </td>
                </tr>
            </table>

               <div class="row">
        <div class="col-md-4" style="text-align:center;" >
<%--            <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Continuar Compras" style="margin-left:auto;margin-right:auto" OnClick="Button2_Click" />    --%>
                    
            <asp:HyperLink style="padding:10px;margin:10px" Width="200" ID="HyperLink1" CssClass="btn btn-primary"  runat="server" NavigateUrl="~/Realizar_pedido.aspx"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Continuar Compras</asp:HyperLink>
        </div>
                           <div class="col-md-4" style="text-align:center;">
<%--                               <asp:LinkButton CssClass="btn btn-info" ID="LinkButton1"   runat="server" OnClick="Button1_Click"><i class="fa fa-refresh" aria-hidden="true"> Actualizar</i></asp:LinkButton>--%>
                             <asp:Button style="padding:10px;margin:10px;display:none;" Width="200" CssClass="btn btn-info" ID="Button1" runat="server" Text="Actualizar" OnClick="Button1_Click"  />
                               <a id="actualizar" class="btn btn-info" style="padding:10px;margin:10px;width:200px" runat="server" onserverclick="Button1_Click" ><i class='fa fa-refresh' aria-hidden='true'></i> Actualizar</a>


                                                         </div>

                           <div class="col-md-4" style="text-align:center;">
                             
                           <asp:LinkButton style="padding:10px;margin:10px" Width="200" OnClick="Button3_Click" ID="LinkButton2" CssClass="btn btn-success" runat="server"><i class="fa fa-paper-plane" aria-hidden="true"></i> Enviar Pedido</asp:LinkButton>

                <asp:Button CssClass="btn btn-success" ID="Button3" runat="server"  Text="Enviar Pedido"  OnClick="Button3_Click"  Visible="False" />
                                                      
                               
                                </div>

                </div>

                
   </div>
       
    
    
 

    <%--   </form>
     
     <form name="_xclick" action="https://www.paypal.com/es/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="robertogajardo.r@gmail.com">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="item_name" value="PedidoBY">
<input type="hidden" name="amount" value="<%: Totalpedido() %>" />
<input type="image" src="http://www.paypal.com/es_ES/i/btn/x-click-but01.gif" border="0" name="submit" alt="Realice pagos con PayPal: es rápido, gratis y seguro">
</form>
    <form>
   --%>


</asp:Content>
