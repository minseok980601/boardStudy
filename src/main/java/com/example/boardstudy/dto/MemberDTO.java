package com.example.boardstudy.dto;

import lombok.Data;

@Data
public class MemberDTO {

    private int memIdx;
    private String memID;
    private String memPassword;
    private String memName;
    private int memAge;
    private String memGender;
    private String memEmail;
    private String memProfile;

}
