using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
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
                //Configuracion inicial de la pantalla
                if (!IsPostBack)
                {
                    ddlCategoria.DataSource = categoriasNegocio.Listar();
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();

                    ddlMarca.DataSource = marcaNegocio.Listar();
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    btnEliminar.Visible = false;
                }

                //Configuracion si estas modificiando
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (id != "" && !IsPostBack)
                {
                    ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                    Articulo seleccionado = (articuloNegocio.listar(id))[0];

                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagenUrl.Text = seleccionado.ImagenUrl;
                    txtPrecio.Text = seleccionado.Precio.ToString();

                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();

                    txtImagenUrl_TextChanged(sender, e);

                    btnEliminar.Visible = true;

                }



            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }


        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.Precio = float.Parse(txtPrecio.Text);
                nuevo.ImagenUrl = txtImagenUrl.Text;

                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    articuloNegocio.modificarConSP(nuevo); 
                    Response.Redirect("ListaDeProductos.aspx?msg=updated");
                }
                else
                {
                    articuloNegocio.agregarConSP(nuevo);
                    Response.Redirect("ListaDeProductos.aspx?msg=added");
                }

                //Response.Redirect("ListaDeProductos.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                

                if (Request.QueryString["id"] != null)
                {
                    articuloNegocio.eliminar(int.Parse(Request.QueryString["id"]));
                    Response.Redirect("ListaDeProductos.aspx?msg=deleted");
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgPreview.ImageUrl = txtImagenUrl.Text;

            if (string.IsNullOrWhiteSpace(txtImagenUrl.Text))
            {
                imgPreview.ImageUrl = "https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-image-not-found-vector-illustration.jpg";
            }
            
        }
    }

}