//
//  FeedViewController.swift
//  Week 5 Homework
//
//  Created by Nadeem Visanji on 6/20/16.
//  Copyright © 2016 Nadeem Visanji. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var wedding1ImageView: UIImageView!
    @IBOutlet weak var wedding2ImageView: UIImageView!
    @IBOutlet weak var wedding3ImageView: UIImageView!
    @IBOutlet weak var wedding4ImageView: UIImageView!
    @IBOutlet weak var wedding5ImageView: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set the size of the scrollview
        feedScrollView.contentSize = feedImageView.image!.size
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        
        //allows the gesture recognizer to understand which image view was tapped
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        imageTransition = ImageTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = imageTransition
        
        // Adjust the transition duration. (seconds)
        imageTransition.duration = 1.0
        
        //sets the image to be passed as the one that was selected
        destinationViewController.weddingImage = self.selectedImageView.image
        
        
    }

}
