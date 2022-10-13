import Foundation

enum LottoMachineError: Error {
    case invalidNumbers
    case cannotDivide
    case lose
//    case
}

struct LottoMachine {
    func isValidLottoNumber(of numbers: [Int]) -> Bool {
        guard numbers.count == 6, Set(numbers).count == 6 else {
            return false
        }
        
        for num in numbers {
            guard 1...45 ~= num else {
                return false
            }
        }
        
        return true
    }
    
    func makeRandomLottoNumbersArray() -> [Int] {
        var numberSet: Set<Int> = []
        
        while numberSet.count < 6 {
            let randomNumber = Int.random(in: 1...45)
            numberSet.insert(randomNumber)
        }
        
        return Array(numberSet)
    }//발급 확인
    
    func countingMatchingNumber(user: [Int], winner: [Int]) throws -> Int {
        guard isValidLottoNumber(of: user) && isValidLottoNumber(of: winner) else {
            throw LottoMachineError.invalidNumbers
        }
        
        let winNumbers = user.filter { winner.contains($0) }
        return winNumbers.count
    }//중복 확인
    
    // MARK: - 로또(자동)
    
    func buyLotto(_ cost: Int) throws -> Int {
        
        if cost < 1000 {
            throw LottoMachineError.invalidNumbers
        }
        
        if cost % 1000 != 0 {
            throw LottoMachineError.cannotDivide
        }
        
        return cost/1000
        
    }//구입 가능 확인
    
    func winStatistics(user: [Int], winner: [Int]) throws -> [Int] {
        
        do {
            let win = try countingMatchingNumber(user: user, winner: winner)
            if win >= 3 {
                return [win, win*10000]
            } else {
                throw LottoMachineError.lose
            }
        } catch {
            throw LottoMachineError.invalidNumbers
        }
    }
    
}

//6, 5, 4, 3

