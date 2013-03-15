package jsfl;
typedef BitmapItem = {>Item,
	public var allowSmoothing:Bool;
	public var compressionType:String;
	public var quality:Int;
	public var useImportedJPEGQuality:Bool;
	public function bitmapItem.exportToFile(fileURI:String, quality:Int); //quality=1>100
}