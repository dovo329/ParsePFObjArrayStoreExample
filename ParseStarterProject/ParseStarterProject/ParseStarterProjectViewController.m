//
//  ParseStarterProjectViewController.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import "ParseStarterProjectViewController.h"

#import <Parse/Parse.h>

#import "TestObj.h"

@implementation ParseStarterProjectViewController

#pragma mark -
#pragma mark UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)createParseObject:(id)sender
{
    /*PFObject *object = [PFObject objectWithClassName:@"Entry"];
    
    object[@"title"] = @"Another Entry";
    object[@"body"] = @"Today was a nice day.";
    object[@"timestamp"] = [NSDate date];
    
    NSLog(@"got here");
    [object pinInBackground];
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"succeeded");
        }
        else {
            NSLog(@"error");
        }
    }];*/
    
    TestObj *test = [TestObj new];
    test.name = @"Jordan";
    test.cheat = false;
    test.stringArr = @[@"Car", @"Train", @"Plane"];
    
    [test pinInBackground];
    [test saveInBackground];
}

- (IBAction)queryParse:(id)sender
{
    /*
    //PFQuery *query = [PFQuery queryWithClassName:@"Entry"];
    //query = [query whereKey:@"objectId" equalTo:@"kGDkiMf9fv"];
    //query = [query whereKey:@"title" equalTo:@"Another Entry"];
    //NSTimeInterval *timeInterval = [[NSTimeInterval alloc] init];
    NSDate *date = [[NSDate date] dateByAddingTimeInterval:(-60 * 2)];
    //NSDate *otherDate = [date dateByAddingTimeInterval:-100000];
    //query = [query whereKey:@"createdAt" greaterThan:date];
    //NSArray *entries =
    PFQuery *titleQuery = [[PFQuery queryWithClassName:@"Entry"] whereKey:@"title" equalTo:@"My Entry"];
    PFQuery *createdAtQuery = [[PFQuery queryWithClassName:@"Entry"] whereKey:@"createdAt" equalTo:date];
    PFQuery *orQuery = [PFQuery orQueryWithSubqueries:@[titleQuery, createdAtQuery]];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == \"%@\" OR createdAt > \"%@\"", @"My Entry", date];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title == %@ OR title == %@", @"My Entry", @"Another Entry"];
    PFQuery *query = [PFQuery queryWithClassName:@"Entry" predicate:predicate];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"objects: %@", objects);
        NSLog(@"found %ld objects", objects.count);
     }];
    //NSLog(@"entries = %@", entries);
    */
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", @"Doug"];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"cheat == false"];
    NSCompoundPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[predicate, predicate2]];
    //PFQuery *query = [PFQuery queryWithClassName:@"TestObj" predicate:compoundPredicate];
    PFQuery *query = [TestObj queryWithPredicate:compoundPredicate];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"objects: %@", objects);
        NSLog(@"found %ld objects", objects.count);
        
        TestObj *obj = objects[0];
        for (int i=0; i<[obj.stringArr count]; i++)
        {
            NSLog(@"string[%d]==%@", i, obj.stringArr[i]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
