//
//  ExhibitsViewModel.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI
import CoreData

final class ExhibitsViewModel: ObservableObject {
    
    @Published var photos: [String] = ["m1", "m2", "m3", "p1"]
    @Published var currentPhoto = ""
    
    @AppStorage("numExhibits") var numExhibits: Int = 0

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var hisPhoto = ""
    @Published var hisTitle = ""
    @Published var hisCountry = ""
    @Published var hisYear = ""
    @Published var hisCondition = ""
    @Published var hisDescr = ""
    @Published var hisCol = ""

    @Published var histories: [HistoryModel] = []
    @Published var selectedHistory: HistoryModel?

    func addHistory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel

        loan.hisPhoto = hisPhoto
        loan.hisTitle = hisTitle
        loan.hisCountry = hisCountry
        loan.hisYear = hisYear
        loan.hisCondition = hisCondition
        loan.hisDescr = hisDescr
        loan.hisCol = hisCol

        CoreDataStack.shared.saveContext()
    }

    func fetchHistories() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.histories = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.histories = []
        }
    }
}
