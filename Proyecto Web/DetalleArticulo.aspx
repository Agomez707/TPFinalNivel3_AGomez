<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="Proyecto_Web.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container mt-4">
        <h2 class="mb-4">Gestión de Artículo</h2>
        
        <div class="row">
            <div class="col-md-6">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Código de Artículo</label>
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" REQUIRED></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" REQUIRED></asp:TextBox>
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
                    <div class="col-md-6">
                        <label for="txtPrecio" class="form-label">Precio</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="d-flex flex-column align-items-center">
                            <div class="col-md-12 mb-3">
                                <label class="form-label">URL de la Imagen</label>
                                <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged"></asp:TextBox>
                            </div>

                            <h4 class="text-muted">Vista Previa</h4>
                            <asp:Image ID="imgPreview" runat="server"
                                CssClass="img-fluid rounded shadow"
                                Style="max-height: 300px; width: 100%; object-fit: contain;" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="row mt-4 mb-5">
            <div class="col-12 d-flex justify-content-between">
                <div>
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                    <a href="ListaDeProductos.aspx" class="btn btn-secondary">Cancelar</a>
                </div>

                <div>
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este artículo? Esta acción no se puede deshacer.');" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>