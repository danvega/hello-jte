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

    <%-- this comment will not render ${name} --%>

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