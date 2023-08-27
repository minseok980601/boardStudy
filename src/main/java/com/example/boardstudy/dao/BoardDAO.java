package com.example.boardstudy.dao;

import com.example.boardstudy.dto.BoardDTO;
import com.example.boardstudy.dto.BoardFileDTO;
import com.example.boardstudy.dto.MemberDTO;
import com.example.boardstudy.pagination.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDAO {
    List<BoardDTO> selectBoardList(Criteria cri);

    void sucInsertBoard(BoardDTO boardDTO);

    BoardDTO showBoard(int boardIdx);

    void sucInsertFile(List<BoardFileDTO> list) throws Exception;

    int getBoardTotal(Criteria cri);

    List<BoardFileDTO> showBoardFileList(int boardIdx) throws Exception;

    MemberDTO loginMember(String memID, String memPassword);

    int register(MemberDTO mem);

    MemberDTO registerCheck(String memID);
}
