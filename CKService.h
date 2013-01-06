/* Generated by RuntimeBrowser.
 Image: /System/Library/PrivateFrameworks/ChatKit.framework/ChatKit
 */

@class NSString, CKConversationList;

@interface CKService : NSObject  {
    NSString *_serviceID;
    CKConversationList *_conversationList;
}

@property(readonly) CKConversationList * conversationList;
@property(readonly) NSString * serviceID;


- (int)unreadCount;
- (void)dealloc;
- (id)headerTitleForComposeRecipients:(id)arg1 mediaObjects:(id)arg2 subject:(id)arg3;
- (BOOL)canAcceptMediaObjectType:(int)arg1 givenMediaObjects:(id)arg2;
- (int)unreadConversationCount;
- (BOOL)supportsMediaAttachments;
- (id)copyEntityForAddressString:(id)arg1;
- (id)newMessageWithComposition:(id)arg1 forConversation:(id)arg2;
- (id)lookupRecipientsForConversation:(id)arg1;
- (id)messagesForConversation:(id)arg1 limit:(int)arg2 moreToLoad:(BOOL*)arg3;
- (BOOL)canSendMessageWithMediaObjectTypes:(int*)arg1;
- (int)maxRecipientCount;
- (id)initWithServiceID:(id)arg1;
- (BOOL)canSendToRecipients:(id)arg1 withAttachments:(id)arg2 alertIfUnable:(BOOL)arg3;
- (BOOL)dbFull;
- (id)newDeliverableMessageEncodingInfoWithComposition:(id)arg1;
- (BOOL)hasActiveConversations;
- (BOOL)canAcceptMediaObject:(id)arg1 givenMediaObjects:(id)arg2;
- (double)maxTrimDurationForMediaType:(int)arg1;
- (id)abPropertyTypes;
- (int)maxAttachmentCount;
- (id)serviceID;
- (int)unreadCountForConversation:(id)arg1;
- (void)markAllMessagesInConversationAsRead:(id)arg1;
- (int)conversationIDWithRecipients:(id)arg1;
- (int)createConversationWithRecipients:(id)arg1;
- (id)unknownEntity;
- (void)deleteMessagesForConversationIDs:(id)arg1 removeConversations:(BOOL)arg2;
- (id)conversationSummaries:(id*)arg1 groupIDs:(id*)arg2;
- (id)conversationList;
- (void)fixupNames;
- (BOOL)isValidAddress:(id)arg1;
- (id)headerTitleForEntities:(id)arg1;
- (id)placeholderMessageForConversation:(id)arg1 withDate:(id)arg2;
- (id)newMessageWithMessage:(id)arg1 forConversation:(id)arg2 isForward:(BOOL)arg3;
- (BOOL)isSMSDeliverableComposition:(id)arg1 forConversationWithRecipientCount:(unsigned int)arg2 recipientsRequired:(BOOL)arg3;
- (BOOL)restrictsMediaObjects;
- (void)sendMessage:(id)arg1;

@end