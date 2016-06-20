//
//  ImageTransition.swift
//  Week 5 Homework
//
//  Created by Nadeem Visanji on 6/20/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let feedViewController = fromViewController as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        //create a view but it is floating
        let movingImageView = UIImageView()
        movingImageView.image = feedViewController.selectedImageView.image
        movingImageView.frame = feedViewController.selectedImageView.frame
        feedViewController.selectedImageView.contentMode = feedViewController.selectedImageView.contentMode
        
        //add view to the container view
        containerView.addSubview(movingImageView)
        feedViewController.selectedImageView.alpha = 0
        photoViewController.photoImageView.alpha = 0
        
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            
            movingImageView.frame = photoViewController.photoImageView.frame
            
            }) { (finished: Bool) -> Void in
                photoViewController.photoImageView.alpha = 1
                feedViewController.selectedImageView.alpha = 0
                movingImageView.alpha = 0
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
           let feedViewController = toViewController as! FeedViewController
           let photoViewController = fromViewController as! PhotoViewController
        
           //create a view but it is floating
           let movingImageView = UIImageView()
           movingImageView.image = photoViewController.photoImageView.image
           movingImageView.frame = photoViewController.photoImageView.frame
           photoViewController.photoImageView.contentMode = photoViewController.photoImageView.contentMode
        
           //add view to the container view
           containerView.addSubview(movingImageView)
           feedViewController.selectedImageView.alpha = 0
           photoViewController.photoImageView.alpha = 0
        
        
           fromViewController.view.alpha = 1
        
           movingImageView.frame = photoViewController.photoImageView.frame
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                photoViewController.photoImageView.alpha = 0
                feedViewController.selectedImageView.alpha = 1
                movingImageView.alpha = 1
                self.finish()
        }
    }

}
