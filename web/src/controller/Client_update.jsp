<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="conexionbbdd.ConexionBBDD" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="icon" href="../../Images/favicon.ico"/>
        <title>Insertar Cliente</title>
    </head>
    <body>

        <%
            // Obtener los parámetros del formulario
            String Cod_cliente = request.getParameter("cod_user");
            String Nombre = request.getParameter("nombre");
            String Direccion = request.getParameter("direccion");
            String Pais = request.getParameter("pais");
            String Telefono = request.getParameter("telefono");
            String Correo = request.getParameter("correo");
            String Password = request.getParameter("password_u");
            String trabaja = request.getParameter("job");

            // Establecer conexión a la base de datos
            Connection conn = ConexionBBDD.Conexion();

            // Verificar si la conexión es exitosa
            if (conn != null) {
                try {
                    // Crear una sentencia SQL para la inserción
               String updateSQL = "UPDATE clientes SET Nombre = ?, Direccion = ?, Pais = ?, Telefono = ?, Correo = ?, Password = ?, trabaja = ? WHERE Cod_cliente = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(updateSQL);

        // Establecer los parámetros en la sentencia
        preparedStatement.setString(1, Nombre);
        preparedStatement.setString(2, Direccion);
        preparedStatement.setString(3, Pais);
        preparedStatement.setString(4, Telefono);
        preparedStatement.setString(5, Correo);
        preparedStatement.setString(6, Password);
        preparedStatement.setString(7, trabaja);
        preparedStatement.setString(8, Cod_cliente);
                    // Ejecutar la instrucción de inserción
                    int rowsInserted = preparedStatement.executeUpdate();

                    // Verificar si se insertó correctamente
                    if (rowsInserted > 0) {
                        out.println("Cliente insertado exitosamente.");
                         response.sendRedirect("../view/consultas.jsp");
                    } else {
                        out.println("No se pudo insertar el cliente.");
                        
                        
                    }

                    // Cerrar el PreparedStatement
                    preparedStatement.close();

                }catch (SQLException e) {
                         e.printStackTrace();
                          out.println("Error de SQL: " + e.getMessage());
                    } catch (Exception e) {
                         e.printStackTrace();
                        out.println("Error general: " + e.getMessage());
                    }
            }
        %>

    </body>
</html>
