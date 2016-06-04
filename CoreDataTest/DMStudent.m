//
//  DMStudent.m
//  CoreDataTest
//
//  Created by sublio on 04/06/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "DMStudent.h"


@implementation DMStudent

@dynamic firstName;
@dynamic lastName;
@dynamic dateOfBirth;
@dynamic score;


- (void) setFirstName:(NSString *)firstName{
    
    [self willChangeValueForKey:@"firstName"];
    
    [self setPrimitiveValue:firstName forKey:@"firstName"];
    
    [self didChangeValueForKey:@"firstName"];
    
    //NSLog(@"SET FIRST NAME!!!");
    
};


-(NSString*) firstName{
    
    NSString* string = nil;
    
    [self willAccessValueForKey:@"firstName"];
    string = [self primitiveValueForKey:@"firstName"];
    [self didAccessValueForKey:@"firstName"];
    
    //NSLog(@"GET FIRST NAME");
    
    return string;
};


-(BOOL) validateLastName: (__autoreleasing id *)value error:(NSError * __autoreleasing *)error {
    
    
    *error = [NSError errorWithDomain:@"Bad last name" code:123 userInfo:nil];
    
    return NO;
}

@end
