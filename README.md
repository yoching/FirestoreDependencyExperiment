# FirestoreDependencyExperiment
An experiment about Firestore dependency.

Tests crash by accessing `query.documents`.
This is probably because it's used in multiple modules.
Reference: https://github.com/firebase/firebase-ios-sdk/issues/4271
