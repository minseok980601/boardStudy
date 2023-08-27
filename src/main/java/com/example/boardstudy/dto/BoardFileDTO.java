package com.example.boardstudy.dto;

import lombok.Data;

@Data
public class BoardFileDTO {

    private int idx;
    private int board_idx;
    private String original_file_name;
    private String stored_file_path;
    private long file_size;

}
