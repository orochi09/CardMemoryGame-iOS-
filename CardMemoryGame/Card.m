//
//  Card.m
//  CardGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize num = _num;
@synthesize up = _up;
@synthesize matched = _matched;




-(void)setNum:(NSInteger)number{
    _num = number;
}

-(BOOL)isUp{
    return _up;
}

-(void)setUp:(BOOL)isUp{
    _up = isUp;
}

-(BOOL)isMatched{
    return _matched;
}


-(int)match:(NSArray *)others{
    int result = 0;
    for (Card *card in others) {
        if (card.num == self.num) {
            result = 1;
        }
    }
    return result;
}
    
-(void)setMatched:(BOOL)isMatched{
    _matched = isMatched;
}




@end
