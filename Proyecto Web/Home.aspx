<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Proyecto_Web.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron text-center">
        <h1>Bienvenidos al Catálogo</h1>
        <p>Explora nuestros productos.</p>

        <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
            foreach (Dominio.Articulo articulo in ListaArticulos)
            {
        %>
    
        <div class="col">
            <div class="card">
                <img src=<%: articulo.ImagenUrl %> class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%: articulo.Nombre %></h5>
                    <p class="card-text"><%: articulo.Descripcion %></p>
                    <a href="DetalleArticulo.aspx?id=<%: articulo.Id %>">Ver Detalle</a>
                </div>
            </div>
        </div>
    
        <%
            }
        %>
        </div>

    </div>
</asp:Content>
