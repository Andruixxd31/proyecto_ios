//
//  BookViewModel.swift
//  bookKeeperApp
//
//  Created by gdaalumno on 15/06/22.
//

import Foundation
import FirebaseFirestore

class BookViewModel: ObservableObject {
    
    @Published var books = [BookModel]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("books").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents obtained")
                return
            }
            
            print("Documents obtained")
            
            self.books = documents.map { (queryDocumentSnapshot) -> BookModel in
                let data = queryDocumentSnapshot.data()
                
                let uid = data["uid"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let saga = data["saga"] as? String ?? ""
                let numPages = data["numPages"] as? String ?? ""
                let actualPage = data["actualPage"] as? String ?? ""
                let genre = data["genre"] as? String ?? ""
                let score = data["score"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""
                
                return BookModel(uid: uid, name: name, saga: saga, numPages: numPages, actualPage: actualPage, genre: genre, score: score, author: author, imageUrl: imageUrl)
            }
        }
    }
}
