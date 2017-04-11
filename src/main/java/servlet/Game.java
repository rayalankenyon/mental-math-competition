/*  ****************************************************************************
    Game.java        by GR Kenyon APR 11 2017
    This is the Game servlet.  For mental math web app
    **************************************************************************** */

// ------------------------------------------------------------------------------------ //

import  java.io.* ;
import  javax.servlet.* ;
import  javax.servlet.http.* ;
import  java.util.* ;
import 	java.sql.*;
import java.net.*;

// ------------------------------------------------------------------------------------ //
public class Game extends HttpServlet
  {

  // ------------------  method to service HTTP POST requests  --------------------- //
  @Override
  public void doPost ( HttpServletRequest request, HttpServletResponse response )
    throws ServletException, IOException
    {
    response.setContentType ( "text/html" ) ;
    final PrintWriter  out  =  response.getWriter() ;
    HttpSession session = request.getSession(true);
    session.setMaxInactiveInterval(3600);
    out.print(html_start());

    if(session.isNew()) {
    	out.print("<table><tr><td>");
    	out.print("<form method='post'>");
		out.print("username: <input type='text' name='username' required><br>");
		out.print("password: <input type='password' name='password' required><br>");
		out.print("<input type='submit' value='Login or create account.'>");
		out.print("</form>");
    	out.print("</td></tr></table>");
    } else {
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	Connection con = getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;

    	if(username != null && password != null) {
			rs = st.executeQuery("SELECT * FROM math.competitor WHERE username='" + username + "' and password='" + password + "'");
			if(!rs.next()) {
				boolean success = st.execute("INSERT INTO math.competitor VALUES('" + username + "', '"+ password + "')");
				if(!success) {
					session.invalidate();
					response.sendRedirect("/");
				}
			}
			session.setAttribute("username", username);
    	}

    	// print
    	// logout	
    	// question / answers form
    	// scoreboard
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
        "<title>FHSU Mental Math Competition</title>"+
        "<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>"+
        "<style>"+
        "* {"+
          "font-family: sans-serif;"+
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
      "<div id='content'>";
    }

    private static final String html_end() {
      return "" + 
      "</div>"+
      "</body>"+
      "</html>";
    }
} // end Game class

// ------------------------------------------------------------------------------------ //
