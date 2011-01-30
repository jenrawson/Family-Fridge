package com.jenrawson.familyfridge.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import com.jenrawson.familyfridge.domain.Person;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Account {

    @ManyToOne
    private Person owner;
}
