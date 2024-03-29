package co.nullception.udongmarket.web;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import co.nullception.udongmarket.MainCommand;
import co.nullception.udongmarket.admin.command.AjaxFaqDelete;
import co.nullception.udongmarket.admin.command.AjaxFaqSearch;
import co.nullception.udongmarket.admin.command.FAQCommand;
import co.nullception.udongmarket.admin.command.FaqDetail;
import co.nullception.udongmarket.admin.command.FaqFormCommand;
import co.nullception.udongmarket.admin.command.FaqInsert;
import co.nullception.udongmarket.admin.command.FaqUpdate;
import co.nullception.udongmarket.comm.Command;
import co.nullception.udongmarket.comments.command.AjaxCommentsDelete;
import co.nullception.udongmarket.comments.command.AjaxCommentsInsert;
import co.nullception.udongmarket.community.command.AjaxCommunityDelete;
import co.nullception.udongmarket.community.command.CommunityDetail;
import co.nullception.udongmarket.community.command.CommunityForm;
import co.nullception.udongmarket.community.command.CommunityInsert;
import co.nullception.udongmarket.community.command.CommunityList;
import co.nullception.udongmarket.community.command.CommunitySearch;
import co.nullception.udongmarket.community.command.CommunityUpdate;
import co.nullception.udongmarket.community.command.UpdateCommunity;
import co.nullception.udongmarket.deal.command.AjaxDealDelete;
import co.nullception.udongmarket.deal.command.AjaxGoDeal;
import co.nullception.udongmarket.deal.command.AjaxLikeDeal;
import co.nullception.udongmarket.deal.command.DealDetail;
import co.nullception.udongmarket.deal.command.DealForm;
import co.nullception.udongmarket.deal.command.DealInsert;
import co.nullception.udongmarket.deal.command.DealList;
import co.nullception.udongmarket.deal.command.DealSearch;
import co.nullception.udongmarket.deal.command.DealUpdate;
import co.nullception.udongmarket.deal.command.UpdateDeal;
import co.nullception.udongmarket.member.command.AjaxMemberIdCheck;
import co.nullception.udongmarket.member.command.AjaxMemberList;
import co.nullception.udongmarket.member.command.AjaxNicknameCheck;
import co.nullception.udongmarket.member.command.KakaoJoin;
import co.nullception.udongmarket.member.command.MemberJoin;
import co.nullception.udongmarket.member.command.MemberJoinForm;
import co.nullception.udongmarket.member.command.MemberList;
import co.nullception.udongmarket.member.command.MemberLogin;
import co.nullception.udongmarket.member.command.MemberLoginForm;
import co.nullception.udongmarket.member.command.MemberLogout;
import co.nullception.udongmarket.member.command.MemberAuthorChange;
import co.nullception.udongmarket.member.command.MemberAuthorUpdate;
import co.nullception.udongmarket.myPage.command.AjaxComList;
import co.nullception.udongmarket.myPage.command.AjaxCommPrintCommentLists;
import co.nullception.udongmarket.myPage.command.AjaxCommentCheck;
import co.nullception.udongmarket.myPage.command.AjaxDealList;
import co.nullception.udongmarket.myPage.command.AjaxDealState;
import co.nullception.udongmarket.myPage.command.AjaxUpdateComments;
import co.nullception.udongmarket.myPage.command.DeleteMember;
import co.nullception.udongmarket.myPage.command.MyPageUpdate;
import co.nullception.udongmarket.myPage.command.PrintCommentLists;
import co.nullception.udongmarket.myPage.command.AjaxDealPrintCommentsList;
import co.nullception.udongmarket.myPage.command.ShowMyPage;
import co.nullception.udongmarket.myPage.command.UpdateMember;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand());
		
		map.put("/memberLoginForm.do", new MemberLoginForm()); // 로그인 폼 호출
		map.put("/memberLogin.do", new MemberLogin()); // 로그인 처리
		map.put("/memberLogout.do", new MemberLogout()); // 로그아웃 처리
		map.put("/memberJoinForm.do", new MemberJoinForm()); // 회원가입 폼 호출
		map.put("/ajaxMemberIdCheck.do", new AjaxMemberIdCheck()); // 아이디 중복체크
		map.put("/ajaxNicknameCheck.do", new AjaxNicknameCheck()); // 닉네임 중복체크
		map.put("/memberJoin.do", new MemberJoin()); // 회원가입 처리
		map.put("/kakaoJoin.do", new KakaoJoin()); // 카카오로 들어올시 처리
		map.put("/memberList.do", new MemberList()); //관리자페이지 > 멤버리스트 호출
		map.put("/ajaxMemberList.do", new AjaxMemberList()); // 관리자페이지 > 멤버리스트 필터
		map.put("/memberauthorChange.do", new MemberAuthorChange()); // 멤버 권한 변경폼
		map.put("/memberAuthorUpdate.do", new MemberAuthorUpdate()); // 멤버 권한 수정해주는 메소드 
    
		map.put("/faq.do", new FAQCommand()); // FAQ List
		map.put("/faqForm.do", new FaqFormCommand()); // FAQ FORM
		map.put("/faqInsert.do" , new FaqInsert()); // FAQ 등록
		map.put("/ajaxFaqSearch.do", new AjaxFaqSearch()); //FAQ 검색
		map.put("/ajaxFaqDelete.do", new AjaxFaqDelete()); //AjaxFaq 삭제
		map.put("/faqDetail.do", new FaqDetail()); // Faq 상세 정보
		map.put("/faqUpdate.do", new FaqUpdate()); //Faq 수정
		
		map.put("/myPage.do", new ShowMyPage());//마이페이지 호출
		map.put("/deleteMember.do", new DeleteMember());//회원탈퇴
		map.put("/myPageUpdate.do", new MyPageUpdate());//마이페이지 수정 폼 호출
		map.put("/updateMember.do", new UpdateMember());//회원수정
		map.put("/ajaxDealList.do", new AjaxDealList());//회원이 카테고리별로 작성한 deal 게시판 글 조회
		map.put("/ajaxComList.do", new AjaxComList());//회원이 카테고리별로 작성한 community 게시판 글 조회
		map.put("/ajaxDealState.do", new AjaxDealState());//거래게시판 state 변경
		map.put("/ajaxcommentCheck.do", new AjaxCommentCheck()); //댓글 state 체크
		map.put("/printCommentLists.do", new PrintCommentLists());
		map.put("/ajaxDealPrintCommentLists.do", new AjaxDealPrintCommentsList());//댓글이 달린 거래게시판 리스트 출력
		map.put("/ajaxCommPrintCommentLists.do", new AjaxCommPrintCommentLists());//댓글이 달린 커뮤니티게시판 리스트 출력
		map.put("/ajaxUpdateComments.do", new AjaxUpdateComments()); //실시간 댓글 확인
		
		map.put("/dealList.do", new DealList()); 
		map.put("/dealForm.do", new DealForm()); 
		map.put("/dealInsert.do", new DealInsert()); 
		map.put("/dealSearch.do", new DealSearch()); 
		map.put("/ajaxDealDelete.do", new AjaxDealDelete()); 
		map.put("/dealDetail.do", new DealDetail()); 
		map.put("/dealUpdate.do", new DealUpdate()); 
		map.put("/updateDeal.do", new UpdateDeal()); 
		
		map.put("/ajaxLikeDeal.do", new AjaxLikeDeal());//위시리스트 
		
		map.put("/communityList.do", new CommunityList()); //커뮤 목록+페이징
		map.put("/communityForm.do", new CommunityForm()); //커뮤 폼
		map.put("/communityInsert.do", new CommunityInsert()); //커뮤 등록
		map.put("/communitySearch.do", new CommunitySearch()); //커뮤 검색
		map.put("/ajaxCommunityDelete.do", new AjaxCommunityDelete()); //커뮤 삭제
		map.put("/communityDetail.do", new CommunityDetail()); //커뮤 상세
		map.put("/communityUpdate.do", new CommunityUpdate()); //커뮤 수정폼
		map.put("/updateCommunity.do", new UpdateCommunity()); //커뮤 수정완료
		
		map.put("/ajaxCommentsDelete.do", new AjaxCommentsDelete()); //코멘트삭제
		map.put("/ajaxCommentsInsert.do", new AjaxCommentsInsert()); // ajax를 통해 댓글 등록
		map.put("/ajaxGoDeal.do", new AjaxGoDeal());//거래신청
		
		
		
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 분석 & 실행, 결과 리턴
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length()); // 요청분석

		Command command = map.get(page);
		String viewPage = command.exec(request, response); // 요청수행
		
		System.out.println("page : " +page+", viewPage : "+viewPage);

		if (!viewPage.endsWith(".do")) {
			if (viewPage.startsWith("ajax:")) { // ajax 처리
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			}
			viewPage = viewPage + ".tiles";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect(viewPage);
		}
	}

}