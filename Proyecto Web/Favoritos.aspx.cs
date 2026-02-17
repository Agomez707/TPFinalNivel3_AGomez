using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

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
                ArticuloNegocio articulo = new ArticuloNegocio();
                FavoritosNegocio favorito = new FavoritosNegocio();

                if (Seguridad.sesionActiva(Session["Usuario"]))
                {
                    Usuario user = (Usuario)Session["Usuario"];
                    

                    ListaFavoritos = favorito.Listar(user.Id);

                    if (ListaFavoritos.Count() != 0)
                    {
                        ListaArticulos = new List<Articulo>();
                        foreach (Favorito fav in ListaFavoritos)
                        {
                            Articulo aux = articulo.listar(fav.idArticulo.ToString())[0];
                            ListaArticulos.Add(aux);
                        }
                    }                 

                }
                else
                {
                    ListaArticulos = null;
                }
                


            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx", false);
            }




        }
    }
}