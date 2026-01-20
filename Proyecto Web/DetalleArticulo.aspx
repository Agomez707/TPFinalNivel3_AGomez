<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="Proyecto_Web.DetalleArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h2 class="mb-4">Detalle del Artículo</h2>

            <div class="row g-3">
                <div class="col-md-6">
                    <label for="txtCodigo" class="form-label">Código de Artículo</label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ej: ART001"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-12">
                    <label for="txtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="col-md-6">
                    <label for="ddlCategoria" class="form-label">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="col-md-8">
                    <label for="txtImagenUrl" class="form-label">URL de la Imagen</label>
                    <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" placeholder="https://..."></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

                <div class="col-12 mt-4">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary"  />
                    <a href="Home.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
