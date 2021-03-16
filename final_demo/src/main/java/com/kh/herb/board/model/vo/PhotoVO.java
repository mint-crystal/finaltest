package com.kh.herb.board.model.vo;

import org.springframework.web.multipart.MultipartFile;

/**
  * @FileName : PhotoVo.java
  * @Project : hb
  * @Date : 2016. 5. 27. 
  * @author : bin
  * @update :
  * @description : 네이버 스마트 에디터 첨부파일 VO
  */
 
public class PhotoVO {
    //photo_uploader.html페이지의 form태그내에 존재하는 file 태그의 name명과 일치시켜줌
    private MultipartFile Filedata;
    //callback URL
    private String callback;
    //콜백함수??
    private String callback_func;
 
    public MultipartFile getFiledata() {
        return Filedata;
    }
 
    public void setFiledata(MultipartFile filedata) {
        Filedata = filedata;
    }
 
    public String getCallback() {
        return callback;
    }
 
    public void setCallback(String callback) {
        this.callback = callback;
    }
 
    public String getCallback_func() {
        return callback_func;
    }
 
    public void setCallback_func(String callback_func) {
        this.callback_func = callback_func;
    }
}
