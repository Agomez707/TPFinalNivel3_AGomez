<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Proyecto_Web.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --card-shadow: 0 10px 20px rgba(0,0,0,0.05), 0 6px 6px rgba(0,0,0,0.07);
            --card-shadow-hover: 0 15px 30px rgba(0,0,0,0.12), 0 10px 10px rgba(0,0,0,0.09);
        }

        body {
            background-color: #fcfcfc;
        }

        /* Contenedor de la Tarjeta */
        .card-modern {
            border: none;
            border-radius: 20px;
            transition: all 0.3s cubic-bezier(.25,.8,.25,1);
            overflow: hidden;
            background: #fff;
            box-shadow: var(--card-shadow);
        }

            .card-modern:hover {
                transform: translateY(-8px);
                box-shadow: var(--card-shadow-hover);
            }

        /* Contenedor de la Imagen */
        .img-container {
            padding: 20px;
            background-color: #fdfdfd;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 220px; /* Altura fija para uniformidad */
        }

        .card-img-custom {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
            transition: transform 0.5s ease;
        }

        .card-modern:hover .card-img-custom {
            transform: scale(1.05); /* Zoom suave al pasar el mouse */
        }

        /* Cuerpo de la tarjeta */
        .card-body-modern {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            text-align: center;
        }

        .product-title {
            font-weight: 700;
            font-size: 1.15rem;
            color: #1a1a1a;
            margin-bottom: 0.5rem;
        }

        .product-desc {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 1.5rem;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* Corta el texto a 2 líneas */
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 2.7rem;
        }

        /* Botón estilo píldora */
        .btn-modern {
            border-radius: 12px;
            padding: 8px 5px;
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: none;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-outline-danger:hover {
            background-color: #ff4757;
            border-color: #ff4757;
        }


        .card-modern {
            position: relative;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h1 class="display-5 fw-bold">Nuestra Colección</h1>
            <p class="text-muted">Descubre tecnología y diseño en un solo lugar.</p>
        </div>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <asp:Repeater ID="repArticulos" runat="server">
        <ItemTemplate>
            <div class="col">
                <div class="card card-modern h-100">
                    <div class="img-container">
                        <img src='<%# Eval("ImagenUrl") %>' 
                             class="card-img-custom" 
                             alt='<%# Eval("Nombre") %>'
                             onerror="this.src='https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-image-not-found-vector-illustration.jpg';">
                    </div>
                    <div class="card-body-modern h-100">
                        <h5 class="product-title"><%# Eval("Nombre") %></h5>
                        <p class="product-desc"><%# Eval("Descripcion") %></p>

                        <div class="mt-auto">
                            <div class="row g-2">
                                <%-- Botón Detalle --%>
                                <div class="col-<%# Negocio.Seguridad.sesionActiva(Session["Usuario"]) ? "6" : "12" %>">
                                    <asp:Button ID="btnDetalle" runat="server" Text="Detalle"
                                        CssClass="btn btn-dark btn-modern w-100"
                                        OnClick="btnDetalle_Click"
                                        CommandArgument='<%# Eval("Id") %>' />
                                </div>

                                <%-- Botón Favorito (sin sesion no se ve) --%>
                                <% if (Negocio.Seguridad.sesionActiva(Session["Usuario"])) { %>
                                    <div class="col-6">
                                        <asp:Button ID="btnFavorito" runat="server" Text="❤ Fav"
                                            CssClass="btn btn-outline-danger btn-modern w-100"
                                            OnClick="btnFavorito_Click"
                                            CommandArgument='<%# Eval("Id") %>' />
                                    </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
    </div>
</asp:Content>
