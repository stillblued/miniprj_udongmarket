package co.nullception.udongmarket.admin.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.faq.service.FaqService;
import co.nullception.udongmarket.faq.serviceImpl.FaqServiceImpl;
import co.nullception.udongmarket.faq.vo.FaqVO;

public class FaqDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// faq 삭제
		FaqService faqDao = new FaqServiceImpl();
		FaqVO vo = new FaqVO();
		int boardId = Integer.parseInt(request.getParameter("boardId")) ;
		System.out.println(boardId);
		int cnt =faqDao.faqDelete(boardId);

		 
		PrintWriter writer;
		System.out.println("servlet cnt : " +cnt);

		try {
			if (cnt != 0) {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('삭제되었습니다.');");
				writer.println("</script>;");
				writer.close();
				response.sendRedirect("admin/faq");
			} else {
				response.setContentType("text/html; charset=UTF-8");
				writer = response.getWriter();
				writer.println("<script>alert('오류가 발생했습니다.');");
				writer.println("</script>;");
				writer.close();
				
				response.sendRedirect("admin/faq");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("cnt : " +cnt );

		return "admin/faq";

	}

}
