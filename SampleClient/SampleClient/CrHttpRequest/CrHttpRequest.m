//
//  CrHttpRequest
//
//  Created by ozgend
//

#import "CrHttpRequest.h"

@implementation CrHttpRequest
@synthesize delegate;

- (id) initWithDelegate:(id)__delegate
{
    self = [super init];
    self.delegate = __delegate;
    return self;
}

- (void) makeRequest:(NSString *)urlString
{
    [self makeRequestWithData:urlString withData:nil];
}

- (void) makeRequestWithData:(NSString *)urlString withData:(id)data
{
    NSLog(@"CrHttpRequest - getDataFromUrl %@",urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest * request =
        [NSMutableURLRequest requestWithURL:url
                                cachePolicy:NSURLRequestReloadIgnoringCacheData
                            timeoutInterval:8.0];
    if(data){
        NSError *serializationError;
        id temp = [ObjectParse dictionaryForObject:data];
        NSData *postData = [ObjectParse dataForObject:temp];
                                
        [request setHTTPMethod:@"POST"];
        [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length]
        forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:postData];
        
        NSLog(@"CrHttpRequest post data: %@",temp);
    }
    
	id authenticationToken = [DataHelper loadKey:@"KEY_USERTOKEN"];
    if(authenticationToken){
        [request setValue:authenticationToken forHTTPHeaderField:KEY_AUTH_HEADER];
    }
    
    [request setValue:@"application/json charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"CrHttpRequest - dispatch_async");
        
        NSURLResponse *response;
        NSError *error;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request
													 returningResponse:&response
																 error:&error];
        
        
        if(error){
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                
                NSLog(@"CrHttpRequest HTTP-%ld error = %@", (long)httpResponse.statusCode, error);
            }
                        
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate crHttpRequestFailed:error];
            });
            
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"CrHttpRequest - dispatch_async success");
            //NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
			//id responseObject = [ObjectParse dictionaryForJsonString:responseString];
            
            //id responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:nil error:nil];
            
            id responseObject = [ObjectParse objectForJsonData:responseData];
            [self.delegate crHttpRequestCompleted:responseObject];
        });
    
    });
    
}












@end
