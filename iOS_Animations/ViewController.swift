//
//  ViewController.swift
//  iOS_Animations
//
//  Created by MacStudent on 2020-01-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageVIew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

var timer = Timer()
    
    var counter = 0
    var isAnimating = false
    
    
    @IBAction func fade(_ sender: UIButton) {  imageVIew.alpha=0
              
              UIView.animate(withDuration: 2){
              self.imageVIew.alpha=1
              }
        
    }
    
    
    @IBAction func slide(_ sender: UIButton) {        imageVIew.center=CGPoint(x: imageVIew.center.x-1000, y: imageVIew.center.y)
        UIView.animate(withDuration: 2){
            self.imageVIew.center=CGPoint(x: self.imageVIew.center.x+1000, y: self.imageVIew.center.y)
        }
        
    }
    
    
    @IBAction func grow(_ sender: UIButton) {
        let  width = imageVIew.frame.size.width
        let height = imageVIew.frame.size.height
        
        let x = imageVIew.frame.origin.x
        let y = imageVIew.frame.origin.y
        
        imageVIew.frame = CGRect(x: x, y: y, width: 0, height: 0)
        UIView.animate(withDuration: 2)
        {
            self.imageVIew.frame = CGRect(x: x, y: y, width: width, height:  height)
        }
    }
    
    @IBOutlet weak var play: UIButton!
    
    
    @IBAction func playBtn(_ sender: UIButton) {
        
        if isAnimating
              {
                timer.invalidate()
                play.setTitle("Play", for: [])
                isAnimating=false
                
               }
               else
               {
                   timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
                play.setTitle("Stop", for: [])
                isAnimating=true
               }
        
        
    }
    
   @objc func animate()
    {
       
        
        imageVIew.image=UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1
        if counter == 6 {
            counter=0
        }
    }
    
    
    
    
}

