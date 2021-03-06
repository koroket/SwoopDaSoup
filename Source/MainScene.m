//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
{
    CCNode* _myGameLayer;
    CCNode* _gameContent;
    CCPhysicsNode* _physicsNode;
    CCNode* _levelNode;
    CCSprite* me;
    int gamecount;
}
-(void)onEnter
{
    [super onEnter];

    me = (CCSprite*)[CCBReader load:@"Me"];
    me.position = ccp(100,-300);
    [_physicsNode addChild:me];
    


}
-(void)update:(CCTime)delta
{
    gamecount++;

    

    
    if(/*condition for going down*/gamecount<500)
    {
        if(gamecount%20==19)
        {
            CCSprite* myobj = (CCSprite*)[CCBReader load:@"Object"];
            myobj.position = ccp(arc4random()%400,me.position.y-200);
            myobj.physicsBody.sensor = YES;
            [_physicsNode addChild:myobj];
            [self moveLeft:myobj];
        }
        self.position  = ccp(self.position.x,self.position.y+2.0);
        me.position = ccp(me.position.x,me.position.y-2.0);
    }
    else
    {
        self.position  = ccp(self.position.x,self.position.y-2.0);
        me.position = ccp(me.position.x,me.position.y+2.0);
    }

    
    

}
-(void)moveRight:(CCNode*) mahnig
{
    [mahnig.physicsBody setVelocity:ccp(5.0,mahnig.physicsBody.velocity.y)];
    [self performSelector:@selector(moveLeft) withObject:mahnig afterDelay:5.0];
}
-(void)moveLeft:(CCNode*) mahnig
{
    [mahnig.physicsBody setVelocity:ccp(-5.0,mahnig.physicsBody.velocity.y)];
    [self performSelector:@selector(moveRight) withObject:mahnig afterDelay:5.0];
}


@end
