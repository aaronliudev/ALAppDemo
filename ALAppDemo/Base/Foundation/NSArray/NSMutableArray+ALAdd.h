//
//  NSMutableArray+ALAdd.h
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ALAdd)

- (void)moveObjectToTopAtIndex:(NSUInteger)index;
- (void)moveObjectFromIndex:(NSUInteger)oldIndex toIndex:(NSUInteger)newIndex;
- (void)removeFirstObject;
- (nullable id)pop;

#pragma mark - ** Safe **

- (void)safelyAddObject: (nullable id)object;
- (void)safelyInsertObject:(nullable id)object atIndex:(NSUInteger)index;

- (void)removeObjectWithIndex:(NSUInteger)index;

- (void)safelyReplaceObjectAtIndex:(NSUInteger)index withObject:(id _Nullable )anObject;

-(void)addObj:(id _Nullable )i;

-(void)addString:(NSString*_Nullable)i;

-(void)addBool:(BOOL)i;

-(void)addInt:(int)i;

-(void)addInteger:(NSInteger)i;

-(void)addUnsignedInteger:(NSUInteger)i;

-(void)addCGFloat:(CGFloat)f;

-(void)addChar:(char)c;

-(void)addFloat:(float)i;

-(void)addPoint:(CGPoint)o;

-(void)addSize:(CGSize)o;

-(void)addRect:(CGRect)o;

@end
