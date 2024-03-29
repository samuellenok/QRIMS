/**
 * UploadServlet.java
 * Copyright (C) 2012 by www.codejava.net
 */
package com.upload;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 * 
 * @version 1.0
 * @author Ha Minh Nam
 */
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "";
	private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			return;
		}

		// configures some settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(THRESHOLD_SIZE);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(REQUEST_SIZE);

		// constructs the directory path to store upload file
		String uploadPath = getServletContext().getRealPath("")
				+ File.separator + UPLOAD_DIRECTORY;
		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// parses the request's content to extract file data
			List formItems = upload.parseRequest(request);
			Iterator iter = formItems.iterator();

			// iterates over form's fields
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				// processes only fields that are not form fields
				if (!item.isFormField()) {
					String fileName = new File(item.getName()).getName();
					// String filePath = uploadPath + File.separator + fileName;
					// String filePath =getServletContext().getRealPath("/") +
					// fileName;
					String filePath = "/home/sam_jomon/workspace/JAVA_ANDROID/QRBS_Server/WebContent/assets/img/staffimages/123.png";
					File storeFile = new File(filePath);
					System.out.print(filePath);
					// saves the file on disk
					item.write(storeFile);
				}
			}
			// request.setAttribute("message",
			// "Upload has been done successfully!");
			System.out.print("Upload has been done successfully!");
		} catch (Exception ex) {
			// request.setAttribute("message", "There was an error: " +
			// ex.getMessage());
			System.out.print("XXXXXXXUpload has been done unsuccessfully!"
					+ ex.getMessage());
		}
		// getServletContext().getRequestDispatcher("/message.jsp").forward(request,
		// response);
	}
}
