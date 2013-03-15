package jsfl;

 class Global{
	
	public static inline function prompt(promptMsg:String ,?text:String):String{
		return untyped __js__("prompt")(promptMsg,text);
	}
	public static inline function confirm(promptMsg:String):Bool{
		return untyped __js__("confirm")(promptMsg);
	}

	public static inline function alert(promptMsg:String):Void{
		return untyped __js__("confirm")(promptMsg);
	}
}