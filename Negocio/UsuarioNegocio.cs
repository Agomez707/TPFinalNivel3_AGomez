using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("Select id, admin, nombre, apellido, imagenPerfil, fechaNacimiento from USERS where email = @email AND pass = @pass");
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

                    if (!(datos.Lector["imagenPerfil"] is DBNull))
                        usuario.ImagenPerfil = (string)datos.Lector["imagenPerfil"];

                    return true;
                }
                return false;

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
    }
}
