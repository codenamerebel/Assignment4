//
//  StoryDataHandler.swift
//  Assignment4
//
//  Created by Brad Payne on 2/3/23.
//

import Foundation

class   StoryDataHandler
{
    var completeStory:NSDictionary;
    
    init()
    {
        let AdventurePath = Bundle.main.path(forResource: "Adventure.plist", ofType:nil)!;
        self.completeStory = NSDictionary(contentsOfFile:AdventurePath)!;
        
        print(self.completeStory.description);
        
      //  super.init();
    }
    
    
    func getNextPart() -> NSDictionary
    {
        return ["test":"Testing"] as NSDictionary
    }
    
}
