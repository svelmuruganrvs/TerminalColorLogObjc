//
//  VMLogUtility.m
//  TerminalColorLog_Objc
//
//  Created by Velmurugan on 16/04/16.
//  Copyright © 2016 Velmurugan. All rights reserved.
//

#import "VMLogUtility.h"


typedef NS_ENUM(int,propertyKey) {
    kBold = 1 ,
    kDim ,
    kUnderline = 4,
    kBlink ,
    kReverse = 7,
    kHidden,
    kResetAll = 0,
    kResetBold = 21,
    kResetDim,
    kResetUnderline = 24,
    kResetBlink,
    kResetReverse = 27,
    kRestHidden,
    /* Forground color */
    kFDefaultColor = 39,
    kFBlackColor = 30,
    kFRedColor,
    kFGreenColor,
    kFYellowColor,
    kFBlue,
    kFMagenta,
    kFCyan,
    kFLightGray,
    kFDarkGray = 90,
    kFLightRed,
    kFLightGreen,
    kFLightYellow,
    kFLightblue,
    kFLightMagenta,
    kFLightCyan,
    kFWhite,
    /* Background color */
    kBDefaultColor = 49,
    kBBlackColor = 40,
    kBRedColor,
    kBGreenColor,
    kBYellowColor,
    kBBlue,
    kBMagenta,
    kBCyan,
    kBLightGray,
    kBDarkGray = 100,
    kBLightRed,
    kBLightGreen,
    kBLightYellow,
    kBLightblue,
    kBLightMagenta,
    kBLightCyan,
    kBWhite,
    
};

#pragma mark - private methods definition
NSString* parseMessageForLog(NSString *string);
NSString* keyForProperty(NSNumber *key);

#pragma mark - Public methods.
void alog(NSString *attributedMessage) {
    
    printf("%s%s\n",[keyForProperty([NSNumber numberWithInt:kResetAll]) UTF8String],[parseMessageForLog(attributedMessage) UTF8String]);
    
}

void wlog(NSString *warningMessage) {
    
    printf("****%s%s%s%s****\n",[keyForProperty([NSNumber numberWithInt:kResetAll]) UTF8String],[keyForProperty([NSNumber numberWithInt:kFYellowColor]) UTF8String],[parseMessageForLog(warningMessage) UTF8String],[keyForProperty([NSNumber numberWithInt:kFDefaultColor]) UTF8String]);
    
}

void elog(NSString *errorMessage) {
    
    printf("####%s%s%s%s####\n",[keyForProperty([NSNumber numberWithInt:kResetAll]) UTF8String],[keyForProperty([NSNumber numberWithInt:kFRedColor]) UTF8String],[parseMessageForLog(errorMessage) UTF8String],[keyForProperty([NSNumber numberWithInt:kFDefaultColor]) UTF8String]);
    
}

void ilog(NSString *informationMessage) {
    
    printf("####%s%s%s%s####\n",[keyForProperty([NSNumber numberWithInt:kResetAll]) UTF8String],[keyForProperty([NSNumber numberWithInt:kFBlue]) UTF8String],[parseMessageForLog(informationMessage) UTF8String],[keyForProperty([NSNumber numberWithInt:kFDefaultColor]) UTF8String]);
    
}

void slog(NSString *successMessage) {
    
    printf("####%s%s%s%s####\n",[keyForProperty([NSNumber numberWithInt:kResetAll]) UTF8String],[keyForProperty([NSNumber numberWithInt:kFGreenColor]) UTF8String],[parseMessageForLog(successMessage) UTF8String],[keyForProperty([NSNumber numberWithInt:kFDefaultColor]) UTF8String]);
    
}

#pragma mark - private methods.
NSString* keyForProperty(NSNumber *key) {
    
    NSString *string = [NSString stringWithFormat:@"\e[%dm",[key intValue]];
    return string;
}

NSString* parseMessageForLog(NSString *string) {
    
    NSRange r;
    NSString *s = [string copy];
    NSString *replaceString = @"";
    NSNumber *replacableString = [NSNumber numberWithInt:0];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound){
        replaceString = [s substringWithRange:r];
        replaceString = [[replaceString stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
        if ([@[@"<b>",@"<d>",@"<u>",@"<bl>",@"</b>",@"</d>",@"</u>",@"</bl>",@"</fg>",@"</bg>"] containsObject:replaceString]) {
            replacableString = [@{@"<b>" : [NSNumber numberWithInt:kBold] ,
                                  @"<d>": [NSNumber numberWithInt:kDim],
                                  @"<u>": [NSNumber numberWithInt:kUnderline],
                                  @"<bl>": [NSNumber numberWithInt:kBlink],
                                  @"</b>": [NSNumber numberWithInt:kResetAll],
                                  @"</d>": [NSNumber numberWithInt:kResetAll],
                                  @"</u>": [NSNumber numberWithInt:kResetAll],
                                  @"</bl>": [NSNumber numberWithInt:kResetAll],
                                  @"</fg>": [NSNumber numberWithInt:kFDefaultColor],
                                  @"</bg>": [NSNumber numberWithInt:kBDefaultColor]} objectForKey:replaceString];
        }
        else if ([replaceString hasPrefix:@"<fg:"]){
            replaceString = [replaceString stringByReplacingOccurrencesOfString:@"<fg:" withString:@""];
            replacableString = [@{@"default>" : [NSNumber numberWithInt:kFDefaultColor],
                                  @"black>" : [NSNumber numberWithInt:kFBlackColor],
                                  @"red>" : [NSNumber numberWithInt:kFRedColor],
                                  @"green>" : [NSNumber numberWithInt:kFGreenColor],
                                  @"yellow>" : [NSNumber numberWithInt:kFYellowColor],
                                  @"blue>" : [NSNumber numberWithInt:kFBlue],
                                  @"magenta>" : [NSNumber numberWithInt:kFMagenta],
                                  @"cyan>" : [NSNumber numberWithInt:kFCyan],
                                  @"lightgray>" : [NSNumber numberWithInt:kFLightGray],
                                  @"darkgray>" : [NSNumber numberWithInt:kFDarkGray],
                                  @"lightred>" : [NSNumber numberWithInt:kFLightRed],
                                  @"lightgreen>" : [NSNumber numberWithInt:kFLightGreen],
                                  @"lightyellow>" : [NSNumber numberWithInt:kFLightYellow],
                                  @"lightblue>" : [NSNumber numberWithInt:kFLightblue],
                                  @"lightmagenta>" : [NSNumber numberWithInt:kFLightMagenta],
                                  @"white>" : [NSNumber numberWithInt:kFWhite],
                                  } objectForKey:replaceString];
        }
        else if ([replaceString hasPrefix:@"<bg:"]){
            replaceString = [replaceString stringByReplacingOccurrencesOfString:@"<bg:" withString:@""];
            replacableString = [@{@"default>" : [NSNumber numberWithInt:kBDefaultColor],
                                  @"black>" : [NSNumber numberWithInt:kBBlackColor],
                                  @"red>" : [NSNumber numberWithInt:kBRedColor],
                                  @"green>" : [NSNumber numberWithInt:kBGreenColor],
                                  @"yellow>" : [NSNumber numberWithInt:kBYellowColor],
                                  @"blue>" : [NSNumber numberWithInt:kBBlue],
                                  @"magenta>" : [NSNumber numberWithInt:kBMagenta],
                                  @"cyan>" : [NSNumber numberWithInt:kBCyan],
                                  @"lightgray>" : [NSNumber numberWithInt:kBLightGray],
                                  @"darkgray>" : [NSNumber numberWithInt:kBDarkGray],
                                  @"lightred>" : [NSNumber numberWithInt:kBLightRed],
                                  @"lightgreen>" : [NSNumber numberWithInt:kBLightGreen],
                                  @"lightyellow>" : [NSNumber numberWithInt:kBLightYellow],
                                  @"lightblue>" : [NSNumber numberWithInt:kBLightblue],
                                  @"lightmagenta>" : [NSNumber numberWithInt:kBLightMagenta],
                                  @"white>" : [NSNumber numberWithInt:kBWhite],
                                  } objectForKey:replaceString];
            
        }
        s = [s stringByReplacingCharactersInRange:r withString:keyForProperty(replacableString)];
        replacableString = [NSNumber numberWithInt:0];;
    }
    return s;
    
}

