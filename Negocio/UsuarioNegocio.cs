using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    internal class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.setearConsulta("Select Id, Tipouser from Usuarios where usuario = @user AND pass = @pass");
                datos.setearParametro("@user",usuario.User);
                datos.setearParametro("@pass",usuario.Pass);

                datos.ejecutarAccion();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.TipoUsuario = (int)datos.Lector["Tipouser"] == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
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
