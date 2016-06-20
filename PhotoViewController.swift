//
//  PhotoViewController.swift
//  Week 5 Homework
//
//  Created by Nadeem Visanji on 6/20/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoActionsImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    var weddingImage: UIImage!
    
    var originalPhotoCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //display the image that has been passed
        photoImageView.image = weddingImage
        
        //set the size of the scrollview
        //photoScrollView.contentSize.height = weddingImage.size.height + 100
        photoScrollView.contentSize = weddingImage.size
        
        //delegate away
        photoScrollView.delegate = self
        
        //get the original origin y value
        originalPhotoCenter = photoImageView.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func didTapDone(sender: AnyObject) {
        
        //dismiss the modal transition
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        // This method is called as the user scrolls
        // Make the background transparent while scrolling
        self.view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
        self.photoActionsImageView.alpha = 0.5
        self.doneButton.alpha = 0.5
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
            // This method is called right as the user lifts their finger
            print("done dragging")
            self.photoActionsImageView.alpha = 1.0
            self.doneButton.alpha = 1.0
            
            
            //use the scroll offset to dismiss the view controller if the image is dragged down 100 points
            var offset = Float(photoScrollView.contentOffset.y)
            if offset < -100 { dismissViewControllerAnimated(true, completion: nil) }
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
