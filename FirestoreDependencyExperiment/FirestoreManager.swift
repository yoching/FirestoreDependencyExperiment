//
//  FirestoreManager.swift
//  FirestoreDependencyExperiment
//
//  Created by Yoshikuni Kato on 16/12/2019.
//  Copyright © 2019 Yoshikuni Kato. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class FirestoreManager {
    
    private let firestore: Firestore
    init(firestore: Firestore) {
        self.firestore = firestore
    }

    func fetch(completion: @escaping (QuerySnapshot?, Error?) -> Void) {
        firestore
            .collection("samples")
            .getDocuments { _snapshot, _error in
                print(_snapshot?.documents ?? "") // this crashes!
                completion(_snapshot, _error)
        }
    }
}
