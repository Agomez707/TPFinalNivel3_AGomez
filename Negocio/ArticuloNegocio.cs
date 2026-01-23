using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listar()
        { 
            List<Articulo> lista = new List<Articulo>();
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("Select A.Id, Codigo, Nombre, A.Descripcion, IdMarca , M.Descripcion Marca, IdCategoria, C.Descripcion Categoria, Precio, ImagenUrl from ARTICULOS A, CATEGORIAS C, MARCAS M where A.IdMarca = M.Id and A.IdCategoria = C.Id");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];

                    aux.Marca = new Marca();
                    aux.Marca.Id = (int)datos.Lector["IdMarca"];
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    aux.Precio = Convert.ToSingle(datos.Lector["Precio"]);

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Articulo> listarConSP()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoADatos datos = new AccesoADatos();

            try
            {
                //string consulta = "Select A.Id, Codigo, Nombre, A.Descripcion, IdMarca , M.Descripcion Marca, IdCategoria, C.Descripcion Categoria, Precio, ImagenUrl from ARTICULOS A, CATEGORIAS C, MARCAS M where A.IdMarca = M.Id and A.IdCategoria = C.Id";
                //datos.setearConsulta(consulta);

                datos.setearProcedimiento("storedListar");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];

                    aux.Marca = new Marca();
                    aux.Marca.Id = (int)datos.Lector["IdMarca"];
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    aux.Precio = Convert.ToSingle(datos.Lector["Precio"]);

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void agregar(Articulo nuevo)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("Insert into ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, ImagenUrl, Precio) values (@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @ImagenUrl, @Precio)");
                datos.setearParametro("@Codigo",nuevo.Codigo);
                datos.setearParametro("@Nombre",nuevo.Nombre);
                datos.setearParametro("@Descripcion",nuevo.Descripcion);
                datos.setearParametro("@IdMarca",nuevo.Marca.Id);
                datos.setearParametro("@IdCategoria",nuevo.Categoria.Id);
                datos.setearParametro("@ImagenUrl",nuevo.ImagenUrl);
                datos.setearParametro("@Precio",nuevo.Precio);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally 
            { 
                datos.cerrarConexion(); 
            }

        }

        public void agregarConSP(Articulo nuevo)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearProcedimiento("storedAltaArticulo");
                datos.setearParametro("@codigo", nuevo.Codigo);
                datos.setearParametro("@nombre", nuevo.Nombre);
                datos.setearParametro("@descricion", nuevo.Descripcion);
                datos.setearParametro("@idMarca", nuevo.Marca.Id);
                datos.setearParametro("@idCategoria", nuevo.Categoria.Id);
                datos.setearParametro("@imagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@precio", nuevo.Precio);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void modificar(Articulo articuloMod)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("update ARTICULOS set Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion, IdMarca = @IdMarca, IdCategoria = @IdCategoria, ImagenUrl = @ImagenUrl, Precio = @Precio where Id = @Id");
                datos.setearParametro("@Id", articuloMod.Id);
                datos.setearParametro("@Codigo", articuloMod.Codigo);
                datos.setearParametro("@Nombre", articuloMod.Nombre);
                datos.setearParametro("@Descripcion", articuloMod.Descripcion);
                datos.setearParametro("@IdMarca", articuloMod.Marca.Id);
                datos.setearParametro("@IdCategoria", articuloMod.Categoria.Id);
                datos.setearParametro("@ImagenUrl", articuloMod.ImagenUrl);
                datos.setearParametro("@Precio", articuloMod.Precio);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoADatos datos = new AccesoADatos();

            try
            {
                string consulta = "Select A.Id, Codigo, Nombre, A.Descripcion, IdMarca , M.Descripcion Marca, IdCategoria, C.Descripcion Categoria, Precio, ImagenUrl from ARTICULOS A, CATEGORIAS C, MARCAS M where A.IdMarca = M.Id and A.IdCategoria = C.Id And ";

                switch (campo)
                {
                    case "Marca":
                        consulta += generarFiltro("M.Descripcion", criterio, filtro);
                        break;

                    case "Categoría":
                        consulta += generarFiltro("C.Descripcion", criterio, filtro);
                        break;

                    case "Código":
                        consulta += generarFiltro("Codigo", criterio, filtro);
                        break;

                    case "Precio":
                        switch(criterio)
                        {
                            case "Mayor a":
                                consulta += "Precio > " + filtro;
                                break;
                            case "Menor a":
                                consulta += "Precio < " + filtro;
                                break;
                            case "Igual a":
                                consulta += "Precio = " + filtro;
                                break;
                        }
                        break;

                    default:
                        break;
                }

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];

                    aux.Marca = new Marca();
                    aux.Marca.Id = (int)datos.Lector["IdMarca"];
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    aux.Precio = Convert.ToSingle(datos.Lector["Precio"]);

                    lista.Add(aux);
                }

                return lista;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        private string generarFiltro(string columna, string criterio, string filtro)
        {
            if (criterio == "Comienza con")
                return columna + " like '" + filtro + "%'";

            if (criterio == "Termina con")
                return columna + " like '%" + filtro + "'";

            return columna + " like '%" + filtro + "%'";
        }

        public void eliminar(int id)
        {
            try
            {
                AccesoADatos datos = new AccesoADatos();
                datos.setearConsulta("delete from ARTICULOS where Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
           
        }

    }

}
   

