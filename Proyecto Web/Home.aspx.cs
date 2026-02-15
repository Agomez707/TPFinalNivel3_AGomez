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
    public partial class Home : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio articulo = new ArticuloNegocio();
                ListaArticulos = articulo.listarConSP();
            }
            catch (Exception ex)
            {
                Session.Add("error", "Base de datos no disponible");
                Response.Redirect("error.aspx", false);
            }

            
        }
    }
}