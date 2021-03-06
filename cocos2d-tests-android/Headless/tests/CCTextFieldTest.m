//
//  CCTextFieldTest.m
//  cocos2d-ui-tests-osx
//
//  Created by Viktor on 10/23/13.
//  Copyright (c) 2013 Cocos2d. All rights reserved.
//

#import "TestBase.h"
#if !__CC_PLATFORM_ANDROID_COMPILE_ON_IOS_LAWLZ
#import "CCTextField.h"
#endif

@interface CCTextFieldTest : TestBase @end

@implementation CCTextFieldTest

- (NSArray*) testConstructors
{
    return [NSArray arrayWithObjects:
            @"setupTextFieldBasicTest",
            nil];
}

- (void) setupTextFieldBasicTest
{
#if !__CC_PLATFORM_ANDROID_COMPILE_ON_IOS_LAWLZ
    self.subTitle = @"Tests text fields.";
    
    CCSpriteFrame* bg = [CCSpriteFrame frameWithImageNamed:@"Tests/textfield-bg.png"];
    CCTextField* textField = [[CCTextField alloc] initWithSpriteFrame:bg];
    
    textField.preferredSizeType = CCSizeTypeMake(CCSizeUnitNormalized, CCSizeUnitPoints);
    textField.preferredSize = CGSizeMake(0.5, 50);
    textField.positionType = CCPositionTypeNormalized;
    textField.position = ccp(0.5f, 0.8f);
    textField.padding = 10;
    textField.anchorPoint = ccp(0.5f, 0.5f);
    textField.string = @"Hello!";
    
    [textField setTarget:self selector:@selector(pressedEnter:)];
    
    [self.contentNode addChild:textField];
#endif
}

- (void) pressedEnter:(id)sender
{
    CCTextField* textField = sender;
    
    NSLog(@"Finished editing: %@", textField.string);
    
    self.subTitle = [NSString stringWithFormat:@"Editing: '%@'", textField.string];

}

@end
