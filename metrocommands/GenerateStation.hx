import jsfl.Flash;
import jsfl.FLFile.FLfile;
import haxe.Utf8;
import jsfl.Global;
//using String;


class GenerateStation 
{
	var data:List<MetroData.Station>;
	function new()
	{
		var parser= new MetroData();
		data=parser.pop;
		if( Global.confirm("generate?"))
		generateStation();
		Global.alert("faut select");
	}

	function generateStation() 
	{

	var itemIndex = Flash.getDocumentDOM().library.findItemIndex("Symbole 1");
	var theItem:jsfl.Item = Flash.getDocumentDOM().library.items[itemIndex];
	//theItem.name="popipokil";
	trace("index="+itemIndex);
	var count:Int=0;
	for (i in data) {
	
	Flash.getDocumentDOM().addItem({x:count*30,y:0},theItem);
	Flash.getDocumentDOM().selection[0].name=splashChars(i.nom);
	
	//trace("accents"+t);
	Flash.getDocumentDOM().selection[0].setPersistentData("stationName","string",i.nom);
	count++;
	}
	}
function splashChars(str:String):String{



 var r =~/[\x20-\x2F+\x3a-\x40+\x80-\xFF]/g;
    
   
    var op=r.replace(str,"_");
     
    return op;
    }
	function removeAccents(strAccents:String):String{
    var tab = strAccents.split('');
  	 var  strAccentsOut = new Array();
  	var   strAccentsLen = strAccents.length;
    var accents:String = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var accentsOut = 'AAAAAAaaaaaaOOOOOO0ooooooEEEEeeeeoCcDIIIIiiiiUUUUuuuuNnSsYyyZz'.split('');
    trace( "ze"+accents);
    for ( y in 0...strAccentsLen) {
        if (accents.indexOf(tab[y]) != -1) {
        	trace("plaf"+accents.indexOf("é")+strAccents);
        	
            strAccentsOut[y] = accentsOut[accents.indexOf(tab[y])];
        }
        else
            strAccentsOut[y] = tab[y];
    }
    var strAccentstr = strAccentsOut.join('');
    return strAccentstr;
}
	static public function main()
	{
		Tools.setRedirection();
		var app = new GenerateStation();
	}
}