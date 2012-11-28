package component;

import brix.component.ui.DisplayObject;
import externals.List;
import externals.ListView;
import externals.Template;
import js.Lib;
import js.Dom;
/**
 * ...
 * @author 
 */

class W8List extends DisplayObject
{

	public function new(rootElement:HtmlDom, brixId:String)
	{
		super(rootElement, brixId);
		
		var dataArray = [
		{ title: "Windows 3.1", link:"win31"},
		{ title: "Windows 95",  link:"win95"},
		{ title: "Windows 98", link:"win98" }
		];

		var dataList = new List(dataArray);
		
		var listView = new ListView(rootElement);
		
		untyped listView.oniteminvoked = onListViewItemInvoked;
		
		var itemTemplate = Lib.document.getElementById("listTemplate");
		
		listView.itemDataSource = dataList.dataSource;
		listView.itemTemplate = itemTemplateFunction;
	}
	
	private function onListViewItemInvoked(e:Event):Void
	{
		Lib.alert(untyped e.detail.itemIndex);
	}
	
	private function itemTemplateFunction(itemPromise:Dynamic):Dynamic {

       return itemPromise.then(function (item) {
           var div = Lib.document.createElement("div");

           //var img = document.createElement("img");
           //img.src = item.data.picture;
           //img.alt = item.data.title;
           //div.appendChild(img);

           var childDiv = Lib.document.createElement("div");

           var title = Lib.document.createElement("h4");
           title.innerHTML = item.data.title;
           childDiv.appendChild(title);

           var desc = Lib.document.createElement("h6");
           desc.innerHTML = item.data.text;
           childDiv.appendChild(desc);

           div.appendChild(childDiv);
           
           return div;
       });
    }
	
}