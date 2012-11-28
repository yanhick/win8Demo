package externals;

import js.Dom;
/**
 * ...
 * @author 
 */

@:native("WinJS.UI.ListView") extern class ListView 
{
	public var itemTemplate:Dynamic;
	
	public var itemDataSource:List;
	
	public function new(element:HtmlDom):Void;
	
}