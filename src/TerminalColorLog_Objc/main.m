//
//  main.m
//  TerminalColorLog_Objc
//
//  Created by Velmurugan on 16/04/16.
//  Copyright © 2016 Velmurugan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMLogUtility.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        alog(@"Hello,<b> World! </b> in color <fg:red>red color </fg> <bg:cyan> cyan color background </bg>");
        wlog(@"Warning log");
        elog(@"Error log");
        ilog(@"information log");
        slog(@"Success log");

    }
    return 0;
}
