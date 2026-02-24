using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Proyecto_Web
{
    public partial class Home : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ArticuloNegocio articulo = new ArticuloNegocio();
                    ListaArticulos = articulo.listar();
                    repArticulos.DataSource = ListaArticulos;
                    repArticulos.DataBind();
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("error.aspx", false);
                }
            }

        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            // Ahora CommandArgument tendrá el ID numérico real
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("DetalleArticulo.aspx?id=" + id);
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            if (Negocio.Seguridad.sesionActiva(Session["Usuario"]))
            {
                string idArticulo = ((Button)sender).CommandArgument;
                Usuario user = (Usuario)Session["Usuario"];

                FavoritosNegocio negocio = new FavoritosNegocio();
                negocio.Agregar(user.Id, int.Parse(idArticulo));

                Response.Redirect("Favoritos.aspx");
            }
        }
    }

    }