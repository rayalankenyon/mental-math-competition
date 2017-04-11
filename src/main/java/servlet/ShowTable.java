/*  ****************************************************************************
    ShowTable.java        by GR Kenyon MAR 07 2017
				EDITED FOR EXAM 1 TO INCLUDE TEXTBOOK TABLE
    This is the ShowTable servlet.  For melody-math web app
    **************************************************************************** */

// ------------------------------------------------------------------------------------ //

import  java.io.* ;
import  javax.servlet.* ;
import  javax.servlet.http.* ;
import  java.util.* ;
import 	java.sql.*;
import java.net.*;

// ------------------------------------------------------------------------------------ //
public class ShowTable extends HttpServlet
  {

  // ------------------  method to service HTTP POST requests  --------------------- //
  @Override
  public void doPost ( HttpServletRequest request, HttpServletResponse response )
    throws ServletException, IOException
    {
    response.setContentType ( "text/html" ) ;
    final PrintWriter  out  =  response.getWriter() ;
    String schema = request.getParameter("SCHEMA");
    String table = request.getParameter("TABLE");

    out.print(html_start());

    if(schema == null || table == null) {
    	out.print("<h1>Select a schema &amp; a table ...</h1>");
    }
    else {
    	out.print(html_table(schema, table));
    }

    out.print(html_end());
    out.close() ;
    } // end doPost method

  // ------------------  method to service HTTP GET requests  --------------------- //
  @Override
  public void doGet ( HttpServletRequest request, HttpServletResponse response )
    throws ServletException, IOException
    {
    this.doPost ( request, response ) ;
    } // end doGet method

    public String html_table(String schema, String table) {
    	ResultSet rs = null;
    	Statement st = null;
    	Connection con = null;
    	ResultSetMetaData rsmd = null;
    	String result = "";

    	try {
    		con = getConnection();
    		st = con.createStatement();
    		rs = st.executeQuery("SELECT * FROM " + schema + "." + table);
			rsmd = rs.getMetaData();

			int column_count = rsmd.getColumnCount();

			result += "<p>" + rsmd.getTableName(1).toUpperCase() + "</p>";
      		result += "<table><tr>";
      
			for(int col = 1; col <= column_count; col++) {
				result += "<th>";
				result += rsmd.getColumnName(col).toUpperCase();
        result += "<br>";
				result += "<small>";
				result += rsmd.getColumnTypeName(col).toUpperCase();
				result += "</small>";
				result += "</th>";
			}
			result += "</tr>";

    		while(rs.next()) { 
    			result += "<tr>";
    			for(int col = 1; col <= column_count; col++) {
    				result += "<td>" + rs.getString(col) + "</td>";
    			}
    			result += "</tr>"; 
    		}
    	} catch(SQLException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			String exceptionAsString = sw.toString();
			result += exceptionAsString;
		} catch(URISyntaxException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			String exceptionAsString = sw.toString();
			result += exceptionAsString;
    	} finally {
    		try {
    			if(rs != null) { rs.close(); }
    			if(st != null) { st.close(); }
    			if(con != null) { con.close(); }
    		} catch(SQLException e) { 
				StringWriter sw = new StringWriter();
				e.printStackTrace(new PrintWriter(sw));
				String exceptionAsString = sw.toString();
				result += exceptionAsString;   
			}

			result += "</table>";
    	}
    	return result;
    }

    private static Connection getConnection() throws URISyntaxException, SQLException {
    	String db_url = System.getenv("JDBC_DATABASE_URL");
    	return DriverManager.getConnection(db_url);
    }

    private static final String html_start() {
      return "" +
      "<!-- "+
        "Author: Gregory Kenyon"+
        "Date: 02-28-2017"+
        "Description: Melody/Math web app"+
      "-->"+
      "<!DOCTYPE html>"+
      "<html>"+
      "<head>"+
        "<meta charset='utf-8'>"+
        "<title>The melody-math Web App</title>"+
        "<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>"+
        "<style>"+
        "* {"+
          "font-family: 'Arial Black', Gadget, sans-serif;"+
        "}"+
        "ul {"+
            "list-style-type: none;"+
            "margin: 0;"+
            "padding: 0;"+
            "overflow: hidden;"+
            "background-color: #333;"+
        "}"+
        "li {"+
            "float: left;"+
        "}"+
        "li a, .dropbtn {"+
            "display: inline-block;"+
            "color: white;"+
            "text-align: center;"+
            "padding: 14px 16px;"+
            "text-decoration: none;"+
        "}"+
        "li a:hover, .dropdown:hover .dropbtn {"+
            "background-color: grey;"+
        "}"+
        "li.dropdown {"+
            "display: inline-block;"+
        "}"+
        ".dropdown-content {"+
            "display: none;"+
            "position: absolute;"+
            "background-color: #f9f9f9;"+
            "min-width: 160px;"+
            "box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);"+
            "z-index: 1;"+
        "}"+
        ".dropdown-content a {"+
            "color: black;"+
            "padding: 12px 16px;"+
            "text-decoration: none;"+
            "display: block;"+
            "text-align: left;"+
        "}"+
        ".dropdown-content a:hover {background-color: #f1f1f1}"+
        ".dropdown:hover .dropdown-content {"+
            "display: block;"+
        "}"+
        "#content {"+
          "width: 100%;"+
          "margin: 0 auto;"+
        "}"+
		"table, th, td {  margin:5px; padding: 5px; outline: 1px solid black; border-spacing: 5px; border-collapse: separate; }"+
		"th { vertical-align: center; }"+
		"h1 {"+
			"height:400px;"+
			"line-height: 400px;"+
			"text-align: center;"+
		"}"+
		"h6 {"+
			"margin: 5px;"+
		"}"+
		"p { text-align: center; margin: 5px;}"+
		"table { margin: 0 auto;}"+
        "</style>"+
      "</head>"+
      "<body>"+
      "<hr>"+
        "<ul>"+
          "<li class='dropdown'><a href='#'>MELODY</a>"+
            "<div class='dropdown-content'>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=album'>ALBUM</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=band'>BAND</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=genre'>GENRE</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=musician'>MUSICIAN</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=musician_band'>MUSICIAN_BAND</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=salesperson'>SALESPERSON</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=studio'>STUDIO</a>"+
              "<a href='/ShowTable?SCHEMA=melody&TABLE=track'>TRACK</a>"+
            "</div>"+
          "</li>"+
          "<li class='dropdown'><a href='#'>MATH</a>"+
            "<div class='dropdown-content'>"+
              "<a href='/ShowTable?SCHEMA=math&TABLE=choice'>CHOICE</a>"+
              "<a href='/ShowTable?SCHEMA=math&TABLE=competitor'>COMPETITOR</a>"+
              "<a href='/ShowTable?SCHEMA=math&TABLE=question'>QUESTION</a>"+
              "<a href='/ShowTable?SCHEMA=math&TABLE=submission'>SUBMISSION</a>"+
            "</div>"+
          "</li>"+
		  "<li class='dropdown'><a href='#'>TEXTBOOK</a>"+
            "<div class='dropdown-content'>"+
              "<a href='/ShowTable?SCHEMA=textbook&TABLE=author'>AUTHOR</a>"+
              "<a href='/ShowTable?SCHEMA=textbook&TABLE=author_title'>AUTHOR_TITLE</a>"+
              "<a href='/ShowTable?SCHEMA=textbook&TABLE=book'>BOOK</a>"+
              "<a href='/ShowTable?SCHEMA=textbook&TABLE=publisher'>PUBLISHER</a>"+
            "</div>"+
          "</li>"+
        "</ul>"+
      "<hr>"+
      "<div id='content'>";
    }

    private static final String html_end() {
      return "" + 
      "</div>"+
      "</body>"+
      "</html>";
    }
} // end ShowTable class

// ------------------------------------------------------------------------------------ //
