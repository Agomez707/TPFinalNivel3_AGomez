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
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Seguridad.sesionActiva(Session["Usuario"]))
                {
                    Usuario user = (Usuario)Session["Usuario"];

                    txtEmail.Text = user.Email;
                    txtApellido.Text = user.Apellido;
                    txtNombre.Text = user.Nombre;

                }
                else
                {
                    Session.Add("error", "Debes loguearte para ingresar acá");
                    Response.Redirect("error.aspx", false);
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

    }
}