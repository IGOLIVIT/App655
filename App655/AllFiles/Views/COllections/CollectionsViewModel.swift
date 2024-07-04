//
//  CollectionsViewModel.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI
import CoreData

final class CollectionsViewModel: ObservableObject {
    
    @Published var photos: [String] = ["p1", "p2", "p3"]
    @Published var currentPhoto = ""

    @Published var teamPhotos: [String] = ["t1", "t2", "t3"]
    @Published var currentTPhoto = ""
    
    @AppStorage("numExhibits") var numExhibits: Int = 0
    @AppStorage("numCol") var numCol: Int = 0
    
    @Published var currentTeamName = ""
    
    @AppStorage("teamsAdded") var teamsAdded: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false

    @Published var colTitle = ""
    @Published var colDescr = ""

    @Published var collections: [ColModel] = []
    @Published var selectedCollection: ColModel?
    
    func addCollection() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ColModel", into: context) as! ColModel
        
        loan.colTitle = colTitle
        loan.colDescr = colDescr
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchCollections() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ColModel>(entityName: "ColModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.collections = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.collections = []
        }
    }
    
//    @Published var partPhoto = ""
//    @Published var partName = ""
//    @Published var partSurname = ""
//    @Published var partTeam = ""
//
//    @Published var participants: [PartModel] = []
//    @Published var selectedParticipant: PartModel?
//    
//    func addParticipant() {
//        
//        let context = CoreDataStack.shared.persistentContainer.viewContext
//        let loan = NSEntityDescription.insertNewObject(forEntityName: "PartModel", into: context) as! PartModel
//        
//        loan.partPhoto = partPhoto
//        loan.partName = partName
//        loan.partSurname = partSurname
//        loan.partTeam = partTeam
//
//        CoreDataStack.shared.saveContext()
//    }
//    
//    func fetchParticipants() {
//        
//        let context = CoreDataStack.shared.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<PartModel>(entityName: "PartModel")
//        
//        do {
//            
//            let result = try context.fetch(fetchRequest)
//            
//            self.participants = result
//
//        } catch let error as NSError {
//            
//            print("catch")
//            
//            print("Error fetching persons: \(error), \(error.userInfo)")
//            
//            self.participants = []
//        }
//    }
}
