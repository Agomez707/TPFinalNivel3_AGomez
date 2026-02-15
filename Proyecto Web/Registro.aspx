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

        .validacion {
            color: red;
            font-size: 10px;
        }
    </style>
    <script>
        function validar() {

            const txtApellido = document.getElementById("<%= txtApellido.ClientID %>");
            const txtNombre = document.getElementById("<%= txtNombre.ClientID %>");
            const txtEmail = document.getElementById("<%= txtEmail.ClientID %>");
            const txtPass = document.getElementById("<%= txtPass.ClientID %>");
            const txtPassConfirmar = document.getElementById("<%= txtPassConfirmar.ClientID %>");

            let valido = true;
            // Validar Codigo de Producto
            if (txtApellido.value.trim() === "") {
                txtApellido.classList.add("is-invalid");
                valido = false;
            } else {
                txtApellido.classList.remove("is-invalid");
                txtApellido.classList.add("is-valid");
            }

            // Validar Nombre
            if (txtNombre.value.trim() === "") {
                txtNombre.classList.add("is-invalid");
                valido = false;
            } else {
                txtNombre.classList.remove("is-invalid");
                txtNombre.classList.add("is-valid");
            }

            // Validar Email
            if (txtEmail.value.trim() === "") {
                txtEmail.classList.add("is-invalid");
                valido = false;
            } else {
                txtEmail.classList.remove("is-invalid");
                txtEmail.classList.add("is-valid");
            }

            // Validar Password
            if (txtPass.value.trim() === "") {
                txtPass.classList.add("is-invalid");
                valido = false;
            } else {
                txtPass.classList.remove("is-invalid");
                txtPass.classList.add("is-valid");
            }

            // Validar PasswordConfirmar
            if (txtPassConfirmar.value.trim() === "" || txtPassConfirmar.value.trim() !== txtPass.value.trim()) {
                txtPassConfirmar.classList.add("is-invalid");
                valido = false;
            } else {
                txtPassConfirmar.classList.remove("is-invalid");
                txtPassConfirmar.classList.add("is-valid");
            }

            return valido;
        }

    </script>
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
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Juan" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                    <div class="invalid-feedback">
                        Debes introducir un Nombre.
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Pérez" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                    <div class="invalid-feedback">
                        Debes introducir un Apellido.
                    </div>
                </div>

                <div class="col-12">
                    <label class="form-label">Email / Usuario</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="usuario@correo.com" TextMode="Email" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                    <div class="invalid-feedback">
                        Debes introducir un Email.
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                    <div class="invalid-feedback">
                        Debes introducir una Contraseña.
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Confirmar</label>
                    <asp:TextBox ID="txtPassConfirmar" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                    <div class="invalid-feedback">
                        Las contraseñas no coinciden.
                    </div>
                </div>

                <div class="col-12 d-grid mt-4">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" CssClass="btn btn-dark btn-lg shadow-sm" OnClientClick="return validar();" OnClick="btnRegistrar_Click" />
                </div>
            </div>

            <div class="text-center mt-4">
                <p class="small text-muted">¿Ya tienes una cuenta? <a href="Login.aspx" class="text-primary text-decoration-none fw-bold">Inicia sesión aquí</a></p>
            </div>

        </div>
    </div>
</asp:Content>
