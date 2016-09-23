//
//  CrHttpRequest
//
//  Created by ozgend
//

#define KEY_AUTH_HEADER @"Cr-Authentication-Token"

#import <Foundation/Foundation.h>
#import "ObjectParse.h"
#import "DataHelper.h"

@protocol CrHttpRequestCallback <NSObject>

@required
- (void) crHttpRequestCompleted:(id)responseObject;
- (void) crHttpRequestFailed:(NSError*)error;
@end

@interface CrHttpRequest : NSObject

@property (strong, nonatomic) id delegate;

- (id) initWithDelegate:(id)__delegate;

- (void) makeRequest:(NSString *)urlString;

- (void) makeRequestWithData:(NSString *)urlString withData:(id)data;

@end
