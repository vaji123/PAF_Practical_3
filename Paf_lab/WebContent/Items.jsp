<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="pkg.Item" %>
<%@ page import ="pkg.Item"
%>

<%
if (request.getParameter("action") != null) {
	
if (request.getParameter("itemCode") != null)
{
 Item itemObj = new Item();
 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 request.getParameter("itemName"),
 request.getParameter("itemPrice"),
 request.getParameter("itemDesc"));
 session.setAttribute("statusMsg", stsMsg);
}

else if(request.getParameter("action").toString().equalsIgnoreCase("update")) {
	Item itemObj = new Item();
	String stsMsg = itemObj.updateItem(Integer.parseInt(request.getParameter("itemID").toString()),
	request.getParameter("itemCode"),
	request.getParameter("itemName"),
	request.getParameter("itemPrice"),
	request.getParameter("itemDesc"));
	session.setAttribute("statusMsg", stsMsg);

}
else if (request.getParameter("action").toString().equalsIgnoreCase("remove")) {
	Item itemObj = new Item();
	String stsMsg = itemObj.delete_Item(Integer.parseInt(request.getParameter("itemID").toString()));
	session.setAttribute("statusMsg", stsMsg);
}

} else {
session.setAttribute("statusMsg", "");
}

%> 


 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
	<h1>Items Management</h1>

	<%
		if (request.getParameter("action") != null) {
		if (request.getParameter("action").toString().equalsIgnoreCase("select")) {
			Item itemObj = new Item();
			out.print(itemObj.read_Item_detail(Integer.parseInt(request.getParameter("itemID"))));
		} else {
			out.print("<form method='post' action='Items.jsp'> " + "<input name='action' value='insert' type='hidden'> "+
			 "Item code: <input name='itemCode' type='text'><br>"+
			 "Item name: <input name='itemName' type='text'><br> "+
			 "Item price: <input name='itemPrice' type='text'><br> "+
			 "Item description: <input name='itemDesc' type='text'><br> "+
			 "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
		}
	} else {
		out.print("<form method='post' action='Items.jsp'> " +
		 "<input name='action' value='insert' type='hidden'> "+
		 "Item code: <input name='itemCode' type='text'><br>"+
		 "Item name: <input name='itemName' type='text'><br> "+
		 "Item price: <input name='itemPrice' type='text'><br> "+
		 "Item description: <input name='itemDesc' type='text'><br> "+
		 "<input name='btnSubmit' type='submit' value='Save'> " + "</form>");
	}
	%>
	

	<%
			if (session.getAttribute("statusMsg") != null) {
			out.print(session.getAttribute("statusMsg"));
			session.setAttribute("statusMsg", null);
		}
		%>


	<% out.print(session.getAttribute("statusMsg")); %>
	
	<%
 		Item itemObj = new Item();
 		out.print(itemObj.readItems());
	%>

</body>
</html>