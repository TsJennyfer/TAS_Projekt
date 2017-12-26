function myfunction(e)
{
        e.preventDefault();
        var myText = document.getElementById("textbox").value;
        document.getElementById('myDiv').innerHTML = myText;
        var myData = JSON.parse(myText);
        console.log(myData);
}

function readServer(name)
{
        readServerData("json.php?topic="+name);
        readServerData();
}

function readServerData(file)
{
        var rawFile = new XMLHttpRequest();
        rawFile.overrideMimeType("application/json");

        rawFile.open("GET", file, false);
        rawFile.onreadystatechange = function ()
        {
                if(rawFile.readyState === 4)
                {
                        if(rawFile.status === 200 || rawFile.status == 0)
                        {
                                var allText = rawFile.responseText;
                                reanderMyData(allText);
                        }
                }
        }
        rawFile.send(null);
}
/*function readServerData(file)
{
        
        var reader = new FileReader();
        reader.onload = function(){
            var text = reader.result;
          // var node = document.getElementById('output');
           // node.innerText = text;
            console.log(text);
        }
        reader.readAsText(file);
 }

function readServerData()
{
    var data = '{"index1":"value1", "index2":[1,2,3]}';
    
}
*/
function reanderMyData(data)
{
        var myData = JSON.parse(data);
        var html;
        if(myData.result == "OK")
        {
                html = '<table class="table1">';
                console.log('MY-DATA', myData);
                var i = 0;
                for(var x in myData.data){
                        if(i == 0){
                                row = myData.data[x];
                                html = html + '<tr><td>';
                                html = html + '<button class="book"><table><tr><td><img src="resorses/ava3.png" width="170" height="180" alt="submit" /></td><td><font size="5">' + row.Tytul + '</font><br><font size="3" color="red" ><i>' + row.Autor + '</i></font><br>' + row.RokWydania + '<br>' + row.Gatunek + '</td></tr></table></button></td>';
                                console.log('DATA-LOOP',myData.data[x]);
                                i =1;                      
                        }
                        else if(i == 1){
                                row = myData.data[x];
                                html = html + '<td>';
                                html = html + '<button class="book"><table><tr><td><img src="resorses/ava3.png" width="170" height="180" alt="submit" /></td><td><font size="5">' + row.Tytul + '</font><br><font size="3" color="red" ><i>' + row.Autor + '</i></font><br>' + row.RokWydania + '<br>' + row.Gatunek + '</td></tr></table></button></td>';
                                console.log('DATA-LOOP',myData.data[x]);
                                i =0;                      
                        }
                }
                html = html+"</table>";//<button onclick="location='onebook.html'"></button>
                document.getElementById("app").innerHTML = html;
        }
        else allert("error");
}

$(document).ready(function(){

        $("#myCarousel").carousel();

        $(".item1").click(function(){
                $("#myCarousel").carousel(0);
        });
        $(".item2").click(function(){
                $("#myCarousel").carousel(1);
        });
        $(".item3").click(function(){
                $("#myCarousel").carousel(2);
        });
        $(".item4").click(function(){
                $("#myCarousel").carousel(3);
        });

        $(".left").click(function(){
                $("#myCarousel").carousel("prev");
        });
        $(".right").click(function(){
                $("#myCarousel").carousel("next");
        });
});

