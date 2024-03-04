<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="conexionbbdd.ConexionBBDD" %>

<%
    String codClienteEliminar = request.getParameter("codCliente");

    if (codClienteEliminar != null && codClienteEliminar.matches("\\d+")) {
        int codCliente = Integer.parseInt(codClienteEliminar);

        Connection conn = ConexionBBDD.Conexion();

        if (conn != null) {
            try {
                String consultaSQL = "DELETE FROM clientes WHERE Cod_cliente = " + codCliente;
                Statement statement = conn.createStatement();

                int filasAfectadas = statement.executeUpdate(consultaSQL);

                if (filasAfectadas > 0) {
                    response.sendRedirect("../view/consultas.jsp");
                } else {
                    response.sendRedirect("errorEliminacion.jsp");
                }

                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("errorEliminacion.jsp");
            } finally {
                conn.close();
            }
        }
    } else {
        response.sendRedirect("errorEliminacion.jsp");
    }
%>