package com.jenrawson.familyfridge.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import com.jenrawson.familyfridge.domain.Account;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Person {

    private String firstName;

    private String lastName;

    private String nickName;

    private String userId;

    @ManyToOne
    private Account account;
}
