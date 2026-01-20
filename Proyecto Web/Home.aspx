<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Proyecto_Web.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron text-center">
        <h1>Bienvenidos al Catálogo</h1>
        <p>Explora nuestros productos.</p>
        <asp:GridView ID="dgvArticulos" runat="server" CssClass="table" AutoGenerateColumns="false">
        <columns>
           <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
           <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
           <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
           <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
           <asp:BoundField HeaderText="Precio" DataField="Precio" />
        </columns>
        </asp:GridView>
        <hr />
        
    </div>
</asp:Content>
