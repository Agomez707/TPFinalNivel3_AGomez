using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Web
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public List<Favorito> ListaFavoritos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                {
                    ArticuloNegocio articulo = new ArticuloNegocio();
                    FavoritosNegocio favorito = new FavoritosNegocio();

                    if (Seguridad.sesionActiva(Session["Usuario"]))
                    {
                        Usuario user = (Usuario)Session["Usuario"];


                        ListaFavoritos = favorito.Listar(user.Id);

                        if (ListaFavoritos.Count() > 0)
                        {
                            ListaArticulos = new List<Articulo>();
                            foreach (Favorito fav in ListaFavoritos)
                            {
                                Articulo aux = articulo.listar(fav.idArticulo.ToString())[0];
                                ListaArticulos.Add(aux);
                            }
                        }
                        else
                        {
                            ListaArticulos = null;
                        }

                        repArticulos.DataSource = ListaArticulos;
                        repArticulos.DataBind();

                    }
                    else
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                }            


            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx", false);
            }


        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("DetalleArticulo.aspx?id=" + id);
        }

        protected void btnQuitarFavorito_Click(object sender, EventArgs e)
        {

            try
            {
                int idArticulo = int.Parse(((Button)sender).CommandArgument);
                Usuario user = (Usuario)Session["Usuario"];

                FavoritosNegocio favoritosNegocio = new FavoritosNegocio();

                favoritosNegocio.Eliminar(user.Id, idArticulo);

                Response.Redirect("Favoritos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx", false);
            }

        }
    }
}