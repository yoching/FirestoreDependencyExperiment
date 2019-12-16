//
//  FirestoreCollectionManager.swift
//  FirestoreDependencyExperiment
//
//  Created by Yoshikuni Kato on 16/12/2019.
//  Copyright © 2019 Yoshikuni Kato. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class FirestoreCollectionManager {

    private let collection: CollectionReference
    init(collection: CollectionReference) {
        self.collection = collection
    }

    func fetch(completion: @escaping (QuerySnapshot?, Error?) -> Void) {
        collection
            .getDocuments { _snapshot, _error in
                print(_snapshot?.documents ?? "") // this crashes!
                completion(_snapshot, _error)
        }
    }
}
