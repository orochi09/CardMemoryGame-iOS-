//
//  Card.h
//  CardGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject


@property (nonatomic) NSInteger num;

@property (nonatomic,getter = isUp) BOOL up;

@property (nonatomic,getter = isMatched) BOOL matched;


-(void)setUp:(BOOL)isUp;
-(int)match:(NSArray*)others;
-(void)setMatched:(BOOL)matched;


@end
