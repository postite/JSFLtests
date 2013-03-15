package jsfl;
typedef SymbolItem = {> Item,
	public function convertToCompiledClip():Void;
	public function exportSWC(outputURI:String):Void;
	public function exportSWF(outputURI:String):Void;
	#if cs6
	public function exportToPNGSequence(outputURI:String ,?startFrameNum:Int,?endFrameNum:Int, ?matrix:jsfl.Matrix)
	#end
	public var scalingGrid:Bool;
	public var scalingGridRect:Rectangle;
	public var sourceAutoUpdate:Bool;
	public var sourceFilePath:String;
	public var sourceLibraryName:String;
	public var symbolType:String;
	public var timeline:Timeline;
}