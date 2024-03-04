<%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<%@ page import="conexionbbdd.ConexionBBDD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="../../Images/favicon.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            clifford: '#da373d',
                        }
                    }
                }
            }
        </script>
        <title>Consulta</title>
    </head>
    <body class="dark:bg-slate-950">








        <nav class="bg-white border-gray-200 dark:bg-gray-700">
            <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
                <a href="#" class="flex items-center space-x-3 rtl:space-x-reverse">
                    <img src="../../Images/registro.png" class="h-8" alt="Logo_user" />
                    <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Consultation</span>
                </a>
                <div class="flex items-center space-x-6 rtl:space-x-reverse">


                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                            <li class="inline-flex items-center">
                                <a href="Login.jsp" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
                                    <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
                                    </svg>
                                    Home
                                </a>
                            </li>

                            <li aria-current="page">
                                <div class="flex items-center">
                                    <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                                    </svg>
                                    <span class="ms-1 text-sm font-medium text-gray-500 md:ms-2 dark:text-gray-100">Register</span>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                                    </svg>
                                    <a href="New_client.jsp" class="ms-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ms-2 dark:text-gray-400 dark:hover:text-white">New Client</a>
                                </div>
                            </li>
                        </ol>
                    </nav>

                </div>
            </div>
        </nav>


        <div class="py-40 flex items-center justify-center">

            <%
   // Establecer conexión a la base de datos utilizando la clase ConexionBBDD
   Connection conn = ConexionBBDD.Conexion();

   // Verificar si la conexión es exitosa
   if (conn != null) {
       try {
           // Crear una sentencia SQL
           String consultaSQL = "SELECT * FROM clientes"; // Reemplaza "tu_tabla" con el nombre real de tu tabla
           Statement statement = conn.createStatement();

           // Ejecutar la consulta SELECT
           ResultSet resultSet = statement.executeQuery(consultaSQL);

           // Mostrar los resultados en una tabla HTML con el estilo deseado
           out.println("<div class=\"relative overflow-x-auto shadow-md sm:rounded-lg\">");
           out.println("<table class=\"w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400\">");
           out.println("<thead class=\"text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400\">");
           out.println("<tr>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Cedula cliente</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Nombre</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Direccion</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Pais</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Telefono</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Correo</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Contraseña</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Trabaja</th>");
           out.println("<th scope=\"col\" class=\"px-6 py-3\">Action</th>");



           out.println("</tr>");
           out.println("</thead>");
           out.println("<tbody>");

           // Iterar sobre los resultados y mostrar cada fila con el estilo deseado
while (resultSet.next()) {
    out.println("<tr class=\"bg-white border-b dark:bg-gray-800 dark:border-gray-700\">");
    out.println("<th scope=\"row\" class=\"px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white\">" + resultSet.getString("Cod_cliente") + "</th>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("Nombre") + "</td>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("Direccion") + "</td>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("Pais") + "</td>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("Telefono") + "</td>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("Correo") + "</td>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("Password") + "</td>");
    out.println("<td class=\"px-6 py-4\">" + resultSet.getString("trabaja") + "</td>");
    out.println("<td class=\"px-6 py-4\">");

    // Agregar el dropdown con las opciones de editar y eliminar
    out.println("<div class=\"relative inline-block text-left\">");
    out.println("  <div>");
    out.println("    <button onclick=\"mostrarDropdown(" + resultSet.getString("Cod_cliente") + ")\" type=\"button\" class=\"inline-flex items-center p-2 text-sm font-medium text-center text-gray-900 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none dark:text-white focus:ring-gray-50 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-600\">");
    out.println("      <svg class=\"w-5 h-5\" aria-hidden=\"true\" xmlns=\"http://www.w3.org/2000/svg\" fill=\"currentColor\" viewBox=\"0 0 4 15\">");
    out.println("        <path d=\"M3.5 1.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Zm0 6.041a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Zm0 5.959a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z\"/>");
    out.println("      </svg>");
    out.println("    </button>");
    out.println("  </div>");

    // Dropdown oculto
 // Dropdown oculto
out.println("  <div id=\"dropdown" + resultSet.getString("Cod_cliente") + "\" class=\"hidden origin-top-right absolute right-0 mt-2 w-44 rounded-lg shadow bg-white divide-y divide-gray-100 dark:bg-slate-900 dark:divide-gray-600 ring-1 ring-black ring-opacity-5 focus:outline-none z-10\">");
out.println("    <ul class=\"py-2 text-sm text-gray-700 dark:text-gray-200\" aria-labelledby=\"dropdownMenuIconButton\">");
out.println("      <li>");
out.println("        <a href=\"Update_client.jsp?codCliente=" + resultSet.getString("Cod_cliente") + "\" class=\"block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white\">Edit</a>");
out.println("      </li>");
out.println("    </ul>");
out.println("    <div class=\"py-2\">");
out.println("      <ul class=\"py-2 text-sm text-gray-700 dark:text-gray-200\" aria-labelledby=\"dropdownMenuIconButton\">");
out.println("        <li>");
out.println("          <a href=\"#\" onclick=\"eliminarCliente('" + resultSet.getString("Cod_cliente") + "')\" class=\"block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white\">Delete</a>");
out.println("        </li>");
out.println("      </ul>");
out.println("    </div>");
out.println("  </div>");

    out.println("</td>");
    out.println("</tr>");
}


           out.println("</tbody>");
           out.println("</table>");
           out.println("</div>");

           // Cerrar el ResultSet y el Statement
           resultSet.close();
           statement.close();

       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           // Cerrar la conexión a la base de datos
           conn.close();
       }
   }
   


            %>



        </div>




        <script>
            function eliminarCliente(codCliente) {
                if (confirm("¿Estás seguro de que deseas eliminar este cliente?")) {
                    // Redireccionar a la página de eliminación con el código del cliente
                    window.location.href = "../controller/eliminarUsuario.jsp?codCliente=" + codCliente;
                    
                }
            }
        </script>


        <script>
            var ultimoDropdown = null;
            function mostrarDropdown(codCliente) {
                var dropdown = document.getElementById("dropdown" + codCliente);
                dropdown.classList.toggle("hidden");
            }
            document.addEventListener("click", function (event) {
                // Verificar si el clic se realizó fuera del área del último dropdown mostrado
                if (ultimoDropdown !== null && !event.target.closest("#" + ultimoDropdown)) {
                    document.getElementById(ultimoDropdown).classList.add("hidden");
                    // Limpiar la variable
                    ultimoDropdown = null;
                }
            });
        </script>






    </body>
    <footer class="bg-white rounded-lg shadow m-4 dark:bg-gray-800">
        <div class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
            <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2023 <a href="#" class="hover:underline"> Martin Perez | Estudiante de Ingeniería de Sistemas | Universidad Los Libertadores | All Rights Reserved.</a>
            </span>
            <ul class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
                <li>
                    <a href="#" class="hover:underline me-4 md:me-6">About</a>
                </li>
                <li>
                    <a href="#" class="hover:underline me-4 md:me-6">Privacy Policy</a>
                </li>
                <li>
                    <a href="#" class="hover:underline me-4 md:me-6">Licensing</a>
                </li>
                <li>
                    <a href="#" class="hover:underline">Contact</a>
                </li>
            </ul>
        </div>
    </footer>
</html>
