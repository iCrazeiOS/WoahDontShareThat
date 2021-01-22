#define PLIST_PATH @"/var/mobile/Library/Preferences/com.icraze.woahdontsharethatprefs.plist"

/* Safari Stuff */
@interface _SFWebView : NSObject
@property (nonatomic, weak, readwrite) NSURL *URL;
@end

@interface SFBarRegistration : NSObject {
	UIBarButtonItem *_shareItem;
}
@end

@interface BrowserToolbar: UIToolbar
@property SFBarRegistration *barRegistration;
@end

@interface BrowserRootViewController : UIViewController
@property (nonatomic, strong, readwrite) _SFWebView *webView;
@property BrowserToolbar *bottomToolbar;
@end

static BrowserRootViewController *browserControllerInstance;

/* Google Stuff */
@interface GMOReadToMeFooterButton : NSObject
@property (nonatomic, strong, readwrite) NSURL *currentURL;
@end

static GMOReadToMeFooterButton *googleReadToMeFooterInstance;
