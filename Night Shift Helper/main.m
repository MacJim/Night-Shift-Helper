//
//  main.m
//  Night Shift Helper
//
//  Created by Jim Macintosh Shi on 6/30/19.
//  Copyright © 2019 Creative Sub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CBBlueLightClient* blueLightClient = [[CBBlueLightClient alloc] init];
        
        if (argc == 1) {
            //TODO: Set night shift temperature automatically.
        } else if (argc == 2) {
            //TODO: Enable or disable night shift.
        } else if (argc == 3) {
            //Set current night shift color temperature.
            if (![[NSString stringWithUTF8String:argv[1]] isEqualToString:@"set"]) {
                NSLog(@"The second argument must be \"set\"!");
                return 0;
            }
            
            float newNightShiftTemperature = [[NSString stringWithUTF8String:argv[2]] floatValue];
            if ((newNightShiftTemperature > 1.0) || (newNightShiftTemperature < 0.0)) {
                NSLog(@"The temperature must be within 0.0 and 1.0!");
                return 0;
            }
            
            [blueLightClient setStrength:newNightShiftTemperature commit:true];
        }
    }
    return 0;
}
