//
//  CardViewController.m
//  CardMemoryGame
//
//  Created by Owen on 4/1/14.
//  Copyright (c) 2014 Zhe. All rights reserved.
//

#import "CardViewController.h"
#import "CardSet.h"
#import "GameBoardCardSet.h"
#import "CardMemoryGame.h"


@interface CardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property(nonatomic)int stepCount;
@property(strong,nonatomic)CardSet *cardSet;
@property(strong,nonatomic)CardMemoryGame *thisGame;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;

@end

@implementation CardViewController

-(CardSet *)cardSet{
    if(!_cardSet){
        _cardSet = [self createCardSet];
    }
    return _cardSet;
}

-(CardSet *)createCardSet{
    return [[GameBoardCardSet alloc] init];
}



-(UIImage *)setBackground:(Card*)card{
    if (card.isUp) {
        return [UIImage imageNamed:[NSString stringWithFormat:@"card-face%d",card.num]];
    }else{
        return [UIImage imageNamed:@"card-back"];
        
    }
}


- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.CardButtons indexOfObject:sender];
    [self.thisGame gameStart:cardIndex];
    self.stepCount++;
    for (UIButton *imageButton in self.CardButtons) {
        int cardIndex = [self.CardButtons indexOfObject:imageButton];
        Card *card = [self.thisGame cardAtIndex:cardIndex];
        [imageButton setBackgroundImage:[self setBackground:card] forState:UIControlStateNormal];
        imageButton.enabled = !card.isMatched;
    }
    int j = 0;
    for (int i = 0; i < [self.CardButtons count]; i++) {
        UIButton *testButton = self.CardButtons[i];
        if (testButton.enabled == NO) {
            j++;
        }
        if (j == [self.CardButtons count]) {
            UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"Congratulations!" message:nil delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:@"New Game", nil];
            av.tag = 99;
            [av show];
//            NSLog(@"Yes");
            
        }
    }
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (alertView.tag==99&&buttonIndex==1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


-(void)setStepCount:(int)stepCount{
    _stepCount = stepCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Step: %d",self.stepCount];
}


-(CardMemoryGame *)thisGame{
    if (!_thisGame) {
        _thisGame = [[CardMemoryGame alloc] initWithCardSet:[self createCardSet]];
    }
    return _thisGame;
}

- (IBAction)exitAnyway:(UIButton *)sender {
    exit(0);
}
//
//- (IBAction)resetGame:(UIButton *)sender {
//    for (UIButton *button in self.CardButtons) {
//        [button setBackgroundImage:[UIImage imageNamed:@"card-back"] forState:UIControlStateNormal];
//        
//    }
//}
//


@end
