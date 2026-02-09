<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Proyecto_Web.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-placeholder {
            min-height: 60vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .icon-circle {
            width: 100px;
            height: 100px;
            background-color: #f8f9fa;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            color: #6c757d;
            font-size: 2.5rem;
            border: 2px dashed #dee2e6;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="profile-placeholder">
            <div class="icon-circle">
                <i class="bi bi-person"></i> 👤
            </div>
            <h2 class="fw-bold text-dark">Área de Perfil</h2>
            <p class="text-muted fs-5">Acá próximamente la información de tu perfil.</p>
            
            <div class="mt-4">
                <a href="Home.aspx" class="btn btn-outline-primary">Volver al Inicio</a>
            </div>
        </div>
    </div>
</asp:Content>
