//
//  CardMemoryGame.h
//  CardMemoryGame
//
//  Created by Owen on 4/2/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardSet.h"

@interface CardMemoryGame : NSObject

-(instancetype)initWithCardSet:(CardSet *)cardSet;

-(Card *)cardAtIndex:(NSInteger)index;

-(void)gameStart:(NSInteger)pos;



@property(nonatomic,readonly)NSInteger score;

@end
