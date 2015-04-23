<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="edu.neu.cs5200.ispot.dao.*,edu.neu.cs5200.ispot.model.*" 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Article</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
   <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="style.css">
    <!-- Custom CSS -->
    <link href="css/blog-post.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
</head>

<body>

 
    <%
    Integer id = (Integer)session.getAttribute("user_id");
    Integer sid = Integer.parseInt(request.getParameter("spot_id"));
  
    
    %>
    <%
    String action = request.getParameter("action");
    
    SpotDAO sdao = new SpotDAO();
    
    if("submit".equals(action))
    {
    	
    	Spot spot = sdao.readSpotById(sid);
    	String content = request.getParameter("content");
    	Video art = new Video(null, spot, content, "V");
    	InformationDAO idao = new InformationDAO();
    	idao.createInformation(art);
    	response.setHeader("refresh","0.5;URL=All_Information.jsp"); 
    } 
    %> 
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="User.jsp">ISpot</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Upload.jsp?spot_id=<%=sid %>">Article</a>
                    </li>
                    <li>
                        <a href="Uploadvideo.jsp?spot_id=<%=sid %>">Video</a>
                    </li>
                    <li>
                        <a href="Uploadpic.jsp?spot_id=<%=sid %>">Picture</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Post Content Column -->
            <div class="col-lg-8">

                <!-- Author -->
                <p class="lead">
                    by <a href="#">SpotName</a>
                </p>
                <!-- Article Form -->
                <div class="well">
                    <h4>Upload an Video </h4>
                    <form role="form" action="Uploadvideo.jsp">
                        <div class="form-group">
                        	<input type="hidden"  class="form-control" name="spot_id" value="<%=sid %>"></input>
                        	<input class="form-control" placeholder ="give a url here" rows="3" name="content"></input>
                        </div>
                        <button type="submit" class="btn btn-primary" name="action" value="submit" >Submit</button>
                    </form>
                </div>

          
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Ispot 2015</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
