/*  ****************************************************************************
    Game.java        by GR Kenyon MAY 11 2017
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
    final int MAX_QUESTIONS = 10;
    HttpSession session = request.getSession(true);
    session.setMaxInactiveInterval(3600);
    out.print(html_start());

    if(request.getParameter("Logout") != null) {
    	session.invalidate();
    	response.sendRedirect("/");
    	return;
    }

    if(session.isNew()) {
        out.print("<h1>Welcome to Greogry Kenyon's Mental Math Competition</h1>");
        out.print("<hr>");
    	out.print("<form method='post'>");
        out.print("<label for='username'>Please enter a username of your choosing:</label>");
		out.print("<input class='form-control form-control-lg' type='text' name='username' required><br>");
		out.print("<input class='btn btn-primary' type='submit' value='Submit'>");
		out.print("</form>");
    } else {
    	String username = request.getParameter("username");
    	String choice = request.getParameter("choice");
	    ResultSet rs = null;
		Statement st = null;
		Connection con = null;

    	try {
	    	con = getConnection();
	    	st = con.createStatement();

	    	if(username != null) {
				rs = st.executeQuery("SELECT * FROM math.competitor WHERE username='" + username + "'");
				if(!rs.next()) {
					int status = st.executeUpdate("INSERT INTO math.competitor VALUES('" + username + "', DEFAULT");
					if(status <= 0) {
						session.invalidate();
						response.sendRedirect("/?Logout");
						return;
					}
				}
				session.setAttribute("username", username);
	    	}
	    	if(session.getAttribute("username") == null) {
	    		session.invalidate();
				response.sendRedirect("/");
				return;
	    	}

	    	// print
	    	// logout	
		    out.print("<table><tr><td>");
		    out.print("<form action='/?Logout' method='post'><input type='submit' value='Logout'></form>");
		    out.print("</td></tr>");
		    out.print("<tr><td>");
		    out.print("<form action='/' method='post'><input type='submit' value='Refresh'></form>");
		    out.print("</td></tr>");
		    out.print("</table>");
		    out.print("<br>");

	    	// question / answers form
            String question = session.getAttribute("question").toString();
            if(question == null) {
                out.print("welcome to gregory kenyon's mental math compettition");
            }
	    	else {
		    	// out.print("<form method='post'>");
		    	// out.print("<table><tr><th>");
		    	// rs = st.executeQuery("SELECT text from math.question WHERE id=" + current_question);
		    	// rs.next();
		    	// out.print(rs.getString("text"));
		    	// out.print("</th></tr>");
		    	// // while loop
		    	// rs = st.executeQuery("SELECT id, text, correct FROM math.answer WHERE question_id=" + current_question);
		    
		    	// while(rs.next()) {
		    	// 	out.print("<tr><td>");
		    	// 	out.print("<input type='radio' name='choice' value='" + rs.getString("id") + "' required>" + rs.getString("text"));
		    	// 	out.print("</td></tr>");
		    	// }
		    	// out.print("<tr><td><input type='submit' value='Submit'></td></tr>");
		    	// out.print("</table><br>");
		    	// out.print("</form>");
	    	}
            // if chioce != null
            //     if question not answered
            //         if choice correct
            //             increment score
            //             update completed status
            //             print correct answer popup
            //         else
            //              print wrong answer popup
            //             update completed status

	    	// scoreboard
		    out.print("<table><tr><th>Username</th><th>Score</th></tr>");
		    rs = st.executeQuery("SELECT username, score FROM math.competitor ORDER BY score DESC");
		    while(rs.next()) {
		    	out.print("<tr>");
		    	out.print("<td>" + rs.getString("username") + "</td>");
		    	out.print("<td>" + rs.getString("score") + "</td>");
		    	out.print("</tr>");
		    }
		    out.print("</table>");

    	} catch(SQLException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			out.print(sw.toString());
		} catch(URISyntaxException e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			out.print(sw.toString());
    	} finally {
    		try {
    			if(rs != null) { rs.close(); }
    			if(st != null) { st.close(); }
    			if(con != null) { con.close(); }
    		} catch(SQLException e) { 
				StringWriter sw = new StringWriter();
				e.printStackTrace(new PrintWriter(sw));
				out.print(sw.toString());
			}
    	}
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
        "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>"+
        "<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>"+
        "<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>"+
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
