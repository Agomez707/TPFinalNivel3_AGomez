<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="ListaDeProductos.aspx.cs" Inherits="Proyecto_Web.ListaDeProguctos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <script>
        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            const msg = urlParams.get('msg');

            if (msg) {
                let config = {
                    duration: 3500,
                    close: true,
                    gravity: "top",
                    position: "right",
                    stopOnFocus: true
                };

                if (msg === 'added') {
                    config.text = "¡Artículo agregado con éxito!";
                    config.style = { background: "linear-gradient(to right, #00b09b, #96c93d)" }; // Verde
                } else if (msg === 'updated') {
                    config.text = "¡Artículo modificado correctamente!";
                    config.style = { background: "linear-gradient(to right, #2193b0, #6dd5ed)" }; // Azul
                } else if (msg === 'deleted') {
                    config.text = "Artículo eliminado del catálogo";
                    config.style = { background: "linear-gradient(to right, #ff5f6d, #ffc371)" }; // Rojo/Naranja
                }

                Toastify(config).showToast();
            }
        };
</script>

    <asp:UpdatePanel ID="upGrilla" runat="server">
        <ContentTemplate>

            <div class="row mb-3 align-items-end">
                <div class="col-md-4">
                    <label class="form-label fw-bold">Filtro por Nombre</label>
                    <asp:TextBox ID="txtFiltro" runat="server" CssClass="form-control"
                        AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged"
                        placeholder="Escribe para buscar..."></asp:TextBox>
                </div>

                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="mb-3">
                        <asp:CheckBox Text=" Filtro Avanzado"
                            CssClass="" ID="chkAvanzado" runat="server"
                            AutoPostBack="true"
                            OnCheckedChanged="chkAvanzado_CheckedChanged" />
                    </div>
                </div>
                

                <%if (chkAvanzado.Checked)
                    { %>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                            <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Código" />
                                <asp:ListItem Text="Marca" />
                                <asp:ListItem Text="Categoría" />
                                <asp:ListItem Text="Precio" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Filtro" runat="server" />
                            <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
                            <asp:Button Text="Reset Filtro" runat="server" CssClass="btn btn-secondary" ID="btnResetFiltro" OnClick ="btnResetFiltro_Click"/>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>

            <asp:GridView ID="dgvArticulos" runat="server" CssClass="table"
                AutoGenerateColumns="false"
                DataKeyNames="Id"
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"
                EmptyDataText="No se encontraron artículos que coincidan con la búsqueda.">
                <Columns>
                    <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                    <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
                </Columns>
            </asp:GridView>
            <hr />

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row mt-4 mb-5">
        <div class="col-12 d-flex justify-content-between">
            <div>
                <a href="DetalleArticulo.aspx" class="btn btn-primary">Agregar</a>
            </div>
        </div>
    </div>
</asp:Content>
