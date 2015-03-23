#import "HWPHello.h"

@implementation HWPHello

/*
- (void)greet:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];
    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self success:result callbackId:callbackId];
}
 */

- (void)show:(CDVInvokedUrlCommand*)command
{
    //NSString* callbackId = [command callbackId];
    NSArray* args = [command arguments][0];
    NSString* placeholder = args[0];
    NSLog(@"GALLERY args: %@", args);
    
    UIViewController* controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor blackColor];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  
    UIImage* image_placeholder = [UIImage imageNamed:placeholder];
    UIScrollView* scroll = [[UIScrollView alloc] initWithFrame:controller.view.bounds];
    scroll.pagingEnabled = YES;
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.contentSize = CGSizeMake(scroll.frame.size.width * (args.count - 1), scroll.frame.size.height);
    for (int i = 1; i < args.count; i++)
    {
        NSString* name = args[i];
        UIImageView* image_view = [[UIImageView alloc] initWithFrame:CGRectMake((i - 1) * scroll.frame.size.width, 0, scroll.frame.size.width, scroll.frame.size.height)];
        image_view.image = image_placeholder;
        image_view.contentMode = UIViewContentModeScaleAspectFit;
        NSURL* url = [NSURL URLWithString:name];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                image_view.image = [UIImage imageWithData:data];
            });
        });
        [scroll addSubview:image_view];
    }
    [controller.view addSubview:scroll];
   
    UITapGestureRecognizer* gesture_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action_tap)];
    [controller.view addGestureRecognizer:gesture_tap];
    /*
    UISwipeGestureRecognizer* gesture_prev = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(action_prev)];
    gesture_prev.direction = UISwipeGestureRecognizerDirectionLeft;
    [controller.view addGestureRecognizer:gesture_prev];
    
    UISwipeGestureRecognizer* gesture_next = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(action_next)];
    gesture_prev.direction = UISwipeGestureRecognizerDirectionRight;
    [controller.view addGestureRecognizer:gesture_next];
     */
    [self.viewController presentViewController:controller animated:YES completion:nil];
    
    //CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
    //[self success:result callbackId:callbackId];
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)action_tap
{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

/*
- (void)action_prev
{
    NSLog(@"GALLERY previous");
}

- (void)action_next
{
    NSLog(@"GALLERY next");
}
 */

@end