package  
{
	import com.ismole.extension.appupdater.AppVersionChecker;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author xiangshun
	 */
	public class GameVersionChecker extends AppVersionChecker
	{
		
		public static var versionPrifixURL:String = "http://www.ucvcbbs.com/xs/androidUpdate/"
		
		public function GameVersionChecker() 
		{
			 super();
		}
		
		//当updater类运行checkUpdate()方法之后，会委托这个类执行，在这里编写具体的业务逻辑，查询游戏的最新版本号
		public override function checkUpdate():void
		{
				var urlLoader:URLLoader = new URLLoader();
				urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
				var request:URLRequest = new URLRequest(versionPrifixURL + "version.xml");
				urlLoader.addEventListener(Event.COMPLETE,onCompleteHandler);
				urlLoader.load(request);
		}
		
		private function onCompleteHandler(event:Event):void
		{
				var data:String = event.target.data.toString();
				var xml:XML = new XML(data);
				
				//服务器版本号
				var serverVersion:String = xml.version;
				//apk安装路径
				var apkPath:String = xml.apkPath;
				
				//应用id
				var appXML:XML = NativeApplication.nativeApplication.applicationDescriptor;
				var ns:Namespace = appXML.namespace();
				var appId:String = appXML.ns::id;
		
				if (needUpdate(serverVersion))//基类方法，根据serverVersion和ClientVersion判断是否需要更新
				{
					startUpdate(appId,versionPrifixURL + apkPath);
				}
				else
				{
					continueGame();
				}
		}
		
	}

}