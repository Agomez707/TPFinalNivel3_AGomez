<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Proyecto_Web.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-perfil {
            width: 150px;
            height: 150px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h2 class="mb-4">Mi Perfil</h2>
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="mb-3">
                        <asp:Image ID="imgNuevoPerfil" runat="server"
                            CssClass="img-fluid rounded-circle shadow img-perfil"
                            ImageUrl="https://cdn-icons-png.freepik.com/512/12225/12225935.png" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Cambiar Imagen</label>
                        <input type="file" id="txtImagen" runat="server" class="form-control" />
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Email (Usuario)</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Fecha de Nacimiento</label>
                            <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="col-12 mt-4">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
