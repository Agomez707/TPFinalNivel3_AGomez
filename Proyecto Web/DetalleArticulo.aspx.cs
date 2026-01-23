using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Proyecto_Web
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {

        public string ImagenUrl { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriasNegocio categoriasNegocio = new CategoriasNegocio();

            try
            {
                if (!IsPostBack)
                {
                    ddlCategoria.DataSource = categoriasNegocio.Listar();
                    ddlCategoria.DataBind();

                    ddlMarca.DataSource = marcaNegocio.Listar();
                    ddlMarca.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            ImagenUrl = txtImagenUrl.Text;
        }
    }

}