<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lab 2</title>
</head>
<body>
<h2>Придолоб Олександр</h2>
<h3>Варіант 4</h3>
<p>Обчислення об'ємів тіл (паралелепіпед, куб, сфера, тетраедр, тор, куля, еліпсоїд і т.д.) із точністю і параметрами,
    вказаними користувачем.

</p>
<form action="${pageContext.request.contextPath}/findVolume" method="post">
    <select id="type" name="type" onchange="myFunction()">
        <option value="1">паралелепіпед</option>
        <option value="2">куб</option>
        <option value="3">сфера</option>
        <option value="4">тетраедр</option>
        <option value="5">тор</option>
        <option value="6">еліпсоїд</option>
    </select>
    <div style='margin: 10px'>
        <label for='t'>Точність</label>
        <input type='number' name='t' id='t' step=1 required value='1' min='0'>
    </div>
    <div id="params">
        <div style='margin: 10px'>
            <label for='Sosn'>S основи</label>
            <input type='number' name='Sosn' id='Sosn' step=0.00001 required value='0.001' min='0.001'>
        </div>
        <div style='margin: 10px'>
            <label for='h'>h</label>
            <input type='number' name='h' id='h' step=0.00001 required value='0.001' min='0.001'>
        </div>
    </div>
    <br/>
    <input type="submit" value="OK"/>
</form>
<script>
    function myFunction() {
        var x = Number(document.getElementById('type').value);
        document.getElementById('params').innerHTML = "";
        var div = document.getElementById('params');
        switch (x) {
            case  1:
                var text = document.createElement('div');
                text.innerHTML = "        <div style='margin: 10px'>\n" +
                    "            <label for='Sosn'>S основи</label>\n" +
                    "            <input type='number' id='Sosn' name='Sosn' step=0.00001 required min='0.001'>\n" +
                    "        </div>\n" +
                    "        <div style='margin: 10px'>\n" +
                    "            <label for='h'>h</label>\n" +
                    "            <input type='number' id='h' name='h' step=0.00001 required min='0.001'>\n" +
                    "        </div>";
                div.appendChild(text);
                break;
            case 2:
            case 4:
                var text = document.createElement('div');
                text.innerHTML = "        <div style='margin: 10px'>\n" +
                    "            <label for='a'>a</label>\n" +
                    "            <input type='number' id='a' name='a' step=0.00001 required value='0.001' min='0.001'>\n" +
                    "        </div>";
                div.appendChild(text);
                break;
            case 3:
                var text = document.createElement('div');
                text.innerHTML = "        <div style='margin: 10px'>\n" +
                    "            <label for='R'>R</label>\n" +
                    "            <input type='number' id='R' name='R' step=0.00001 required value='0.001' min='0.001'>\n" +
                    "        </div>";
                div.appendChild(text);
                break;
            case 5:
                var text = document.createElement('div');
                text.innerHTML = "      <div style='margin: 10px'>\n" +
                    "        <label for='R'>R</label>\n" +
                    "        <input type='number' id='R' name='R' step=0.00001 required value='0.001' min='0.001'>\n" +
                    "      </div>\n" +
                    "      <div style='margin: 10px'>\n" +
                    "        <label for='rr'>r</label>\n" +
                    "        <input type='number' id='rr' name='rr' step=0.00001 required value='0.001' min='0.001'>\n" +
                    "      </div>";
                div.appendChild(text);
                break;
            case 6:
                var text = document.createElement('div');
                text.innerHTML = "      <div style='margin: 10px'>\n" +
                    "        <label for='a'>a</label>\n" +
                    "        <input type='number' id='a' name='a' step=0.00001 required value='0.001' min='0.001'>\n" +
                    "      </div>\n" +
                    "      <div style='margin: 10px'>\n" +
                    "        <label for='b'>b</label>\n" +
                    "        <input type='number' id='b' name='b' step=0.00001 required value='0.001' min='0.001'>\n" +
                    "      </div>";
                div.appendChild(text);
                break;
        }
    }
</script>
</body>
</html>