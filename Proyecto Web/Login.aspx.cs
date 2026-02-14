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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                if (txtUsuario.Text != "" || txtPassword.Text != "")
                {
                    usuario.Email = txtUsuario.Text;
                    usuario.Pass = txtPassword.Text;

                    if (negocio.Loguear(usuario))
                    {
                        Session.Add("usuario", usuario);
                        Response.Redirect("Perfil.aspx", false);
                    }
                    else
                    {
                        Session.Add("error", "User o Contraseña incorrectos");
                        Response.Redirect("Error.aspx", false);
                    }
                }
                else
                {
                    Session.Add("error", "Por Favor cargar User y Contraseña");
                    Response.Redirect("Error.aspx", false);
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