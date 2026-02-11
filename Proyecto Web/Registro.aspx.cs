using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Web
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario User = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();

                User.Email = txtEmail.Text;
                User.Pass = txtPass.Text;
                User.Nombre = txtNombre.Text;
                User.Apellido = txtApellido.Text;
                //Registro mi nuevo Uusario
                User.Id = negocio.RegistrarNuevo(User);

                //logueo el usuario nuevo
                Session.Add("usuario", User);
                Response.Redirect("Perfil.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        
    }
}