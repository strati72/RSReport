//
//  RSRaggruppaVerticaleItem.m
//  RSReport
//
//  Created by Strati Sergio on 12/03/20.
//  Copyright (c) 2020 Strati Sergio. All rights reserved.
//

#import "RSRaggruppaVerticaleItem.h"

@interface RSRaggruppaVerticaleItem ()

@property (nonatomic, strong) NSString *previousValue;
@property (assign) CGRect memorizzaFrame;


@end

@implementation RSRaggruppaVerticaleItem

@dynamic frame ;
@synthesize previousValue = _previousValue;
@synthesize memorizzaFrame = _memorizzaFrame;

- (id)init
{
    self = [super init];
    if (self) {
        _memorizzaFrame = CGRectNull;
    }
    
    return self;
}


- (void) setFrame:(CGRect)frame2 {
    [super setFrame:frame2];
    if (CGRectEqualToRect(_memorizzaFrame, CGRectNull))
        _memorizzaFrame = frame2;
}

- (void)evaluate {
    NSObject *value = [[self.delegate getDataSource] getAttributeByPath:self.attribute];
    if ([value isKindOfClass:[NSString class]]) {
        NSString *valore = (NSString*)value;
        if ([valore isEqualToString: _previousValue] && self.delegate.getReportType == RSReportPDFType)
            self.frame = CGRectZero;
        else
            self.frame = _memorizzaFrame;
        
        _previousValue = valore;
    }
}

@end
