import Foundation

enum StringPlusError: Error {
    case containNil
    case emptyString
    case negativeNumber
}

struct StrangeCalculator {
    
    // MARK: - 1단계. 문자열 덧셈 계산기
    func addString(input: String?) throws -> Int {
        
        guard let input = input else {
            throw StringPlusError.containNil
        }//nil 확인
        
        if input.isEmpty {
            throw StringPlusError.emptyString
        }//비어있는지 확인
        
        let divideInput = input.components(separatedBy: [",", ":"]).map{ Int($0)! }.reduce(0,+)
        
        if divideInput < 0 {
            throw StringPlusError.negativeNumber
        }//0보다 작은지 확인
        
        return divideInput
        
    }
    
}

