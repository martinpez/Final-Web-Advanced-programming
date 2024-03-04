
<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<%@ page import="conexionbbdd.ConexionBBDD"%>
<%@ page import="java.sql.PreparedStatement, java.sql.SQLException" %>


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
        <title>JSP Page</title>

    </head>
    <body class="dark:bg-slate-950">


        <nav class="bg-white border-gray-200 dark:bg-gray-700">
            <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
                <a href="#" class="flex items-center space-x-3 rtl:space-x-reverse">
                    <img src="../../Images/edit.png" class="h-8" alt="Logo_user" />
                    <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Update</span>
                </a>
                <div class="flex items-center space-x-6 rtl:space-x-reverse">



                </div>
            </div>
        </nav>


        <%
            // Obtener el clientId de la URL
            String clientId = request.getParameter("codCliente");

            // Establecer conexión a la base de datos
            Connection conn = ConexionBBDD.Conexion();

            // Verificar si la conexión es exitosa
            if (conn != null) {
                try {
                    // Crear una sentencia SQL para obtener los datos del cliente
                
                    String selectSQL = "SELECT * FROM clientes WHERE Cod_cliente = ?";
            
                    PreparedStatement preparedStatement = conn.prepareStatement(selectSQL);
                    preparedStatement.setString(1, clientId);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    // Verificar si se encontraron resultados
                    if (resultSet.next()) {
                        // Obtener los datos del cliente
                        String Nombre = resultSet.getString("Nombre");
                        String Direccion = resultSet.getString("Direccion");
                        String Pais = resultSet.getString("Pais");
                        String Telefono = resultSet.getString("Telefono");
                        String Correo = resultSet.getString("Correo");
                        String Password = resultSet.getString("Password");
                        String trabaja = resultSet.getString("trabaja");

                        // Mostrar el formulario con los datos del cliente
                   


        %>

        <div class="py-40 flex items-center justify-center">
            <div class="w-full max-w-sm p-4  bg-white border border-gray-200 rounded-lg  sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700">
                <form action="../controller/Client_update.jsp" method="post" class="max-w-md mx-auto">
                    <h5 class="text-xl font-medium pb-5 text-gray-900 dark:text-white">Update Client</h5>
                    <div class="relative z-0 w-full mb-5 group">
                        <input type="number" name="cod_user" id="cod_user" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                        <label for="cod_user" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Identification</label>
                    </div>
                    <div class="relative z-0 w-full mb-5 group">
                        <input value="<%= Nombre %>" type="text" name="nombre" id="nombre" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                        <label for="nombre" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Name</label>
                    </div>
                    <div class="relative z-0 w-full mb-5 group">
                        <input value="<%= Password %>" type="password" name="password_u" id="password_u" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                        <label for="password_u" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password</label>
                    </div>
                    <div class="grid md:grid-cols-2 md:gap-6">
                        <div class="relative z-0 w-full mb-5 group">
                            <input value="<%= Direccion %>"  type="text" name="direccion" id="direccion" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                            <label for="direccion" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Address</label>
                        </div>
                        <div class="relative z-0 w-full mb-5 group">

                            <label  for="pais" class="sr-only">Underline select</label>
                            <select  id="pais" name="pais" class="block py-2.5 px-0 w-full text-sm text-gray-500 bg-gray-800 border-0 border-b-2 border-gray-200 appearance-none dark:text-gray-400 dark:border-gray-700 focus:outline-none focus:ring-0 focus:border-gray-200 peer">
                                <option selected>Choose a country</option>
                                <option value="Argentina">Argentina</option>
                                <option value="Bolivia">Bolivia</option>
                                <option value="Brazil">Brazil</option>
                                <option value="Chile">Chile</option>
                                <option value="Colombia">Colombia</option>
                            </select>


                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 md:gap-6">
                        <div class="relative z-0 w-full mb-5 group">
                            <input value="<%= Telefono %>" type="tel"  name="telefono" id="telefono" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                            <label for="telefono" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Phone number</label>
                        </div>

                    </div>
                    <div class="relative z-0 w-full mb-5 group">
                        <input value="<%= Correo %>" type="email" name="correo" id="correo" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                        <label for="correo" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email</label>
                    </div>
                    <div class="grid grid-cols-2 gap-6 ">
                        <h5 class="text-gray-500 dark:text-gray-400 relative z-0 w-full mb-5 group">Trabaja?</h5>
                        <div class="control space-x-2">
                            <label class="inline-flex items-center">
                                <input type="radio" name="job" class="job" value="Si" />
                                <span class="text-gray-500 dark:text-gray-400 ml-2">Yes</span>
                            </label>
                            <label class="inline-flex items-center">
                                <input type="radio" name="job" class="job" value="No" />
                                <span class="ml-2 text-gray-500 dark:text-gray-400">No</span>
                            </label>
                        </div>
                    </div>


                    <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update</button>
             
                    <a href="consultas.jsp" class="ml-10 text-white bg-red-600 hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-red-500 dark:hover:bg-red-600 dark:focus:ring-red-800">Cancel</a>

                </form>
            </div>
        </div>

        <%
                    } else {
                        out.println("Cliente no encontrado");
                    }

                    // Cerrar el PreparedStatement y el ResultSet
                    preparedStatement.close();
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    // Cerrar la conexión a la base de datos
                    conn.close();
                }
            }
        %>








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
