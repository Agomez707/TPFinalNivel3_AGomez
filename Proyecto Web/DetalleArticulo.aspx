<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="Proyecto_Web.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-7">
            <h2 class="mb-4">Gestión de Artículo</h2>
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Código de Artículo</label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-12">
                    <label class="form-label">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Marca</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="col-md-12">
                    <label class="form-label">URL de la Imagen</label>
                    <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
               <div class="col-md-4">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <asp:Button ID="Button1" runat="server" Text="Aceptar" CssClass="btn btn-primary" />
                    <a href="Home.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>
        </div>

        <div class="col-md-5 d-flex flex-column align-items-center justify-content-center">
            <h4 class="text-muted">Vista Previa</h4>
            <img src="https://via.placeholder.com/300"
                id="imgPreview"
                class="img-fluid rounded shadow"
                style="max-height: 400px; min-width: 300px; object-fit: contain;"
                onerror="this.src='https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-image-not-found-vector-illustration.jpg'" />
        </div>
    </div>
</asp:Content>
