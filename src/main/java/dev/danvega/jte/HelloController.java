package dev.danvega.jte;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HelloController {

    @GetMapping("/")
    public String home(Model model) {
        var page = new Page("Hello, World", "This is my first home page!");
        var items = List.of("Item 1","Item 2","Item 3");

        model.addAttribute("name","Dan");
        model.addAttribute("items",items);
        model.addAttribute("page",page);

        return "index";
    }

}
