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
                //Usuario user = (Session["usuario"] != null) ? (Usuario)Session["usuario"] : null;
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

                    btnFavorito.Visible = Seguridad.sesionActiva(Session["usuario"]);
                    
                    if (!Seguridad.esAdmin(Session["usuario"]))
                    {
                        desactivarControles();
                        btnEliminar.Visible = false;
                        btnAceptar.Visible = false;
                    }
                    else
                    {
                        btnAceptar.Visible = true;
                    }

                    if (Request.QueryString["id"] == null)
                    {
                        btnEliminar.Visible = false;
                    }

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

                    btnEliminar.Visible = Seguridad.esAdmin(Session["usuario"]);

                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx", false);
            }


        }

        private void desactivarControles()
        {
            txtCodigo.Enabled = false;
            txtNombre.Enabled = false;
            txtDescripcion.Enabled = false;
            txtPrecio.Enabled = false;
            txtImagenUrl.Enabled = false;
            ddlMarca.Enabled = false;
            ddlCategoria.Enabled = false;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();

                if (!Seguridad.esAdmin(Session["usuario"]))
                {
                    Response.Redirect("Login.aspx", false);
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtPrecio.Text))
                {
                    Session.Add("error", "Rellenar campos obligatorios");
                    Response.Redirect("error.aspx", false);
                }

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.ImagenUrl = txtImagenUrl.Text;

                float precio;
                if (float.TryParse(txtPrecio.Text, out precio))
                    nuevo.Precio = precio;
                else
                    nuevo.Precio = 0;

                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    articuloNegocio.modificar(nuevo); 
                    Response.Redirect("ListaDeProductos.aspx?msg=updated", false);
                }
                else
                {
                    articuloNegocio.agregar(nuevo);
                    Response.Redirect("ListaDeProductos.aspx?msg=added", false);
                }

                //Response.Redirect("ListaDeProductos.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
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
                    Response.Redirect("ListaDeProductos.aspx?msg=deleted", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
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

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            try
            {
                if (Negocio.Seguridad.sesionActiva(Session["Usuario"]))
                {
                    Usuario user = (Usuario)Session["Usuario"];
                    int idArticulo = int.Parse(Request.QueryString["id"].ToString());

                    if (!favoritoRepetido(user.Id, idArticulo))
                    {
                        FavoritosNegocio negocio = new FavoritosNegocio();
                        negocio.Agregar(user.Id, idArticulo);

                        Response.Redirect("Favoritos.aspx", false);
                    }

                    Response.Redirect("Favoritos.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("error.aspx", false);
            }

        }

        //esto no me convence que se repita pero por ahora lo repito para que ande je tendria que crear una clase para guardar esta funcion calculo
        private bool favoritoRepetido(int idUser, int idArticulo)
        {
            bool esRepetido = false;
            List<Favorito> ListaFav = new List<Favorito>();
            FavoritosNegocio favoritosNegocio = new FavoritosNegocio();

            ListaFav = favoritosNegocio.Listar(idUser);

            if (ListaFav.Count() > 0)
            {
                foreach (Favorito fav in ListaFav)
                {
                    if (fav.idArticulo == idArticulo)
                    {
                        esRepetido = true;
                    }
                }
            }

            return esRepetido;
        }
    }

}