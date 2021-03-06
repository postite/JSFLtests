package jsfl;

#if jsfl
#else error
#end

typedef JSFLPoint = {
	x:Float,
	y:Float
}
typedef JSFLRect = {
	top:Float,
	left:Float,
	bottom:Float,
	right:Float
}
@:native("fl")
extern class Flash {
	public static var actionsPanel:ActionsPanel;
	public static var activeEffect:Effect;
	public static function addEventListener(eventType:String,callbackFunction:Void->Void):Void;
	public static var as3PackagePaths:String;
	public static function browseForFileURL(browseType:String,?title:String,?previewArea:Void):String;
	public static function browseForFolderURL(?description:String):String;
	public static function clipCopyString(string:String):Void;
	public static function closeAll(?bPromptToSave:Bool):Void;
	public static function closeAllPlayerDocuments():Bool;
	public static function closeDocument(documentObject:Document,?bPromptToSaveChanges:Bool):Void;
	public static function closeProject():Bool;
	public static var compilerErrors:CompilerErrors;
	public static var componentsPanel:ComponentsPanel;
	public static var configDirectory:String;
	public static var configURI:String;
	public static var contactSensitiveSelection:Bool;
	public static function createDocument(?docType:String):Document;
	public static var createNewDocList:Array<String>;
	public static var createNewDocListType:Array<String>;
	public static var createNewTemplateList:Array<String>;
	public static function createProject(fileURI:String,?name:String):Project;
	public static var documents:Array<Document>;
	public static function downloadLatestVersion(fileURI:String):Bool;
	public static var drawingLayer:DrawingLayer;
	public static var effects:Array<Effect>;
	public static function enableImmediateUpdates(bEnableUpdates:Bool):Void;
	public static function fileExists(fileURI:String):Bool;
	public static function findDocumentDOM(id:Int):Document;
	public static function findDocumentIndex(name:String):Array<Int>;
	public static function findObjectInDocByName(instanceName:String,document:Document):Array<{keyframe:Dynamic,layer:Layer,timeline:Timeline,parent:Dynamic,obj:Dynamic}>;
	public static function findObjectInDocByType(elementType:String,document:Document):Array<{keyframe:Dynamic,layer:Layer,timeline:Timeline,parent:Dynamic,obj:Dynamic}>;
	public static function getAppMemoryInfo(memType:Int):Int;
	public static function getDocumentDOM():Document;
	public static function getProject():Project;
	public static function mapPlayerURL(URI:String,?returnMBCS:Bool):String;
	public static var Math:Math;
	public static var mruRecentFileList:Array<String>;
	public static var mruRecentFileListType:Array<String>;
	public static var objectDrawingMode:Bool;
	public static function openDocument(fileURI:String):Document;
	public static function openProject(fileURI:String):Project; //returns Void in MX 2004
	public static function openScript(fileURI:String):Void;
	public static var outputPanel:OutputPanel;
	public static var packagePaths:String;
	public static function quit(?bPromptIfNeeded:Bool):Void;
	public static function reloadEffects():Void;
	public static function reloadTools():Void;
	public static function removeEventListener(eventType:String):Bool;
	public static function resetAS3PackagePaths():Void;
	public static function resetPackagePaths():Void;
	public static function revertDocument(documentObject:Document):Bool;
	public static function revertDocumentToLastVersion(documentObject:Document):Bool;
	public static function runScript(fileURI:String,?funcName:String,?arg1:Dynamic,?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic, ?p6 : Dynamic, ?p7 : Dynamic, ?p8 : Dynamic, ?p9 : Dynamic ):Void;
	public static function saveAll():Void;
	public static function saveAVersionOfDocument(document:Document):Bool;
	public static function saveDocument(document:Document,?fileURI:String):Bool;
	public static function saveDocumentAs(document:Document):Bool;
	public static var scriptURI:String;
	public static function selectElement(elementObject:Element,editMode:Bool):Bool;
	public static function selectTool(toolName:String):Void;
	public static function setActiveWindow(document:Document,?bActivateFrame:Bool):Void;
	public static function showIdleMessage(show:Bool):Void;
	public static function synchronizeDocumentWithHeadVersion(documentObject:Document):Bool;
	public static var tools:Array<Tools>;
	public static function trace(message:Dynamic):Void;
	public static var version:String;
	public static var xmlui:XMLUI;
	// public static function __init__():Void{
	// 	//generate package object
	// 	untyped{
	// 		__js__('
	// 		function(jsfl){
	// 			alert(jsfl);
	// 			for(cls in jsfl){
	// 				jsfl[cls]=jsfl[cls];
	// 				jsfl[cls].__name__=["jsfl",cls];
	// 				jsfl[cls].prototype.__class__=jsfl[cls];
	// 			}
	// 			jsfl.Flash=flash;
	// 		}({
	// 			ActionsPanel:ActionsPanel,
	// 			CompilerErrors:CompilerErrors,
	// 			Contour:Contour,
	// 			Document:Document,
	// 			Edge:Edge,
	// 			HalfEdge:HalfEdge,
	// 			Library:Library,
	// 			OutputPanel:OutputPanel,
	// 			Path:Path,
	// 			// Project:Project,
	// 			// ProjectItem:ProjectItem,
	// 			TextRun:TextRun,
	// 			Tools:Tools,
	// 			Vertex:Vertex,
	// 			XMLUI:XMLUI
	// 		})
	// 		');
	// 	}
	//}
}
