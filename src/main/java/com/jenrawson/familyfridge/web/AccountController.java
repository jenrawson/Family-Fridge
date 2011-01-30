package com.jenrawson.familyfridge.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.jenrawson.familyfridge.domain.Account;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "accounts", formBackingObject = Account.class)
@RequestMapping("/accounts")
@Controller
public class AccountController {
}
