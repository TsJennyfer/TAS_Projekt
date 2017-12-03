function myfunction(e)
{
        e.preventDefault();
        var myText = document.getElementById("textbox").value;
        document.getElementById('myDiv').innerHTML = myText;
        var myData = JSON.parse(myText);
        console.log(myData);
}

function readServer()
{
        readServerData("json.php");
        readServerData();
}

function readServerData(file)
{
        var rawFile = new XMLHttpRequest();
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
        if(myData["result"] == "OK")
        {
                console.log(myData);
                for(var x in myData){
                        console.log(x); 
                        
                }
                html = "<button>aaa</button>";  //make html 
                document.getElementById("app").innerHTML = html;
        }
        else allert("error");
                
}
