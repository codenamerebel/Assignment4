//
//  StoryDataHandler.swift
//  Assignment4
//
//  Created by Brad Payne on 2/3/23.
//
/*
 
 The data structore for Adventure.pList works as below.
 You are given a Dictionary with 3 keys
 Key 1:  Prompt         Prompt will return the story prompt
 Key 2 & 3:  The key is the text used for the Button.  It will return another dictionary
 with the same format.
 
 Once you reach the end of the story you will receive a dictionary with 1 key
 Key:  End              End will return the final prompt for the story to tell you the ending
 
 */
 

import Foundation

class   StoryDataHandler
{
    let completeStory:NSDictionary;
    var currentStory:NSDictionary;
    
    
    init()
    {
        //  Initialize complete story to pull in the whole pList
        //  This will help us if we need to reset it by never changing it
        let AdventurePath = Bundle.main.path(forResource: "Adventure.plist", ofType:nil)!;
        self.completeStory = NSDictionary(contentsOfFile:AdventurePath)!;
        
        
        //  This will be where we currently are in the story with the options
        //  It should start out equal to the completeStory
        self.currentStory = NSDictionary(dictionary: self.completeStory);
    }

    
    func startStory() -> (Prompt: String, Choice1: String, Choice2: String)
    {
        var storyOptionsArray:Array = self.currentStory.allKeys;
        
        storyOptionsArray.removeAll(where: { $0 as! String == "Prompt" })
                        
        return(self.currentStory["Prompt"] as! String, storyOptionsArray[0] as! String, storyOptionsArray[1] as! String)
    }
        
    func advanceStory(choiceKey:String) -> (Prompt: String, Choice1: String?, Choice2: String?)
    {
        //  Let's advance the story and change our options
        self.currentStory = self.currentStory[choiceKey] as! NSDictionary;
        
        //  If we have 3 key options it means we have more choices so use this option
        if(self.currentStory.count == 3)
        {
            return self.startStory();
        }
        
        //  If we only have 1 key it is for the End text
        else
        {
            return (self.currentStory["End"] as! String, nil, nil)
        }
        
    }
    
    func    resetStory()
    {
        //  This will be where we currently are in the story with the options
        //  It should start out equal to the completeStory
        self.currentStory = NSDictionary(dictionary: self.completeStory);
    }
    
}
