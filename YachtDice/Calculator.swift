//
//  Calculator.swift
//  YachtDice
//
//  Created by 최승범 on 5/30/24.
//

import Foundation

struct Calculator {
    var dices = [Int](repeating: 1, count: 5)
    
    var sumOfDices: Int {
        var sum = 0
        dices.forEach { num in
            sum += num
        }
        
        return sum
    }
    
    var choice: Int {
       sumOfDices
    }
    
    var fourOfKind: Int {
        var sortedDice = dices.sorted()
        
        if sortedDice[0] == sortedDice[1] {
            sortedDice.removeLast()
            if Set(sortedDice).count == 1 {
               return sumOfDices
            }
        } else if sortedDice[3] == sortedDice[4] {
            sortedDice.removeFirst()
            if Set(sortedDice).count == 1 {
                return sumOfDices
            }
        }
        
        return 0
    }
    
    var fullHouse: Int {
        var sortedDice = dices.sorted()
        
        if sortedDice[0] == sortedDice[1] &&
            sortedDice[2] == sortedDice[3] &&
            sortedDice[3] == sortedDice[4] &&
            sortedDice[4] == sortedDice[5] {
          
            return sumOfDices
        }
        
        return 0
    }
    
    var smallStraight: Int {
        var sortedDice = dices.sorted()
        sortedDice.removeLast()
        
        if sortedDice == [1,2,3,4] ||
            sortedDice == [2,3,4,5] ||
            sortedDice == [3,4,5,6] {
            return 15
        }
        
        return 0
    }
    
    var largeStraight: Int {
        let sortedDice = dices.sorted()
        
        if sortedDice == [1,2,3,4,5] ||
            sortedDice == [2,3,4,5,6] {
            return 30
        }
        
        return 0
    }
    
    var yacht: Int {
        if Set(dices).count == 1 {
            return 50
        }
        return 0
    }
    
    func countOfDice(num: Int) -> Int {
        let dices = dices.filter { $0 == num }
        return dices.count * num
    }
    
}