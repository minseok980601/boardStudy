package com.example.boardstudy.controller;

import com.example.boardstudy.dto.BoardDTO;
import com.example.boardstudy.dto.BoardFileDTO;
import com.example.boardstudy.dto.MemberDTO;
import com.example.boardstudy.pagination.Criteria;
import com.example.boardstudy.pagination.Pagination;
import com.example.boardstudy.service.BoardService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/test")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/boardList")
    public String boardList(Model model, Criteria cri) {

        List<BoardDTO> boardList = boardService.selectBoardList(cri);
        model.addAttribute("boardList", boardList);

        Pagination pag = new Pagination(cri, boardService.getBoardTotal(cri));
        model.addAttribute("pag", pag);

        return "/board/boardList";
    }

    @GetMapping("/showBoard")
    public String showBoard(Model model, int board_idx) throws Exception{

        BoardDTO showBoard = boardService.showBoard(board_idx);
        model.addAttribute("showBoard", showBoard);

        List<BoardFileDTO> showFile = boardService.showBoardFileList(board_idx);
        model.addAttribute("showFile", showFile);

        return "/board/boardShow";
    }

    @GetMapping("/insertBoard")
    public String insertBoard(BoardDTO boardDTO) {

        return "/board/boardInsert";
    }

    @PostMapping("/sucInsertBoard")
    public String sucInsertBoard(BoardDTO boardDTO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{

        boardService.insertBoard(boardDTO, multipartHttpServletRequest);

        return "redirect:/test/boardList";
    }

    @GetMapping("/getBoardLogin")
    public String getLoginBoard() {

        return "/board/boardLogin";
    }

    @PostMapping("/loginMember")
    public String loginMember(HttpSession session, String memID, String memPassword) {

        MemberDTO mem = boardService.loginMember(memID, memPassword);
        session.setAttribute("mem", mem);

        return "redirect:/test/boardList";
    }

    @GetMapping("/getBoardMem")
    public String getBoardMem() {
        return "/board/boardMem";
    }

    @RequestMapping("/memRegisterCheck")
    public @ResponseBody int memRegisterCheck(@RequestParam("memID") String memID) {
        MemberDTO mem = boardService.registerCheck(memID);

        if (mem != null || memID.equals("")) {
            return 0;   // 아이디가 존재하거나 아무것도 입력하지 않은경우
        }
        return 1;   // 사용가능한 아이디
    }


    @PostMapping("/joinMember")
    public String joinMember(MemberDTO mem, String memPassword1, String memPassword2, RedirectAttributes rttr, HttpSession session) {

        if (mem.getMemID() == null || mem.getMemID().equals("") ||
            memPassword1 == null || memPassword1.equals("") ||
            memPassword2 == null || memPassword2.equals("") ||
            mem.getMemName() == null || mem.getMemName().equals("") ||
            mem.getMemAge() == 0 || mem.getMemName().equals("") ||
            mem.getMemGender() == null || mem.getMemGender().equals("") ||
            mem.getMemEmail() == null || mem.getMemEmail().equals("")) {

            rttr.addFlashAttribute("msgType", "실패메세지");
            rttr.addFlashAttribute("msg", "모든 내용을 입력하세요");

            return "redirect:/test/getBoardMem";
        }

        if (!memPassword1.equals(memPassword2)) {
            rttr.addFlashAttribute("msgType", "실패 메세지");
            rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다.");

            return "redirect:/test/getBoardMem";
        }

        int result = boardService.register(mem);
        if (result == 1) {
            rttr.addFlashAttribute("msgType", "성공 메세지");
            rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
            session.setAttribute("mem", mem);
            return "redirect:/test/boardList";
        } else {
            rttr.addFlashAttribute("msgType", "실패 메시지");
            rttr.addFlashAttribute("msg", "이미 존재하는 회원입니다.");
            return "redirect:/test/getBoardMem";
        }
    }
}
