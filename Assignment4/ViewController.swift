//
//  ViewController.swift
//  Assignment4
//
//  Created by Brad Payne on 2/1/23.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var PromptLabel:UILabel!;
    @IBOutlet var Choice1Button:UIButton!;
    @IBOutlet var Choice2Button:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var test = StoryDataHandler();
        
        
        print(test.completeStory.description)
        
        
    }


}

