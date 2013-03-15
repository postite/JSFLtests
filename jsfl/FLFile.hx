package jsfl;
@:native("FLfile")
extern class FLfile{
	public function copy(fileURI:String,copyURI:String):Bool;
	public function createFolder(folderURI:String):Bool;
	public function exists(fileURI:String):Bool;
	public function getAttributes(fileOrFolderURI:String):String;
	public function getCreationDate(fileOrFolderURI:String):String;
	public function getCreationDateObj(fileOrFolderURI:String):Date;
	public function getModificationDate(fileOrFolderURI:String):String;
	public function getModificationDateObj(fileOrFolderURI:String):Date;
	public function getSize(fileURI:String):Int;
	public function listFolder(folderURI:String,?filesOrDirectories:String):Array<String>;
	public function read(fileOrFolderURI:String):String;
	public function remove(fileOrFolderURI:String):Bool;
	public function setAttributes(fileURI:String,strAttrs:String):Bool;
	public static function platformPathToURI(v:String):String;
	public static function write(fileURI:String,textToWrite:String,?strAppendMode:String):Bool;
}