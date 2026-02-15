<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #ffffff; 
        }

        .login-wrapper {
            margin-top: 15vh;
            max-width: 350px;
            width: 100%;
        }

        .login-title {
            font-weight: 700;
            color: #333;
            margin-bottom: 1.5rem;
        }
        .validacion {
            color: red;
            font-size: 10px;
        }
    </style>

    <script>
        function validar() {

            const txtUsuario = document.getElementById("<%= txtUsuario.ClientID %>");
            const txtPassword = document.getElementById("<%= txtPassword.ClientID %>");

            // Validar Usuario
            if (txtUsuario.value.trim() === "") {
                txtUsuario.classList.add("is-invalid");
                return false;
            } else {
                txtUsuario.classList.remove("is-invalid");
                txtUsuario.classList.add("is-valid");
            }

            // Validar Password
            if (txtPassword.value.trim() === "") {
                txtPassword.classList.add("is-invalid");
                return false;
            } else {
                txtPassword.classList.remove("is-invalid");
                txtPassword.classList.add("is-valid");
            }

            return true;
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <div class="login-wrapper">

            <div class="text-center">
                <h2 class="login-title">Bienvenido</h2>
                <p class="text-muted mb-4">Ingresa tus credenciales para continuar</p>
            </div>

            <div class="mb-3">
                <label class="form-label text-secondary small fw-bold" >USUARIO</label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control form-control-lg"
                    placeholder="Nombre de usuario" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                <div class="invalid-feedback">
                    Por favor, ingresa tu usuario.
                </div>

            </div>

            <div class="mb-4">
                <label class="form-label text-secondary small fw-bold" >CONTRASEÑA</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg"
                    TextMode="Password" placeholder="Contraseña" oninput="this.classList.remove('is-invalid')"></asp:TextBox>
                <div class="invalid-feedback">
                    Debes introducir una contraseña.
                </div>
            </div>

            <div class="d-grid shadow-sm">
                <asp:Button ID="btnLogin" runat="server" Text="Entrar"
                    CssClass="btn btn-dark btn-lg" OnClientClick="return validar();" OnClick="btnLogin_Click" />
            </div>

            <div class="text-center mt-4">
                <p class="small">¿Eres nuevo aquí? <a href="Registro.aspx" class="text-primary text-decoration-none">Crea una cuenta</a></p>
            </div>

        </div>
    </div>
</asp:Content>
