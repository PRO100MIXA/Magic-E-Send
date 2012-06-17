//
//  MagicE_SendViewController.h
//  Magic E-Send
//
//  Created by Mikhael on 17.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MagicE_SendViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
    UIPickerView *emailPicker_;
    NSArray *activites_;
    NSArray *feelings_;
    UITextField *notesField_;
}
- (IBAction)sendButtonTapped:(id)sender;
@property (retain, nonatomic) IBOutlet UIPickerView *emailPicker;
@property (retain, nonatomic) IBOutlet UITextField *notesField;
- (IBAction)textFieldDoneEditing:(id)sender;

@end
