//
//  StoryDataHandler.swift
//  Assignment4
//
//  Created by Brad Payne on 2/3/23.
//

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
        
        
        //  This will be where we currently are in the story with the optoins
        //  It should start out equal to the completeStory
        self.currentStory = NSDictionary(dictionary: self.completeStory);
        
        
        //print(self.currentStory.description);
        startStory()

        advanceStory(choiceKey: "Choice 1");
        advanceStory(choiceKey: "Choice 1");
        
        
      //  super.init();
    }
    
    /*
    func advanceStory(choiceKey:String) -> NSDictionary
    {
        
        return ["test":"Testing"] as NSDictionary
    }
    */
    
    func advanceStory(choiceKey:String) -> (Prompt: String, Choice1: String, Choice2: String)
    {
        self.currentStory = self.currentStory[choiceKey] as! NSDictionary;
        
        print(self.currentStory.description);
            
        return ("Prompt", "Choice 1", "Choice 2");
    }
    
    
    func startStory() -> (Prompt: String, Choice1: String, Choice2: String)
    {
        var storyOptionsArray:Array = self.currentStory.allKeys;
        
        
        storyOptionsArray.removeAll(where: { $0 as! String == "Choice 1" })
        
        return(self.currentStory["Prompt"] as! String, storyOptionsArray[0] as! String, storyOptionsArray[1] as! String)
    }
    
    
}
