//
//  DataManager.swift
//  Publisher
//
//  Created by Eric chung on 2022/4/2.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DataManager {
    let db = Firestore.firestore()
    
    func fetchData(_ completion: @escaping ([String:Any]) -> Void) {
        db.collection("articles").getDocuments { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                for documents in querySnapshot.documents {
                    DispatchQueue.main.async {
                        completion(documents.data())
                    }
                }
            }
        }
    }
    
    func createData(_ category: String, _ content: String, _ title: String) {
        let ref = db.collection("articles").document()
        let data: [String: Any] = [
            "aurthor": [
                "email":"asd@gmail.com",
                "id":"asd",
                "name":"Wayne",
            ],
            "category": "\(category)",
            "content": "\(content)",
            "createdTime": NSDate().timeIntervalSince1970,
            "id": ref.documentID,
            "title": "\(title)",
        ]
        ref.setData(data){ err in
                 if let err = err {
                     print("Error adding document: \(err)")
                 } else {
                    print(data)
                 }
             }
    }
    
}
