//
//  main.m
//  Night Shift Helper
//
//  Created by Jim Macintosh Shi on 6/30/19.
//  Copyright © 2019 Creative Sub. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"


float getCurrentOptimalTemperature() {
    NSDate* currentDate = [[NSDate alloc] init];
    NSCalendar* currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents* dateComponents = [currentCalendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:currentDate];
    NSInteger hour = [dateComponents hour];
//    NSInteger minute = [dateComponents minute];
    
    switch (hour) {
        //1. Warmest.
        case 24:
            //Fall through.
        case 0 ... 5:
            return 0.8;
            
        //2
        case 23:
            //Fall through.
        case 6:
            return 0.7;
            
        //3
        case 19 ... 22:
            //Fall through.
        case 7:
            return 0.5;
            
        //4
        case 18:
            //Fall through.
        case 8:
            return 0.3;
            
        //5. Coldest.
        default:
            return 0.1;
            break;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CBBlueLightClient* blueLightClient = [[CBBlueLightClient alloc] init];
        
        if (argc == 1) {
            //Set Night Shift temperature automatically.
            float optimalTemperature = getCurrentOptimalTemperature();
            [blueLightClient setStrength:optimalTemperature commit:YES];
        } else if (argc == 2) {
            //Enable or disable Night Shift.
            if (strcmp(argv[1], "enable") == 0) {
                [blueLightClient setEnabled:YES];
            } else if (strcmp(argv[1], "disable") == 0) {
                [blueLightClient setEnabled:NO];
            } else {
                printf("The second argument must be \"enable\" or \"disable\"!\n");
            }
        } else if (argc == 3) {
            //Set current Night Shift color temperature.
            if (strcmp(argv[1], "set") != 0) {
                printf("The second argument must be \"set\"!\n");
                return 0;
            }
            
            float newNightShiftTemperature = strtof(argv[2], NULL);
            if ((newNightShiftTemperature > 1.0) || (newNightShiftTemperature < 0.0)) {
                printf("The temperature must be within 0.0 and 1.0!\n");
                return 0;
            }

            [blueLightClient setStrength:newNightShiftTemperature commit:true];
        }
    }
    return 0;
}
