function readServer(name)//add filter here
{
        readServerData("json.php?topic="+name);
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

var allData;

function printBook(id)
{
        html = '<table>';

        for(var x in allData.data){
                row = allData.data[x];
                if(row.ID == id){
                        console.log('!!!find');
                        html = html+'<tr><td valign="top"><img src="' + row.Okladka + '" width="230" height="350" alt="submit" /></td><td><font size="15">' + row.Tytul + '</font><table><tr><td>Autor:</td><td><font size="5" color="red">' + row.Autor + '</font></td></tr><tr><td>Rok wydania:</td><td><font size="5" color="red">' + row.RokWydania + '</font></td></tr><tr><td>Gatunek:</td><td><font size="5">' + row.Gatunek + '</font></td></tr></table></td></tr><tr><td colspan="2"><font size="5">'+row.Opis+'</font></td></tr><tr><td><font size="5" color="red">Cena: </font><font size="7" color="red">'+row.Cena+' zł. </font></td><td> <span style="float:right"><button class="bBasket"><img src="resorses/basket.png" width="80" height="80" alt="submit" /></button></span></td></tr></table>';
                  }
        }
        document.getElementById("app").innerHTML = html;
}

function reanderMyData(data)
{
        var myData = JSON.parse(data);
        allData = myData;
        var html;
        if(myData.result == "OK")
        {
                html = '<table>';
                console.log('MY-DATA', myData);
                var i = 0;
                var num_image;
                for(var x in myData.data){
                        if(i == 0){
                                row = myData.data[x];
                                html = html + '<tr><td>';
                                html = html + '<button class="book" onclick="printBook('+row.ID+')" ><table><tr><td><img src="' + row.Okladka + '" width="130" height="180" alt="submit" /></td><td><font size="5">' + row.Tytul + '</font><br><font size="3" color="red"><i>' + row.Autor + '</i></font><br>' + row.RokWydania + '<br>' + row.Gatunek + '</td></tr></table></button></td>';
                                console.log('DATA-LOOP',myData.data[x]);
                                i =1;                     
                        }
                        else if(i == 1){
                                row = myData.data[x];
                                html = html + '<td>';
                                html = html + '<button class="book" onclick="printBook('+row.ID+')"><table><tr><td><img src="' + row.Okladka + '" width="130" height="180" alt="submit" /></td><td><font size="5">' + row.Tytul + '</font><br><font size="3" color="red">' + row.Autor + '</font><br>' + row.RokWydania + '<br>' + row.Gatunek + '</td></tr></table></button></td>';
                                console.log('DATA-LOOP',myData.data[x]);
                                i =0;                      
                        }
                }
                html = html+"</table>";
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
