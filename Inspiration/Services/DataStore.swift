//
//  DataStore.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 09.02.2024.
//


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
    
    private init() {}
}
