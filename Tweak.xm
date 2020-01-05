#import "Tweak.h"
HBPreferences *preferences;
BOOL enabled;
static int backdropBlur = 0;
static int homescreenBlur = 0;
static int switcherStyle = 1;
double pageScale;

%hook SBAppSwitcherSettings
-(NSInteger)switcherStyle {
    return switcherStyle;
}
-(void)setSwitcherStyle:(NSInteger)style {
    %orig(switcherStyle);
}
    
-(NSInteger)backdropBlur {
    return backdropBlur;
    }


-(void)backdropBlurProgress:(NSInteger)style {
    %orig(backdropBlur);
    }
    
-(NSInteger)pageScale {
    return pageScale;
    }

-(void)setDeckSwitcherPageScale:(NSInteger)style {
    %orig(pageScale);
    }
    
%end
    
%hook SBDeckSwitcherPersonality

-(NSInteger)homescreenBlur {
    return homescreenBlur;
    }


-(void)homeScreenBlurProgress:(NSInteger)style {
    %orig(homescreenBlur);
    }

%end


%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.ifaded"];
    [preferences registerDouble:&pageScale default:0 forKey:@"pageScale"];
};
