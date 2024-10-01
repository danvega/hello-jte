# JTE with Spring Boot

This repository provides an introduction to using JTE (Java Template Engine) with Spring Boot. It demonstrates how to set up and use JTE in a Spring Boot application, offering a lightweight and performant alternative to other templating engines like Thymeleaf.

## Project Structure

The project consists of the following main components:

1. `Application.java`: The main Spring Boot application class.
2. `HelloController.java`: A controller that handles requests and prepares data for the view.
3. `Page.java`: A simple record class representing page metadata.
4. `index.jte`: A JTE template file for rendering the home page.

## Getting Started

To run this project:

1. Clone the repository
2. Navigate to the project directory
3. Run `./mvnw spring-boot:run` (or `mvnw.cmd spring-boot:run` on Windows)
4. Open a web browser and go to `http://localhost:8080`

## Why Choose JTE over Thymeleaf?

While Thymeleaf is a popular choice for Spring Boot applications, JTE offers several advantages:

1. **Performance**: JTE compiles templates to Java bytecode, resulting in very efficient runtime execution. This can lead to better performance, especially for high-traffic applications.

2. **Compile-time checking**: JTE performs extensive compile-time checks, catching many errors (like missing parameters or incorrect types) during compilation rather than at runtime. This can significantly improve development productivity and reduce runtime errors.

3. **Simpler syntax**: JTE uses a syntax that's very close to Java, making it easier for Java developers to pick up. As seen in the `index.jte` file, the syntax is intuitive and closely resembles Java code.

4. **Lightweight**: JTE is a more lightweight library compared to Thymeleaf, with fewer dependencies and a smaller footprint.

5. **Better IDE support**: Because JTE compiles to Java, it can leverage existing Java tooling, often resulting in better IDE support, including features like code completion and refactoring.

6. **Hot reloading**: JTE supports hot reloading of templates in development mode without requiring a server restart, which can speed up the development process.

7. **Precompilation**: JTE allows you to precompile templates, which can be useful for detecting errors early and improving startup times in production.

8. **Explicit over implicit**: JTE favors explicit declarations (like `@param` for parameters) over implicit conventions, making templates more self-documenting and easier to understand.

## Example Usage

The `HelloController` class demonstrates how to prepare data for a JTE template:

```java
@GetMapping("/")
public String home(Model model) {
    var page = new Page("Hello, World", "This is my first home page!");
    var items = List.of("Item 1","Item 2","Item 3");

    model.addAttribute("name","Dan");
    model.addAttribute("items",items);
    model.addAttribute("page",page);

    return "index";
}
```

The corresponding `index.jte` template shows how to use this data:

```
@import dev.danvega.jte.Page
@param String name
@param java.util.List<String> items
@param Page page

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @if(!page.description().isEmpty())
        <meta name="description" content="${page.description()}">
    @endif
    <title>${page.title()}</title>
</head>
<body>
    <h1>Hello, ${name}!</h1>

    @if(items.isEmpty())
        <p>You have no items</p>
    @else
        <ul>
            @for(String item : items)
                <li>${item}</li>
            @endfor
        </ul>
    @endif

    @if(!items.isEmpty())
        <p>You have ${items.size()} items</p>
    @endif
</body>
</html>
```

This example showcases JTE's syntax for imports, parameters, conditionals, and loops, demonstrating its close similarity to Java syntax.

## Conclusion

This project serves as a starting point for using JTE with Spring Boot. JTE offers a compelling alternative to Thymeleaf, especially for projects prioritizing performance, compile-time safety, and a Java-like syntax. Feel free to explore and modify the code to suit your needs!