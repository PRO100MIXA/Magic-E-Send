//
//  MagicE_SendViewController.m
//  Magic E-Send
//
//  Created by Mikhael on 17.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MagicE_SendViewController.h"
@interface MagicE_SendViewController ()

@end

@implementation MagicE_SendViewController
@synthesize emailPicker=emailPicker_;
@synthesize notesField=notesField_;


- (void)viewDidLoad
{
    [super viewDidLoad];
    activites_ = [[NSArray alloc] initWithObjects:@"сижу на унитазе", @"сплю", @"ем", @"работаю", @"думаю", @"пишу", @"путешествую", @"бегаю", @"мечтаю", @"учу", nil];
    feelings_ = [[NSArray alloc] initWithObjects:@"расслабление", @"удивление", @"печаль", @"счастье", @"сомнение", @"надежду", @"спокойствие", @"злость", @"стресс", @"любовь", nil];    
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)textFieldDoneEditing:(id)sender 
{
    [sender resignFirstResponder];
}

#pragma mark -
#pragma mark Picker Data Source Protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [activites_ count];
    }
    else {
        return [feelings_ count];
    }
}

#pragma mark -
#pragma mark Picker Delegate Protocol
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [activites_ objectAtIndex:row];
    } else {
        return [feelings_ objectAtIndex:row];
    }
    return nil;
}

-(IBAction)sendButtonTapped:(id)sender 
{
    NSString* theMessage = [NSString stringWithFormat:@"%@ Я %@ и чувствую %@!", notesField_.text ?notesField_.text:@"",[activites_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]],[feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@",theMessage);
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setToRecipients:[[NSArray alloc] initWithObjects: @"carolina58@yandex.ru", @"mixail.exe@gmail.com", nil]];
        [mailController setSubject:@"Hello!!!"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
    } else {
        NSLog(@"Необходим настроенный аккаунт электронной почты");
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setEmailPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*- (void)dealloc{
 [activites_ release];
 [feelings_ release];
 [super dealloc];
 }*/
@end
