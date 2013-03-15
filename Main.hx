import jsfl.Flash;
import jsfl.FLFile.FLfile;
import jsfl.Item;
import jsfl.Library;
//using Reflect;
import haxe.Log;
class Main 
{
	public var path:String;
	function new()
	{
		
		setRedirection();
var j=new Hash<{x:Float,y:Float}>();
		

		//Flash.getDocumentDOM().addNewOval({left:(i*50), top:(i*50), right:(i*50)+50, bottom:(i*50)+50});
 path= FLfile.platformPathToURI("/");
		var curr_doc = Flash.getDocumentDOM();
 
for(i in 0... curr_doc.selection.length ) {
	//trace(curr_doc.selection[i].x );
		//j.setField(curr_doc.selection[i].name,{x:curr_doc.selection[i].x,y:curr_doc.selection[i].y});
		j.set(curr_doc.selection[i].name,{x:curr_doc.selection[i].x,y:curr_doc.selection[i].y});
		
		}
		var res=haxe.Json.stringify(j);
		//var _file:FLfile=cast{};
	trace(FLfile.write(path+"pop.json",res));
	//exportItem();
	}
	
	public static function setRedirection() {
        haxe.Log.trace = myTrace;
    }
public function new2() 
{
	Flash.trace("op");
}
    private static function myTrace( v : Dynamic, ?inf : haxe.PosInfos ) {
       Flash.trace(v);
    }
	static public function main()
	{
		var app = new Main();
	}

	function exportItem(?name:String) 
	{
		var lib:Array<Item>=null;
		var imageFileURL:String;
		if(Flash.getDocumentDOM().library.getSelectedItems().length>0){
			lib=Flash.getDocumentDOM().library.getSelectedItems();
		}else{
			lib=Flash.getDocumentDOM().library.items;
		}
		for (i in 0... lib.length) {
			var libItem:Item=lib[i];
			if(libItem.itemType=="bitmap"){
				imageFileURL = path + "/" + libItem.name;
				var success = cast(libItem).exportToFile(imageFileURL);
				trace("export::"+imageFileURL + ": " + success);
			}else if(libItem.itemType=="movie clip"){
				var mcItem:jsfl.SymbolItem=cast libItem;
				//var success = mcItem.ex(imageFileURL);
				mcItem.timeline.selectAllFrames();
				mcItem.timeline.copyFrames(1,1);
				
				var T=Flash.getDocumentDOM().getTimeline().pasteFrames(1,1);
				var S=Flash.getDocumentDOM().exportPNG(null,false,false);
				
				}
				trace("not a bitmap");
			
		}
	}
	
}