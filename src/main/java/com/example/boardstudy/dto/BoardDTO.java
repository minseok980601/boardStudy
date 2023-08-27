package com.example.boardstudy.dto;

import lombok.Data;

import java.util.List;

@Data
public class BoardDTO {

    private int board_idx;
    private String title;
    private String contents;
    private int hit_cnt;
    private String created_datetime;
    private String creator_id;
    private List<BoardFileDTO> fileList;
}
