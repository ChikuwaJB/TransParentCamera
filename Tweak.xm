@interface CMKBottomBar : UIView
- (void)setBackgroundStyle:(int)arg1;
@property (nonatomic, readonly) UIView *backgroundView;
@end
%hook CAMTopBar
-(long long)backgroundStyle{
	return 1;
}
%end
%hook CAMBottomBar
-(long long)backgroundStyle{
	return 1;
}
%end
%hook CMKBottomBar
-(long long)backgroundStyle{
	%log;
	return 1;
}
- (void)layoutSubviews{
	%log;
	%orig;
	self.backgroundView.alpha=0;
}
%end
%hook CMKTopBar
-(long long)backgroundStyle{
	%log;
	return 1;
}
- (void)layoutSubviews{
	%log;
	%orig;
	[self setBackgroundStyle:1];
}
%end
