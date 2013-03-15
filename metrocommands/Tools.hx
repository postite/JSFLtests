import jsfl.Flash;
class Tools 
{


	public static function setRedirection() {
        haxe.Log.trace = myTrace;
    }
    public  static function myTrace( v : Dynamic, ?inf : haxe.PosInfos ) {
       Flash.trace(v);
    }
	
}