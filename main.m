//
//  main.m
//  carrierInfo
//
//  Created by maliy on 8/4/10.
//  Copyright 2010 interMobile. All rights reserved.
//
/*
#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"carrierInfoAppDelegate");
    [pool release];
    return retVal;
}
*/
#import <Foundation/Foundation.h>
//#import "CKSMSService.h"
#include <notify.h>
#include <stdio.h>
#include <stdarg.h>
#include <dlfcn.h>
extern NSString* const kCTMessageReceivedNotification;
extern void CTTelephonyCenterAddObserver(void*,id,CFNotificationCallback,NSString*,void*,int);

static void signalHandler(int sigraised) 
{
    printf("\nInterrupted.\n"); 
    exit(0); 
}

static void callback_ctmessage(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) 
{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    if (!userInfo) return;
    NSDictionary *info = (NSDictionary *)userInfo;
	
    CFNumberRef msgID = (CFNumberRef)[info objectForKey:@"kCTMessageIdKey"];
    int result;
    CFNumberGetValue((CFNumberRef)msgID, kCFNumberSInt32Type, &result);
	
    id incMsg; 
    Class CTMessageCenter = NSClassFromString(@"CTMessageCenter");
    id mc = [CTMessageCenter sharedMessageCenter];
    incMsg = [mc incomingMessageWithId: result];
    int mType = (int)[incMsg messageType];
    NSString *sender;
    NSString *smsText;
    if (mType == 1)
    {
        id phonenumber = [incMsg sender];
        sender = [phonenumber canonicalFormat];
        id incMsgPart = [[incMsg items] objectAtIndex:0];
        NSData *smsData = [incMsgPart data];
        smsText = [[NSString alloc] initWithData:smsData encoding:NSUTF8StringEncoding];
    }
    NSLog(@"Sender: %@", sender);
    NSLog(@"Text: %@", smsText);
	//send to me when get new message
	[[CTMessageCenter sharedMessageCenter] sendSMSWithText:@"123" serviceCenter:nil toAddress:@"你的电话号码"];
	
    [pool drain];
}


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	//int retVal = UIApplicationMain(argc, argv, nil, @"carrierInfoAppDelegate");

    void *ct = CTTelephonyCenterGetDefault();
	
    CTTelephonyCenterAddObserver(ct, NULL, callback_ctmessage, kCTMessageReceivedNotification,NULL,4);
    
    sig_t oldHandler = signal(SIGINT, signalHandler);
    if (oldHandler == SIG_ERR) 
    {
        printf("Could not establish new signal handler");
        exit(1); 
    }
    
    // Run loop lets me catch notifications
    printf("Starting run loop and watching for notification.\n");
    CFRunLoopRun();
    
    // Shouldn't ever get here. Bzzzt
    printf("Unexpectedly back from CFRunLoopRun()!\n");
    
    [pool drain];
    return 0;
}
