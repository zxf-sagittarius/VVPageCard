//
//  VVDelegateProxy.m
//  VVPageCard
//
//  Created by zxfei on 2020/7/14.
//

#import "VVDelegateProxy.h"
#import <objc/runtime.h>

@interface VVDelegateProxy () {
    Protocol *_protocol;
    NSPointerArray *_weakArray;
}

@end

@implementation VVDelegateProxy

- (instancetype)initWithProtocol:(Protocol *)protocol {
    if (self = [super init]) {
        class_addProtocol(self.class, protocol);
        _protocol = protocol;
        _weakArray = [NSPointerArray weakObjectsPointerArray];
    }
    return self;
}

- (void)addDelegate:(id)delegate {
    if (delegate) {
        [_weakArray addPointer:(__bridge void *)delegate];
    }
}


- (BOOL)respondsToSelector:(SEL)aSelector {
    
    for (id target in _weakArray) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    struct objc_method_description methodDescription = protocol_getMethodDescription(_protocol, aSelector, NO, YES);
    if (methodDescription.name == NULL) {
        methodDescription = protocol_getMethodDescription(_protocol, aSelector, YES, YES);
        if (methodDescription.name == NULL) return [super methodSignatureForSelector:aSelector];
    }

    return [NSMethodSignature signatureWithObjCTypes:methodDescription.types];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (id target in _weakArray) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

@end
