<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.1.1.js"></script>
    <script>
        var ids = 3;
        var arr = [{ 'loc': 'dd', 'add': '12' }, { 'loc': 'vv', 'add': '43' }];
        //Jquery.parseJSON function in JQuery
        $(document).ready(function () {
            $("#Submit").click(function () {
                var person = {};
                person.Name = $("#name").val();

                person.Surname = $("#surname").val();
                person.WayPoints =JSON.stringify(arr);
                $.ajax({
                    type: "POST",
                    url: "Default2.aspx/SendInformation",
                    contentType: "application/json; charset=utf-8",
                    // data: "{persons:" + JSON.stringify(person) + "}",
                    // data: JSON.stringify({persons:person}),
                    data: "{'id':'" + JSON.stringify(person) + "'}",
                    success: function (response) {
                        $("#name1").text("Name:- " + response.d.Name);
                        $("#surname1").text("Surname:- " + response.d.Surname);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            });
        });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="text" name="name" id="name" />
        <input type="text" name="surname" id="surname" />
        <input type="button" value="submit" name="Submit" id="Submit" />
    </div>
         <div>
        <div id="name1"></div>
        <div id="surname1"></div>
    </div>
    </form>
</body>
</html>
