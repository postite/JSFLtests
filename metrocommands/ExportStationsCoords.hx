
import jsfl.Flash;
import jsfl.FLFile.FLfile;
import haxe.Utf8;
using jsfl.Global;
import jsfl.SymbolInstance;

typedef StationDtx={
	nom:String
	,pos:{x:Float,y:Float}
}
typedef StationInstance={
	>SymbolInstance,
	stationName:String
}
class ExportStationsCoords 
{

	var path:String;
	var orderedSelection:Array<StationInstance>;
	var A:Array<StationDtx>;

	function new()
	{
		rec();
	}
public function rec() 
	{
		path= FLfile.platformPathToURI("/");

		A= new Array();
		//var Ligne_A=['Arènes','Argoulets','Bagatelle','Basso Cambo','Bellefontaine','Capitole','Esquirol','Fontaine Lestang','Jolimont','Marengo SNCF','Mermoz','Mirail Université','Patte d+oie','Reynerie','Roseraie','St Cyprien / République'];
    	//var Ligne_B=['Barrière de Paris','Borderouge','Canal du Midi','Carmes','Compans Caffarelli','Empalot','Faculté de Pharmacie','Francois Verdier','Jeanne d+Arc','La Vache','Minimes - Claude Nougaro','Palais de Justice','Ramonville','Rangueil','Saouzelong','St Agne SNCF','St Michel - Palais de Justice','Trois Cocus','Université Paul Sabatier'];
		var selection:Array<StationInstance>=cast Flash.getDocumentDOM().selection;
		 orderedSelection=selection;
		orderedSelection.sort(function(a,b) return Reflect.compare(a.x, b.x) );
		//trace(orderedSelection);
		var it=orderedSelection.iterator();
		var cur:StationInstance=null;
		for (a in orderedSelection){
			if (it.hasNext())
			cur= it.next();
			trace("data?"+cur.hasPersistentData("stationName"));
			trace("stationName="+cur.getPersistentData("stationName"));
			A.push(cast {nom:cur.getPersistentData("stationName"),pos:{x:cur.x,y:cur.y}});
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
	
	
	static public function main()
	{
		Tools.setRedirection();
		var app = new ExportStationsCoords();
	}
}