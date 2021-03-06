// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jenrawson.familyfridge.web;

import com.jenrawson.familyfridge.domain.Account;
import com.jenrawson.familyfridge.domain.Person;
import java.io.UnsupportedEncodingException;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PersonController_Roo_Controller {
    
    @Autowired
    private GenericConversionService PersonController.conversionService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String PersonController.create(@Valid Person person, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("person", person);
            return "people/create";
        }
        person.persist();
        return "redirect:/people/" + encodeUrlPathSegment(person.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PersonController.createForm(Model model) {
        model.addAttribute("person", new Person());
        return "people/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PersonController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("person", Person.findPerson(id));
        model.addAttribute("itemId", id);
        return "people/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PersonController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("people", Person.findPersonEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Person.countPeople() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("people", Person.findAllPeople());
        }
        return "people/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PersonController.update(@Valid Person person, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("person", person);
            return "people/update";
        }
        person.merge();
        return "redirect:/people/" + encodeUrlPathSegment(person.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PersonController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("person", Person.findPerson(id));
        return "people/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PersonController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Person.findPerson(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/people?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("accounts")
    public Collection<Account> PersonController.populateAccounts() {
        return Account.findAllAccounts();
    }
    
    Converter<Person, String> PersonController.getPersonConverter() {
        return new Converter<Person, String>() {
            public String convert(Person person) {
                return new StringBuilder().append(person.getFirstName()).append(" ").append(person.getLastName()).append(" ").append(person.getNickName()).toString();
            }
        };
    }
    
    @PostConstruct
    void PersonController.registerConverters() {
        conversionService.addConverter(getPersonConverter());
    }
    
    private String PersonController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
