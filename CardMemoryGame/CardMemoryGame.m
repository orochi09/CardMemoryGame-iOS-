//
//  CardMemoryGame.m
//  CardMemoryGame
//
//  Created by Owen on 4/2/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import "CardMemoryGame.h"
#import "Card.h"

@interface CardMemoryGame()
@property(nonatomic,readwrite)NSInteger score;
@property(strong,nonatomic)NSMutableArray *cards;


@end

@implementation CardMemoryGame

-(NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(Card *)cardAtIndex:(NSInteger)index{
    if (index < [self.cards count]) {
        return self.cards[index];
    }
    return nil;
}

-(void)gameStart:(NSInteger)pos{
    Card *card = [self cardAtIndex:pos];
    if (!card.isMatched) {
        if (card.isUp) {
            [card setUp:NO];
        }else{
            for (Card *others in self.cards) {
                if(others.isUp && !others.isMatched){
                    int judge = [card match:@[others]];
                    if(judge){
                        card.matched = YES;
                        others.matched = YES;
                    }else{
                        others.up = NO;
                    }
                    break;
                }
            }
            card.up = YES;
        }
    }

}

-(instancetype)initWithCardSet:(CardSet *)cardSet{
    self = [super init];
    if (self) {
        for (int i = 0; i < 24; i++) {
            Card *card = [cardSet getRandomCard];
            [self.cards addObject:card];
        }
    }
    return self;
}


@end
