package com.example.boardstudy.service;

import com.example.boardstudy.common.FileUtils;
import com.example.boardstudy.dao.BoardDAO;
import com.example.boardstudy.dto.BoardDTO;
import com.example.boardstudy.dto.BoardFileDTO;
import com.example.boardstudy.dto.MemberDTO;
import com.example.boardstudy.pagination.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardDAO boardDAO;

    @Autowired
    FileUtils fileUtils;

    public List<BoardDTO> selectBoardList(Criteria cri) {

        return boardDAO.selectBoardList(cri);
    }

    public int getBoardTotal(Criteria cri) {
        return boardDAO.getBoardTotal(cri);
    }

    public void insertBoard(BoardDTO boardDTO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{

        boardDAO.sucInsertBoard(boardDTO);
        List<BoardFileDTO> list = fileUtils.parseFileInfo(boardDTO.getBoard_idx(), multipartHttpServletRequest);
        if (CollectionUtils.isEmpty(list) == false) {
            boardDAO.sucInsertFile(list);
        }
    }

    public BoardDTO showBoard(int boardIdx) throws Exception{

        BoardDTO board = boardDAO.showBoard(boardIdx);
        List<BoardFileDTO> fileList = boardDAO.showBoardFileList(boardIdx);
        board.setFileList(fileList);

        return board;
    }

    public List<BoardFileDTO> showBoardFileList(int boardIdx) throws Exception{
        return boardDAO.showBoardFileList(boardIdx);
    }

    public MemberDTO loginMember(String memID, String memPassword) {
        return boardDAO.loginMember(memID, memPassword);
    }


    public int register(MemberDTO mem) {
        return boardDAO.register(mem);
    }

    public MemberDTO registerCheck(String memID) {
        return boardDAO.registerCheck(memID);
    }
}
