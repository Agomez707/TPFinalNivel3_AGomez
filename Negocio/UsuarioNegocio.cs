using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public void Actualizar(Usuario user)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                //datos.setearProcedimiento("ActualizarUser");
                datos.setearConsulta("update USERS set nombre = @nombre, apellido = @apellido, urlImagenPerfil = @imagenPerfil where id = @id");
                datos.setearParametro("@nombre", user.Nombre);
                datos.setearParametro("@apellido", user.Apellido);
                datos.setearParametro("@imagenPerfil", user.ImagenPerfil);
                datos.setearParametro("@id", user.Id);
                // if (user.FechaNacimiento < new DateTime(1753, 1, 1))
                // {
                // datos.setearParametro("@fechaNacimiento", DBNull.Value);
                // }
                //else
                //{
                //datos.setearParametro("@fechaNacimiento", user.FechaNacimiento);
                //}


                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar Actualizar el Usuario en la base de datos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool Loguear(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("Select id, admin, nombre, apellido, urlImagenPerfil from USERS where email = @email AND pass = @pass");
                datos.setearParametro("@email",usuario.Email);
                datos.setearParametro("@pass",usuario.Pass);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.Admin = (bool)datos.Lector["admin"];

                    if (!(datos.Lector["nombre"] is DBNull))
                        usuario.Nombre = (string)datos.Lector["nombre"];

                    if (!(datos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["apellido"];

                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                        usuario.ImagenPerfil = (string)datos.Lector["urlImagenPerfil"];

                    //if (!(datos.Lector["fechaNacimiento"] is DBNull))
                       // usuario.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());

                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar loguear el Usuario.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int RegistrarNuevo(Usuario NuevoUser)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                //datos.setearProcedimiento("RegistrarNuevoUser");
                datos.setearConsulta("insert into USERS (email, pass, nombre, apellido, admin) output inserted.id values (@email, @pass, @nombre, @apellido, 0)");
                datos.setearParametro("@email", NuevoUser.Email);
                datos.setearParametro("@pass", NuevoUser.Pass);
                datos.setearParametro("@nombre", NuevoUser.Nombre);
                datos.setearParametro("@apellido", NuevoUser.Apellido);

                return datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al intentar registrar el nuevo Usuario.", ex);
            }
            finally 
            { 
                datos.cerrarConexion(); 
            }
        }
    }
}
