<%@ Page Title="" Language="C#" MasterPageFile="~/MiMaster.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Proyecto_Web.Favoritos" %>

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
            border-radius: 50px;
            padding: 10px 25px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.5px;
            transition: all 0.2s;
        }

        .fav-container {
            position: absolute;
            top: 15px;
            right: 15px;
            z-index: 10;
        }

        .btn-fav {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(5px);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ff4757;
            font-size: 1.2rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

            .btn-fav:hover {
                background: #ff4757;
                color: white;
                transform: scale(1.1);
            }

        .card-modern {
            position: relative;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <% if (ListaArticulos != null)
                { %>

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

                                        <%-- Botón Favorito () --%>
                                        <div class="col-6">
                                            <asp:Button ID="btnFavorito" runat="server" Text="Quitar Fav"
                                                CssClass="btn btn-outline-danger btn-modern w-100"
                                                OnClick="btnQuitarFavorito_Click"
                                                CommandArgument='<%# Eval("Id") %>' />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <% }
                else
                { %>
            <div class="container d-flex justify-content-center">
                <div class="text-center">
                    <div class="mb-3">
                        <i class="bi bi-suit-heart text-secondary" style="font-size: 4rem; opacity: 0.3;"></i>
                    </div>
                    <h2 class="display-6 fw-bold" style="color: #444; letter-spacing: -1px;">No hay favoritos</h2>
                    <p class="text-muted fs-5">Parece que aún no has guardado nada.</p>

                    <div class="mt-4">
                        <a href="Home.aspx" class="btn btn-outline-dark rounded-pill px-4 py-2">Explorar productos
                        </a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</asp:Content>
