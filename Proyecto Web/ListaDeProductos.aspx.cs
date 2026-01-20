using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Web
{
    public partial class ListaDeProguctos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articulo = new ArticuloNegocio();
            dgvArticulos.DataSource = articulo.listarConSP();
            dgvArticulos.DataBind();
        }
    }
}