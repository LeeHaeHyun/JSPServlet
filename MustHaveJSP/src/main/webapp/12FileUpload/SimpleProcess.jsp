<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads");
int maxPostSize = 1024 * 1000;
String encoding = "UTF-8";
FileRenamePolicy policy = new DefaultFileRenamePolicy();
try
{
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
} catch (Exception e)
{
	e.printStackTrace();
}
%>

