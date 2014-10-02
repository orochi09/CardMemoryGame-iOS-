//
//  GameBoardCard.m
//  CardGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import "GameBoardCard.h"

static const NSInteger defaultNum[] = {1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12};

@implementation GameBoardCard
@synthesize rank = _rank;

-(NSInteger)num{
    return defaultNum[self.rank];
}



-(void)setRank:(NSInteger)rank{
    if (rank < 24) {
        _rank = rank;
    }
}


@end
