// Import headers
#import "Tweak.h"

// Custom method to see if a string contains any element from an array
static BOOL doesStringContainArrayEntry(NSString *string, NSArray *array) {
	BOOL returnValue = NO;
	for (NSString *entry in array) {
		if ([string containsString:entry]) {
			returnValue = YES;
			break;
		}
	}
	return returnValue;
}

/* Safari */
%hook BrowserRootViewController
-(id)initWithBrowserController:(id)arg1 {
	// Save an instance of this class
	// Used to get the current URL, and to get the instance of the share button
	browserControllerInstance = %orig;
	return browserControllerInstance;
}
%end

%hook SFBarRegistration
// When a bottom button is tapped
-(void)_itemReceivedTap:(UIBarButtonItem *)arg1 {
	// Compare the argument to the share button
	if (arg1 == [browserControllerInstance.bottomToolbar.barRegistration valueForKey:@"_shareItem"]) {
		// Get values from prefs
		NSString *prefsString = [[NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH] objectForKey:@"textCellValue"];
		// Format and turn into an array
		NSArray *array = [[prefsString stringByReplacingOccurrencesOfString:@">" withString:@""] componentsSeparatedByString:@"<"];
		// Remove first element from the array, as it is an empty string
		array = [array subarrayWithRange:NSMakeRange(1, array.count - 1)];

		// If the current URL doesn't contain any element from the array, run the original code
		if (!doesStringContainArrayEntry(browserControllerInstance.webView.URL.absoluteString, array)) %orig;
	}
	// If they don't match, run the original code
	else %orig;
}
%end



/* Google */
%hook GMOReadToMeFooterButton
-(id)init {
	// Save an instance of this class
	// Used to get the current URL
	googleReadToMeFooterInstance = %orig;
	return googleReadToMeFooterInstance;
}
%end

// Hook the share button
%hook GMOShareButton
// Modify the method called to display the share popup
-(void)displayShareMenu:(id)arg1 {
	// Get values from prefs
	NSString *prefsString = [[NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH] objectForKey:@"textCellValue"];
	// Format and turn into an array
	NSArray *array = [[prefsString stringByReplacingOccurrencesOfString:@">" withString:@""] componentsSeparatedByString:@"<"];
	// Remove first element from the array, as it is an empty string
	array = [array subarrayWithRange:NSMakeRange(1, array.count - 1)];

	// If the current URL doesn't contain any element from the array, run the original code
	if (!doesStringContainArrayEntry(googleReadToMeFooterInstance.currentURL.absoluteString, array)) %orig;
}
%end
