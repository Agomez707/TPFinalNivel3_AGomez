using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class FavoritosNegocio
    {

        public List<Favorito> Listar(int id)
        {
            List<Favorito> listaFav = new List<Favorito>();
            AccesoADatos datos = new AccesoADatos();

            try
            {
                string consulta = "Select id, idArticulo from FAVORITOS where  IdUser = @id";

                datos.setearConsulta(consulta);
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Favorito favAux = new Favorito();
                    favAux.Id = (int)datos.Lector["Id"];
                    favAux.idUser = id;
                    favAux.idArticulo = (int)datos.Lector["idArticulo"];

                    listaFav.Add(favAux);
                }

                return listaFav;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar obtener la lista de favoritos desde la base de datos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void Agregar(Favorito nuevoFav)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                string consulta = "insert into FAVORITOS (IdUser, IdArticulo) values (@idUser, @idArticulo)";

                datos.setearConsulta(consulta);
                datos.setearParametro("@idUser", nuevoFav.idUser);
                datos.setearParametro("@idArticulo", nuevoFav.idArticulo);
                datos.ejecutarLectura();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar Agregar favoritos a la base de datos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void Eliminar(int idFav)
        {
            try
            {
                AccesoADatos datos = new AccesoADatos();

                string consulta = "delete from FAVORITOS where Id = @Id";

                datos.setearConsulta(consulta);
                datos.setearParametro("@Id", idFav);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar eliminar Favorito en la base de datos.", ex);
            }
      
        }
    

    }
}

