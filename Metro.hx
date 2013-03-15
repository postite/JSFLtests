import jsfl.Flash;
import jsfl.FLFile.FLfile;
import haxe.Utf8;
using jsfl.Global;

typedef StationDtx={
	nom:String
	,pos:{x:Float,y:Float}
}
class Metro 
{
	var path:String;
	var orderedSelection:Array<jsfl.SymbolInstance>;
	var A:Array<StationDtx>;
	function new()
	{

		var data:MetroData= new MetroData();
		trace("data="+haxe.Unserializer.run(data.pop));
		if( Global.confirm("generate?"))
		generateStation();

		Global.alert("faut select");
		//var evtID = Flash.addEventListener("documentChanged", docChangedHandler);
		
	}


	public function rec() 
	{
		path= FLfile.platformPathToURI("/");

		A= new Array();
		var Ligne_A=['Arènes','Argoulets','Bagatelle','Basso Cambo','Bellefontaine','Capitole','Esquirol','Fontaine Lestang','Jolimont','Marengo SNCF','Mermoz','Mirail Université','Patte d+oie','Reynerie','Roseraie','St Cyprien / République'];
    	var Ligne_B=['Barrière de Paris','Borderouge','Canal du Midi','Carmes','Compans Caffarelli','Empalot','Faculté de Pharmacie','Francois Verdier','Jeanne d+Arc','La Vache','Minimes - Claude Nougaro','Palais de Justice','Ramonville','Rangueil','Saouzelong','St Agne SNCF','St Michel - Palais de Justice','Trois Cocus','Université Paul Sabatier'];
		var selection:Array<jsfl.SymbolInstance>=cast Flash.getDocumentDOM().selection;
		 orderedSelection=selection;
		orderedSelection.sort(function(a,b) return Reflect.compare(a.x, b.x) );
		//trace(orderedSelection);
		var it=orderedSelection.iterator();

		for (a in Ligne_A){
			
			var cur= it.next();
			A.push(cast {nom:a,pos:{x:cur.x,y:cur.y}});
		}
		trace("good"+A[0].nom +A[0].pos);
		var j:String=haxe.Json.stringify(A);

		trace("j="+j);
		saveFile(j);
	}
	public function saveFile(content:String) 
	{
		trace(FLfile.write(path+"pop.json",content));
	}
	public static function setRedirection() {
        haxe.Log.trace = myTrace;
    }
    private static function myTrace( v : Dynamic, ?inf : haxe.PosInfos ) {
       Flash.trace(v);
    }
	static public function main()
	{
		setRedirection();

		var app = new Metro();
	}
}