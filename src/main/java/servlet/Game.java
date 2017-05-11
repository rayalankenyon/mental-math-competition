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
        String question = request.getParameter("question");
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
					int status = st.executeUpdate("INSERT INTO math.competitor VALUES('" + username + "', DEFAULT)");
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
            if(question != null) {
                session.setAttribute("question", question);
            }

            out.print("<div class='container'>");

            // print nav bar
            out.print("<nav class='navbar navbar-default'>");
            out.print("<ul class='nav navbar-nav'>");
            out.print("<li class='dropdown'>");
            out.print("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Easy<b class='caret'></b></a>");
            out.print("<ul class='dropdown-menu'>");
            //out.print("<li><a href='#'>Todo</a></li>");
            rs = st.executeQuery("SELECT id, text, answered FROM math.question WHERE points=2");
            while(rs.next()) {
                String text = rs.getString("text");
                int status = 0;
                int id = Integer.parseInt(rs.getString("id"));
                out.print("<li class='");
                if(status < 0) {
                    out.print("bg-danger");
                } else if(status > 0) {
                    out.print("bg-success");
                }
                out.print("'><a href='/Game?question=" + id + "'>" + text + "</a></li>");
            }

            out.print("<li class='divider'></li>");
            out.print("<li class='dropdown-header'>Legend</li>");
            out.print("<li class='bg-success'>Green - Answered Correctly</li>");
            out.print("<li class='bg-danger'>Red - Answered Incorrectly</li>");
            out.print("</ul>");
            out.print("</li>");

            out.print("<li class='dropdown'>");
            out.print("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Medium<b class='caret'></b></a>");
            out.print("<ul class='dropdown-menu'>");
            // 3 points
            rs = st.executeQuery("SELECT id, text, answered FROM math.question WHERE points=3");
            while(rs.next()) {
                String text = rs.getString("text");
                int status = 0;
                int id = Integer.parseInt(rs.getString("id"));
                out.print("<li class='");
                if(status < 0) {
                    out.print("bg-danger");
                } else if(status > 0) {
                    out.print("bg-success");
                }
                out.print("'><a href='/Game?question=" + id + "'>" + text + "</a></li>");
            }
            out.print("<li class='divider'></li>");
            out.print("<li class='dropdown-header'>Legend</li>");
            out.print("<li class='bg-success'>Green - Answered Correctly</li>");
            out.print("<li class='bg-danger'>Red - Answered Incorrectly</li>");
            out.print("</ul>");
            out.print("</li>");

            out.print("<li class='dropdown'>");
            out.print("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Difficult<b class='caret'></b></a>");
            out.print("<ul class='dropdown-menu'>");
            // 4 points
            rs = st.executeQuery("SELECT id, text, answered FROM math.question WHERE points=4");
            while(rs.next()) {
                String text = rs.getString("text");
                int status = 0;
                int id = Integer.parseInt(rs.getString("id"));
                out.print("<li class='");
                if(status < 0) {
                    out.print("bg-danger");
                } else if(status > 0) {
                    out.print("bg-success");
                }
                out.print("'><a href='/Game?question=" + id + "'>" + text + "</a></li>");
            }
            out.print("<li class='divider'></li>");
            out.print("<li class='dropdown-header'>Legend</li>");
            out.print("<li class='bg-success'>Green - Answered Correctly</li>");
            out.print("<li class='bg-danger'>Red - Answered Incorrectly</li>");
            out.print("</ul>");
            out.print("</li>");

            out.print("</ul>");

            out.print("<ul class='nav navbar-nav navbar-right pull-right'><li>");
            out.print("<form class='navbar-form' method='post'>");
            out.print("<input class='btn btn-primary' type='submit' value='Update Scoreboard'>");
            out.print("</form>");
            out.print("</li></ul>");
            out.print("</nav>");
            
            out.print("<div class='row'>");

	    	// question / answers form
            out.print("<div class='col-sm-8 pull-left'>");
            out.print("<div class='jumbotron'>");
            if(session.getAttribute("question") == null) {
                out.print("<h1>Welcome to Gregory Kenyon's Mental Math Competition!</h1>");
                out.print("<hr>");
                out.print("<p>Neither calculator nor scratchpaper are permitted. You get one guess for each question.</p>");
                out.print("<hr>");
                out.print("<p>To begin, select a question from a drop-down menu above -- Easy, Medium or Difficult</p>");
            }
	    	else {
                String question_id = (String)session.getAttribute("question");
                rs = st.executeQuery("SELECT text FROM math.question WHERE id=" + question_id);
                rs.next();
                out.print("<form method='post'>");
                out.print("<p>" + rs.getString("text") + "</p>");
                rs = st.executeQuery("SELECT id, text from math.answer WHERE question_id=" + question_id);
                while(rs.next()) {
                    out.print("<input type='radio' name='choice' onclick='this.form.submit();' value='" + rs.getString("id") + "'>");
                    out.print(rs.getString("text"));
                }
                out.print("</form>");
	    	}
            out.print("</div>");
            out.print("</div>");            
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
            out.print("<div class='col-sm-4 pull-right'>");
            out.print("<div class='jumbotron'>");
            out.print("<div class='panel panel-default'>");
            out.print("<div class='panel-heading'><p>Scoreboard</p></div>");
            out.print("<div class='panel-body panel-height'>");
            out.print("<div class='container-fluid'>");
            out.print("<div class='table-responsive'>");
		    out.print("<table class='table'><tr><th>Competitor</th><th>Points</th></tr>");
		    rs = st.executeQuery("SELECT username, score FROM math.competitor ORDER BY score DESC");
		    while(rs.next()) {
		    	out.print("<tr>");
		    	out.print("<td>" + rs.getString("username") + "</td>");
		    	out.print("<td>" + rs.getString("score") + "</td>");
		    	out.print("</tr>");
		    }
		    out.print("</table>");
            out.print("</div>");
            out.print("</div>");
            out.print("</div>");
            out.print("</div>");

            out.print("</div>");
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
        "<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>"+
        "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>"+
        "<link rel='stylesheet' href='//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css'>"+
        "<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>"+
        "<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>"+
        "<style>"+
        ".navbar .nav.pull-right {"+
        "float: right;"+
        "margin-right: 25px;"+
        "}"+
        ".panel-height { height: 350px; }"+
        ".panel { overflow:auto; } "+
        "</style>"+
      "</head>"+
      "<body>";
    }

    private static final String html_end() {
      return "" + 
      "</body>"+
      "</html>";
    }
} // end Game class

// ------------------------------------------------------------------------------------ //
