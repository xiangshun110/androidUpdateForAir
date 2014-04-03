package 
{
	import chen.dong.natives.NaviveUtil;
	import com.ismole.extension.appupdater.AppUpdater;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author xiangshun
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			
			// new to AIR? please read *carefully* the readme.txt files!
			
			/*var updater:AppUpdater = new AppUpdater();
			updater.onContinue = onContinue;
			updater.checkUpdate(new GameVersionChecker());*/
			
			/**
			 * 服务器必须要添加MIME类型,.apk	 application/vnd.android
			 * 
			 */
			var navives:NaviveUtil = new NaviveUtil();
			trace(navives.UpgradeApk("http://www.ucvcbbs.com/xs/androidUpdate/","test.apk"));
		}
		
		private function onContinue():void {
			trace("heheh------------");
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}