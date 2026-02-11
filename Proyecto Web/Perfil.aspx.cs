using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Proyecto_Web
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["Usuario"]))
            {
                Session.Add("error", "Debes loguearte para ingresar acá");
                Response.Redirect("error.aspx", false);
            }
        }
    }
}