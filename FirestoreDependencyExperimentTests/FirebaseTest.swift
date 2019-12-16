//
//  FirebaseTest.swift
//  FirestoreDependencyExperimentTests
//
//  Created by Yoshikuni Kato on 16/12/2019.
//  Copyright © 2019 Yoshikuni Kato. All rights reserved.
//

import Foundation
import Firebase

class FirebaseTest {
    static let shared: FirebaseTest = FirebaseTest()
    
    init() {
        // You need to add your `GoogleService-Info.plist` to run tests.
        // It's not included in this repository for security reasons.
        FirebaseApp.configure()
    }
}
