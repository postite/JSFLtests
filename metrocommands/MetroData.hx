
#if macro
import thx.csv.Csv;
import haxe.Serializer;
import haxe.macro.Context;
#end



typedef Station={
	nom:String,
	?x:Float,
	?y:Float
}
class MetroData 
{
	 var _pop:String;
	public var pop(getPop,never):List<Station>;
	public  function new()
	{
		_pop=getResource("pop.txt");

		//var cs= Csv.decodeObjects(_pop);
		//parse(csv);
	}
#if macro
	static function parse(cs:Array<Dynamic>):List<MetroData.Station>{
		//trace("parse");
		var listeStations:List<MetroData.Station>=null;
		var lignes:Hash<List<MetroData.Station>>= new Hash();
		for (donnee in cs){
			//trace("incsv");
			
			if (!lignes.exists(donnee.Ligne)){
			//	trace("!");
				listeStations=new List();
				lignes.set(donnee.Ligne,listeStations);
			}else{
				listeStations=lignes.get(donnee.Ligne);
			//	trace("lsite");
			}
			//trace("after else");
				var station:Station=cast {};
			//	trace("dsd");
				station.nom=donnee.Station;
				
				listeStations.add(station);
				//trace ("ListeStation "+donnee.Ligne +"/ "+listeStations.length);
		}
		return listeStations;
		//trace("ligne="+lignes.keys);
		//Model.instance.lignes=lignes;

	}
#end
	 function getPop():List<Station> 
	{
		return haxe.Unserializer.run(_pop);
	}

	@:macro public static function getResource(s:String) {
	var content = neko.io.File.getContent(s);
	var plop=Csv.decodeObjects(content);
	//var serialized = content;//Serializer.run(content);
	var parsed=parse(plop);

	var xParsed=haxe.Serializer.run(parsed);
	return Context.makeExpr(xParsed,Context.currentPos());
}
}