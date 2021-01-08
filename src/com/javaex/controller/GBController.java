package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestBookDao;
import com.javaex.vo.GBVo;

@WebServlet("/gbc")
public class GBController extends HttpServlet {
     	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//파라미터의 action 값을 받아옴
		String action = request.getParameter("action");
		System.out.println(action);
		GuestBookDao gbDao = new GuestBookDao();
		RequestDispatcher rd;
		
		if("addList".equals(action)) {
			System.out.println("입력창 및 리스트 출력");
			
			List<GBVo> gbList = gbDao.getList();
			
			//어트리뷰트에 데이터 저장
			request.setAttribute("GBList", gbList);
			
			//포워드
			rd = request.getRequestDispatcher("./WEB-INF/addList.jsp");
			rd.forward(request, response);
			
		}else if("add".equals(action)) {
			System.out.println("방명록 등록");
			
			//파라미터에서 3개 값을 받아와서 GBVo로 묶음
			GBVo gbVo = new GBVo(request.getParameter("name"), request.getParameter("password"), request.getParameter("content"));
			
			//데이터를 DB에 저장
			gbDao.insert(gbVo);
			
			//리다이렉트
			response.sendRedirect("/guestbook2/gbc?action=addList");
			
		}else if("delete".equals(action)) {
			System.out.println("방명록 삭제");
			
			//파라미터에서 2개 값을 받아와서 DB에 데이터 삭제시도 : 성공 1, 실패 0
			int result = gbDao.delete(Integer.parseInt(request.getParameter("no")), request.getParameter("password"));
			
			if(result == 0) {
				
				System.out.println("실패");
				
				request.setAttribute("delresult", result);
				//포워드
				rd = request.getRequestDispatcher("./WEB-INF/deleteForm.jsp");
				rd.forward(request, response);
				
			}else {
				//리다이렉트
				response.sendRedirect("/guestbook2/gbc?action=addList");
			}
			
		}else if("dform".equals(action)) {
			System.out.println("방명록 삭제 폼");
				
			//포워드
			rd = request.getRequestDispatcher("./WEB-INF/deleteForm.jsp");
			rd.forward(request, response);
			
		}else {
			
		}
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
