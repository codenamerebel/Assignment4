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
    
    var storyController:StoryDataHandler = StoryDataHandler();
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // print(storyController.completeStory.description)
        
        let startScreen = self.storyController.startStory();
        
        
        //  Set up GUI

        
        
        //  Configure the gui with opening information
        PromptLabel.text = startScreen.Prompt;
        Choice1Button.setTitle(startScreen.Choice1, for:UIControl.State.normal);
        Choice2Button.setTitle(startScreen.Choice2, for:UIControl.State.normal);
        
        
        print(Choice1Button.title(for: UIControl.State.normal)!);
        
        
        
    }

    @IBAction func advanceTheStoryFrom(_sender: UIButton)
    {
        
        let storyUpdates = self.storyController.advanceStory(choiceKey:_sender.title(for: UIControl.State.normal)!)
        
        print(storyUpdates)
        
        if(storyUpdates.Choice1 == nil && storyUpdates.Choice2 == nil)
        {
            //  Configure the gui with opening information
            self.PromptLabel.text = storyUpdates.Prompt;

            //  Configure GUI here
        }
        
        else
        {
            //  Configure the gui with opening information
            self.PromptLabel.text = storyUpdates.Prompt;
            self.Choice1Button.setTitle(storyUpdates.Choice1, for:UIControl.State.normal);
            self.Choice2Button.setTitle(storyUpdates.Choice2, for:UIControl.State.normal);
        }
        
        
    }
    

}

