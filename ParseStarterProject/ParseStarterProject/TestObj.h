//
//  TestObj.h
//  ParseStarterProject
//
//  Created by Douglas Voss on 5/20/15.
//
//

#import <Parse/Parse.h>

@interface TestObj : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL cheat;
@property (nonatomic, assign) NSArray *stringArr;

+ (NSString *)parseClassName;

@end
