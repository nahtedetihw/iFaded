#import "Tweak.h"
HBPreferences *preferences;
BOOL enabled;
BOOL noDock;
BOOL pageDots;
static int backdropBlur = 0;
static int homescreenBlur = 0;
static int switcherStyle = 1;
double noTitleIcon;
double noTitle;
static double pageScale = 0.50;

%hook SBAppSwitcherSettings

-(NSInteger)pageScale {
    return pageScale;
    }

-(void)setDeckSwitcherPageScale:(NSInteger)style {
    %orig(pageScale);
    }

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
    
%end
    
%hook SBDeckSwitcherPersonality

-(NSInteger)homescreenBlur {
    return homescreenBlur;
    }


-(void)homeScreenBlurProgress:(NSInteger)style {
    %orig(homescreenBlur);
    }
    
-(NSInteger)noTitleIcon {
    return noTitleIcon;
    }

- (double)titleAndIconOpacityForIndex:(NSInteger)style {
        return noTitleIcon;
    }
    
-(NSInteger)noTitle {
    return noTitle;
    }

- (double)titleOpacityForIndex:(NSInteger)style {
        return noTitle;
    }

%end

%hook SBDeckSwitcherModifier

-(NSInteger)noTitleIcon {
return noTitleIcon;
}

- (double)titleAndIconOpacityForIndex:(NSInteger)style {
    return noTitleIcon;
}

-(NSInteger)noTitle {
    return noTitle;
    }

- (double)titleOpacityForIndex:(NSInteger)style {
        return noTitle;
    }

%end

%hook SBFloatingDockBehaviorAssertion

-(void)gesturePossible {
    if (noDock) {
    
}
}

%end

%hook SBIconListPageControl

-(id)initWithFrame:(CGRect)frame {
    if(pageDots){
    return nil;
    }
    else {
    return %orig;
    }
}

%end

%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.nahtedetihw.ifaded"];
    [preferences registerDouble:&noTitleIcon default:0.0 forKey:@"noTitleIcon"];
    [preferences registerDouble:&noTitle default:0.0 forKey:@"noTitle"];
    [preferences registerBool:&noDock default:YES forKey:@"noDock"];
    [preferences registerBool:&pageDots default:YES forKey:@"pageDots"];
};
