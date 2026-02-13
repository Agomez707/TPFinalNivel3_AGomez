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
                    txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgNuevoPerfil.ImageUrl = "~/Imagenes/Perfil/" + user.ImagenPerfil;

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
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuario = (Usuario)Session["usuario"];

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Imagenes/Perfil/");
                    txtImagen.PostedFile.SaveAs(ruta + usuario.Id + "_perfil.jpg");
                    usuario.ImagenPerfil = usuario.Id + "_perfil.jpg";
                }
                
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);

                negocio.Actualizar(usuario);


            }
            catch(Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

    }
}