using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CategoriasNegocio
    {
        public List<Categoria> Listar()
        {
            List<Categoria> listaCategorias = new List<Categoria>();
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("Select Id, Descripcion From CATEGORIAS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Categoria aux = new Categoria();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    listaCategorias.Add(aux);
                }

                return listaCategorias;

            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar cargar Categorias desde la base de datos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
