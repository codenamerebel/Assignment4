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
    @IBOutlet var ResetStoryButton:UIButton!;
    
    var storyController:StoryDataHandler = StoryDataHandler();
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()


        self.restartStory();
    }

    @IBAction func advanceTheStoryFrom(_sender: UIButton)
    {
        
        let storyUpdates = self.storyController.advanceStory(choiceKey:_sender.title(for: UIControl.State.normal)!)
                
        if(storyUpdates.Choice1 == nil && storyUpdates.Choice2 == nil)
        {
            //  Configure the GUI for the end of story
            //  I present the reset button and the end prompt
            self.PromptLabel.text = storyUpdates.Prompt;

            self.setViewResetMode();
        }
        
        else
        {
            //  Configure the gui with opening information
            self.PromptLabel.text = storyUpdates.Prompt;
            self.Choice1Button.setTitle(storyUpdates.Choice1, for:UIControl.State.normal);
            self.Choice2Button.setTitle(storyUpdates.Choice2, for:UIControl.State.normal);
        }
        
        
    }
    
    //  This is technically the end of story mode where it presents you with a reset button
    //  1 button and a label
    func    setViewResetMode()
    {
        self.Choice1Button.isHidden = true;
        self.Choice2Button.isHidden = true;
        self.ResetStoryButton.isHidden = false;
    }
    
    //  This is the normal story mode.
    //  2 buttons and label
    func    setViewStoryMode()
    {
        self.Choice1Button.isHidden = false;
        self.Choice2Button.isHidden = false;
        self.ResetStoryButton.isHidden = true;
    }
    
    //  This resets the story at the beginning
    @IBAction func    restartStory()
    {
        self.setViewStoryMode();
        
        self.storyController.resetStory();
        
        let startScreen = self.storyController.startStory();
        
        //  Put the story onto the screen
        PromptLabel.text = startScreen.Prompt;
        Choice1Button.setTitle(startScreen.Choice1, for:UIControl.State.normal);
        Choice2Button.setTitle(startScreen.Choice2, for:UIControl.State.normal);
        
    }
    
    
}

