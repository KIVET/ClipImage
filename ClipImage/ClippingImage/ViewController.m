//
//  ViewController.m
//  ClippingImage
//
//  Created by dzs on 16/1/7.
//  Copyright © 2016年 dzs. All rights reserved.
//

#import "ViewController.h"
#import "DZSClipImageController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,DZSClipImageControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
    
}
- (IBAction)click:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];

    
    
}

#pragma mark - imagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage * image = info[@"UIImagePickerControllerOriginalImage"];
    
    DZSClipImageController * clipView = [[DZSClipImageController alloc]initWithImage:image ClipType:0 ScaleType:ScaleTypeTwo Delegate:self];
    [picker pushViewController:clipView animated:YES];
    
}

#pragma mark - DZSClipImageControllerDelegate
-(void)ClipViewController:(DZSClipImageController *)clipViewController FinishClipImage:(UIImage *)editImage
{
    [clipViewController dismissViewControllerAnimated:YES completion:^{
        self.iamgeView.image = editImage;
    }];;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
