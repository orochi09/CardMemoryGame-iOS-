//
//  CardSet.m
//  CardGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import "CardSet.h"

@implementation CardSet


-(NSMutableArray *)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(Card *)getRandomCard{
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


-(void)addCard:(Card *)card{
    [self.cards addObject:card];
}




@end
