<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="BazarYasmin.Account.OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>Utilice otro servicio para iniciar sesión.</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            
                <button type="submit"   class="<%#: Item.ToLower() %> btn btn-block btn-social btn-<%#: Item.ToLower() %>  " name="provider" value="<%#: Item %>"
                    title="Inicie sesión con su <%#: Item %> cuenta.">
                    <span class="fa fa-<%#: Item.ToLower() %> "></span>
                    <%#: Item %>
                </button>
            </p>               <style>.facebook{visibility: hidden}</style>

        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>No existen servicios de autenticación externos configurados. Consulte <a href="http://go.microsoft.com/fwlink/?LinkId=252803">este artículo</a> para obtener información sobre la configuración de esta aplicación de ASP.NET para admitir el inicio de sesión a través de servicios externos.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>
