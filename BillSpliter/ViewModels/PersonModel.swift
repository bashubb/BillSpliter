//
//  UserModel.swift
//  BillSpliter
//
//  Created by HubertMac on 23/10/2023.
//

import Foundation

class PersonModel: ObservableObject {
    @Published var friends = [Person]()
    @Published var choosenPerson: Person?
    init() {
        
    }
    
    
    func alterPerson(_ person: Person) {
            self.friends = self.friends.map { $0.id == person.id ? person : $0 }
        }
    
    func addPerson(_ person: Person) {
        self.friends.append(person)
    }
    
    func addExpense(_ amount: Int) {
        for friend in friends {
            if friend.id == choosenPerson?.id {
                print("founded matching person")
                
                var newFriend = friend
                newFriend.spendedCash += amount
                alterPerson(newFriend)
            }
        }
    }
    
//
//var monika = Friend(name: "Monika", spendedCash: 150)
//var hubert = Friend(name: "Hubert", spendedCash: 20)
//var marcin = Friend(name: "Marcin", spendedCash: 110)
//var ewa = Friend(name: "Ewa", spendedCash: 200)
//
//let friends: [Friend] = [ monika, hubert, marcin, ewa]
//
//
//var totalCost = 0
//for friend in friends {
//    totalCost += friend.spendedCash
//}
//
//var perPerson = totalCost / friends.count
//
//print("total cost is \(totalCost)")
//print("per person is \(perPerson)")
//
//for (index, friend) in friends.enumerated() {
//    
//    // find which person needs to give back money
//    if friend.spendedCash >=  perPerson {
//        continue
//    } else {
//        //giver
//        // how much money friend needs to give back
//        var toGive = perPerson - friend.spendedCash
//        print("-----I am a giver \(friend.name) I need to give back  \(toGive)")
//        
//        var friendsWithoutGiver = friends
//        friendsWithoutGiver.remove(at: index)
//        print("============")
//        friends.forEach{print($0.name)}
//        print("============")
//        friendsWithoutGiver.forEach {print($0.name)}
//        
//        //looking for a taker
//        for taker in friendsWithoutGiver {
//            if taker.spendedCash <= perPerson{
//                continue
//            } else {
//                var toTake = taker.spendedCash - perPerson
//                print("###I am a taker \(taker.name) I need to take  \(toTake)")
//                if toTake >= toGive {
//                    friend.spendedCash += toGive
//                    print("$$ \(friend.name) is paying \(toGive) for \(taker.name) ")
//                    taker.spendedCash -= toGive
//                    toGive = 0
//                    print(friend.spendedCash)
//                } else {
//                    friend.spendedCash += toTake
//                    taker.spendedCash -= toTake
//                    toGive -= toTake
//                    print("$$ \(friend.name) need to pay \(toTake) for \(taker.name) ")
//                    print(friend.spendedCash)
//                }
//            }
//        }
//    }
//    
//}
//
}
