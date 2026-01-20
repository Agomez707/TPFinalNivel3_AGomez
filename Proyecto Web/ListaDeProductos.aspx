<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ListaDeProductos.aspx.cs" Inherits="Proyecto_Web.ListaDeProguctos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
