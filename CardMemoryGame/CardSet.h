//
//  CardSet.h
//  CardGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardSet : NSObject



-(void)addCard:(Card *)card;
-(Card *)getRandomCard;

@property(strong,nonatomic)NSMutableArray *cards;

@end
