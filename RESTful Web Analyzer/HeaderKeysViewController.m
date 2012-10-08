//
//  HeaderKeysViewController.m
//  REST Analyzer
//
//  Created by Mario Stief on 10/9/12.
//
//

#import "HeaderKeysViewController.h"

@interface HeaderKeysViewController ()

@end

@implementation HeaderKeysViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _generalHeaders = [[NSArray alloc]initWithObjects:@"Cache-Control",@"Connection",@"Content-Encoding",@"Content-Language",@"Content-Length",@"Content-Location",@"Content-MD5",@"Content-Range",@"Content-Type",@"Pragma",@"Trailer",@"Via",@"Warning",@"Transfer-Encoding",@"Upgrade",nil];
    _requestHeaders = [[NSArray alloc]initWithObjects:@"Accept",@"Accept-Charset",@"Accept-Encoding",@"Accept-Language",@"Accept-Ranges",@"Authorization",@"Depth",@"Destination",@"Expect",@"From",@"Host",@"If",@"If-Match",@"If-Modified-Since",@"If-None-Match",@"If-Range",@"If-Unmodified-Since",@"Lock-Token",@"Max-Forwards",@"Overwrite",@"Proxy-Authorization",@"Range",@"Referer",@"TE",@"Timeout",@"User-Agent",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0)
        return [_generalHeaders count];
    else
        return [_requestHeaders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSString *cellText;
    if ([indexPath section] == 0)
        cellText = [[NSString alloc] initWithFormat:@"%@",[_generalHeaders objectAtIndex:[indexPath row]]];
    else
        cellText = [[NSString alloc] initWithFormat:@"%@",[_requestHeaders objectAtIndex:[indexPath row]]];
    
    cell.textLabel.text = cellText;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath section] == 0) {
        NSLog(@"_referenceToHeaderKey.text: %@",_referenceToHeaderKey.text);
        _referenceToHeaderKey.text = [_generalHeaders objectAtIndex:[indexPath row]];
        NSLog(@"_referenceToHeaderKey.text: %@",_referenceToHeaderKey.text);
    }
    else
        _referenceToHeaderKey.text = [_requestHeaders objectAtIndex:[indexPath row]];
    // Use the passed reference to the popover controller to dismiss this view.
    NSLog(@"%@ set.",_referenceToHeaderKey.text);
    [_referenceToPopoverController dismissPopoverAnimated:YES];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    //or better yet
    [self dismissModalViewControllerAnimated:YES];
    //the latter works fine for Modal segues
}

@end