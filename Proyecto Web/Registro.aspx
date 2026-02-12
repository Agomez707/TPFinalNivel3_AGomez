<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Proyecto_Web.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .register-wrapper {
            margin-top: 8vh;
            max-width: 500px;
            width: 100%;
        }

        .register-title {
            font-weight: 700;
            color: #212529;
            margin-bottom: 0.5rem;
        }
        .form-label {
            font-size: 0.85rem;
            font-weight: 600;
            color: #6c757d;
            text-transform: uppercase;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <div class="register-wrapper">

            <div class="text-center mb-5">
                <h2 class="register-title">Crear Cuenta</h2>
                <p class="text-muted">Completa los datos para registrarte en el sistema</p>
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Juan"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Pérez"></asp:TextBox>
                </div>

                <div class="col-12">
                    <label class="form-label">Email / Usuario</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="usuario@correo.com" TextMode="Email"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Confirmar</label>
                    <asp:TextBox ID="txtPassConfirmar" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>

                <div class="col-12 d-grid mt-4">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" CssClass="btn btn-dark btn-lg shadow-sm" OnClick="btnRegistrar_Click" />
                </div>
            </div>

            <div class="text-center mt-4">
                <p class="small text-muted">¿Ya tienes una cuenta? <a href="Login.aspx" class="text-primary text-decoration-none fw-bold">Inicia sesión aquí</a></p>
            </div>

        </div>
    </div>
</asp:Content>
