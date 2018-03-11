//
//  NSMutableArray+ALAdd.m
//  ALAppDemo
//
//  Created by Alan on 2018/2/22.
//  Copyright © 2018年 Alan. All rights reserved.
//

#import "NSMutableArray+ALAdd.h"

@implementation NSMutableArray (ALAdd)

/**
 将元素移到数组顶
 @param index 被移动的元素的序号
 */
- (void)moveObjectToTopAtIndex:(NSUInteger)index
{
    [self moveObjectFromIndex:index toIndex:0];
}

/**
 移动元素
 @param oldIndex 元素序号
 @param newIndex 新的位置序号
 */
- (void)moveObjectFromIndex:(NSUInteger)oldIndex toIndex:(NSUInteger)newIndex
{
    if (oldIndex == newIndex)
        return;
    if (oldIndex >= self.count || newIndex >= self.count)
        return;
    
    id item = [self objectAtIndex:oldIndex];
    [self removeObjectAtIndex:oldIndex];
    [self insertObject:item atIndex:newIndex];
}

/// 删除第一个元素
- (void)removeFirstObject
{
    if (self.count > 1) [self removeObjectAtIndex:0];
}


/**
 获取最后一个元素返回，并从原数组中删除
 @return 最后一个元素，如果为空数组，则返回 nil
 */
- (id)pop
{
    if (self.count == 0) return nil;
    id retVal = self.lastObject;
    [self removeLastObject];
    return retVal;
}


//MARK: - Safe Method
- (void)safelyAddObject: (nullable id)object
{
    if (!object) return;
    [self addObject:object];
}

- (void)safelyInsertObject:(nullable id)object atIndex:(NSUInteger)index
{
    if (!object) return;
    if (index > self.count) return;
    [self insertObject:object atIndex:index];
}

- (void)removeObjectWithIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)safelyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

-(void)addObj:(id)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}

-(void)addString:(NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}

-(void)addBool:(BOOL)i
{
    [self addObject:@(i)];
}

-(void)addInt:(int)i
{
    [self addObject:@(i)];
}

-(void)addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}

-(void)addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}

-(void)addCGFloat:(CGFloat)f
{
    [self addObject:@(f)];
}

-(void)addChar:(char)c
{
    [self addObject:@(c)];
}

-(void)addFloat:(float)i
{
    [self addObject:@(i)];
}

-(void)addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}

-(void)addSize:(CGSize)o
{
    [self addObject:NSStringFromCGSize(o)];
}

-(void)addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

@end
