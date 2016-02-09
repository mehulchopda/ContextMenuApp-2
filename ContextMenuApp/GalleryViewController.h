//
//  ViewController.h
//  ThesisPhotoEditor
//
//  Created by Mehul Chopda on 21/07/15.
//  Copyright (c) 2015 Mehul Chopda. All rights reserved.
//

#import <UIKit/UIKit.h>


@import Photos;
@protocol GalleryViewControllerProtocol
-(void)setAsset:(PHAsset*)amount;
-(void)setAssetCollection:(PHAssetCollection*)amount;





@end
@interface GalleryViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate,PHPhotoLibraryChangeObserver,GalleryViewControllerProtocol>
{
    IBOutlet UILabel *stopWatch;
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong) PHAsset *asset;
@property (strong) PHAssetCollection *assetCollection;

@property (strong, nonatomic) IBOutlet UIButton *imageDelete;
@property (strong, nonatomic) NSTimer *stopWatchTimer; // Store the timer that fires after a certain time
@property (strong, nonatomic) NSDate *startDate; // Stores the date of the click on the start button *

- (IBAction)imageDelete:(id)sender;
- (IBAction)favouriteImage:(id)sender;
- (IBAction)addAlbum:(id)sender;
- (IBAction)allPhotos:(id)sender;

- (IBAction)shareButton:(id)sender;

@end

