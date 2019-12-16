//
//  SampleSpec.swift
//  FirestoreDependencyExperimentTests
//
//  Created by Yoshikuni Kato on 16/12/2019.
//  Copyright © 2019 Yoshikuni Kato. All rights reserved.
//

import Foundation
import Quick
import Nimble
import FirebaseFirestore
import Firebase

@testable import FirestoreDependencyExperiment

class SampleSpec: QuickSpec {
    override func spec() {
        
        beforeEach {
            _ = FirebaseTest.shared
        }
        
        describe("firestore direct access") {
            it("can fetch snapshot") {
                // arrange
                
                // act
                var snapshot: QuerySnapshot?
                var error: Error?
                Firestore
                    .firestore()
                    .collection("samples")
                    .getDocuments { _snapshot, _error in
                        snapshot = _snapshot
                        print(snapshot?.documents ?? "")
                        error = _error
                }
                
                // assert
                expect(snapshot).toEventuallyNot(beNil())
                expect(error).toEventually(beNil())
            }
        }
        
        describe("FirestoreManager") {
            it("can fetch snapshot") {
                // arrange
                
                // act
                var snapshot: QuerySnapshot?
                var error: Error?
                
                let manager = FirestoreManager(firestore: Firestore.firestore())
                manager
                    .fetch { _snapshot, _error in
                        snapshot = _snapshot
                        print("🙂", snapshot?.documents ?? "")
                        error = _error
                }
                
                // assert
                expect(snapshot).toEventuallyNot(beNil())
                expect(error).toEventually(beNil())
            }
        }
        
        describe("FirestoreCollectionManager") {
            it("can fetch snapshot") {
                // arrange
                
                // act
                var snapshot: QuerySnapshot?
                var error: Error?
                
                let manager = FirestoreCollectionManager(collection: Firestore.firestore().collection("samples"))
                manager
                    .fetch { _snapshot, _error in
                        snapshot = _snapshot
                        print("🙂", snapshot?.documents ?? "")
                        error = _error
                }
                
                // assert
                expect(snapshot).toEventuallyNot(beNil())
                expect(error).toEventually(beNil())
            }
        }
        
    }
}

