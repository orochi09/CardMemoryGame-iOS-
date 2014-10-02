//
//  GameBoardCardSet.m
//  CardGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import "GameBoardCardSet.h"
#import "GameBoardCard.h"

@implementation GameBoardCardSet

-(instancetype)init{
    self = [super init];
    if(self){
        for (NSUInteger rank = 0; rank < 24; rank++) {
            GameBoardCard *card = [[GameBoardCard alloc]init];
            card.rank = rank;
            [self addCard:card];
        }
    }
    return self;
}



@end
