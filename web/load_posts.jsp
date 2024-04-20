<%@page import="com.demo.blog.entities.User"%>
<%@page import="com.demo.blog.dataBaseAccess.LikeDa"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.blog.entities.Post"%>
<%@page import="com.demo.blog.helper.ConnectionProvider"%>
<%@page import="com.demo.blog.dataBaseAccess.PostDa"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<!--load page-->



<div class="row">
<%
    User user=(User)session.getAttribute("currenUser");
    PostDa ps=new PostDa(ConnectionProvider.getConnection());
    
    int cid=Integer.parseInt(request.getParameter("cid"));
     List<Post> posts=null;
    if(cid==0){
         posts= ps.getAllPosts();

    }
    else{
      posts=ps.getPostByCatId(cid);
    
    }
    if(posts.size()==0){
      out.println("<h2> No posts in this category.. )</h2>");
    }
    
for(Post p:posts){

    



%>

<div class="col-md-6">
    <div class="card">
          <img class="card-img-top" src="pic/<%= p.getpPic() %>" alt="Loading..">

        <div class="card-body">
            <b>  <%=p.getpTitle() %></b>
            <p><%=p.getpContent() %></p>
        </div>
        <div class="card-footer bg-light text-center">
            <%
                
                LikeDa ld=new LikeDa(ConnectionProvider.getConnection());
                %>
                <a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-primary btn-sm"  ><i class="fa fa-thumbs-o-up"><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span> </i></a>
              <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm" >read more..</a>

            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>10</span> </i></a>
        </div>
    </div>
</div>

        <% }%>
        </div>
        
        <!--read more and commenting tag-->
        
        <!-- Button trigger modal -->
        
                                    
                            <!-- Button trigger modal -->

<!--end-->