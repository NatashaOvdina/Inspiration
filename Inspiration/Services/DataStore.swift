//
//  DataStore.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 09.02.2024.
//

import UIKit


final class DataStore {
    static let shared = DataStore()
    
    let developer = Developer(
        fullName: "Natalia Ovdina",
        email: "natashaovdina@yahoo.com",
        githubURL: "github.com/NatashaOvdina",
        photoURL: "natashaovdina"
    )
    
    let appInfo = AppInformation(
        info: "is a motivating quote generator app that provides users with a daily dose of inspiration and encouragement. Users can explore a collection of handpicked quotes from famous personalities, thought leaders, and literary figures. With a simple tap, they can discover insightful and thought-provoking quotes to uplift their spirits, motivate them to achieve their goals"
        
    )
    
    let navigationList = [
        Navigation(
            header: "Save favorite quotes",
            footer: "Tap on the heart icon to save and create your own list of quotes",
            image: "heart"
        ),
        
        Navigation(
            header: "View Affirmations",
            footer: "Tap on a mint button to random quotes on different genres",
            image: "hand.tap"
        ),
        
        Navigation(
            header: "Some details",
            footer: "Tap on the face icon to see the developer and information about app",
            image: "person.crop.circle.fill"
        ),
        
        Navigation(
            header: "Customize your screen",
            footer: "Tap on the gear icon to set font and background's color",
            image: "gearshape"
        ),
        
        Navigation(
            header: "Explore Categories",
            footer: "Tap on the purple button to explore over the 50+ categories",
            image: "hand.tap"
        )
    ]
    
    private init() {}
}
