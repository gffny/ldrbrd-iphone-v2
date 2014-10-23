//
//  LBScorecardUtils.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 5/12/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBScorecardUtils.h"

@implementation LBScorecardUtils

+(int) countScore: (NSArray *) scoreArray {
    int countVal = 0;
    for(int i=0; i<scoreArray.count; i++) {
        countVal += [[scoreArray objectAtIndex:i] integerValue];
    }
    return countVal;
}


+(int) countBelowPar: (NSArray*) scoreArray onCourse: (LBCourse *) course {
//    if(scoreArray.count <= course.courseHoleMap.count) {
//        int count = 0;
//        for(int i=0; i<scoreArray.count; i++) {
//            if([[scoreArray objectAtIndex:i] integerValue] - [course courseHoleWithNumber:i].par < 0) {
//                count+=1;
//            }
//        }
//        return count;
//    }
    return -1;
}

+(int) countBogeyPlus: (NSArray*) scoreArray onCourse: (LBCourse *) course {
//    if(scoreArray.count <= course.courseHoleMap.count) {
//        int count = 0;
//        for(int i=0; i<scoreArray.count; i++) {
//            if([[scoreArray objectAtIndex:i] integerValue] - [course courseHoleWithNumber:i].par > 1) {
//                count+=1;
//            }
//        }
//        return count;
//    }
    return -1;
}

+(int) countBogey: (NSArray*) scoreArray onCourse: (LBCourse *) course {
//    if(scoreArray.count <= course.courseHoleMap.count) {
//        int count = 0;
//        for(int i=0; i<scoreArray.count; i++) {
//            if([[scoreArray objectAtIndex:i] integerValue] - [course courseHoleWithNumber:i].par == 1) {
//                count+=1;
//            }
//        }
//        return count;
//    }
    return -1;
}

+(int) countPar: (NSArray*) scoreArray onCourse: (LBCourse *) course {
//    if(scoreArray.count <= course.courseHoleMap.count) {
//        int count = 0;
//        for(int i=0; i<scoreArray.count; i++) {
//            if([[scoreArray objectAtIndex:i] integerValue] - [course courseHoleWithNumber:i].par == 0) {
//                count+=1;
//            }
//        }
//        return count;
//    }
    return -1;
}

@end
