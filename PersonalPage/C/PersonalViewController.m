//
//  PersonalViewController.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/1.
//

#import "PersonalViewController.h"
#import "PersonalView.h"
#import "CollectionViewController.h"
@interface PersonalViewController ()
@property (nonatomic, strong) PersonalView* personView;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    _personView = [[PersonalView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:_personView];
 
    [self.personView viewInit];
    self.personView.delegate = self;
    [self.view addSubview: self.personView];
    
}
- (void)pressBackButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)chuButton:(UIButton *)button {
    if (button.tag == 0) {
//        [self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (button.tag == 1) {
        CollectionViewController *viewcontroller = [[CollectionViewController alloc] init];
//        [self.navigationController pushViewController:viewcontroller animated:YES];
//        viewcontroller.modalPresentationStyle = 0;
        [self presentViewController:viewcontroller animated:YES completion:nil];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
