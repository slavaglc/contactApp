
class DataManager {
    var persons: [Person] = []
    
    static let shared = DataManager()
    
    private var names: [String] = ["John", "Sven", "Kate", "Carl", "Alice", "Mary", "Abraham", "Elliah", "Ariel", "Nataly", "Amanda", "Randy", "Barbara", "Henry", "Michael"]
    private var surnames: [String] = ["Anderson", "Smith", "Doe", "Katz", "Jones", "Ramirez", "Ramone", "Armstrong", "James", "Adams", "Johnson", "Daniels", "Samuels", "Rogers", "Jackson"]
    
    func generateData(count: Int) {
        var randomNames: [String: Bool] = [:]
        var randomSurnames: [String: Bool] = [:]
        var randomNumbers: [String: Bool] = [:]
        var randomEmails: [String: Bool] = [:]
        
        for iteration in 0...count {
            print("generation iterations is: \(iteration)")
            iterationReset: do {
                guard let name = names.randomElement() else { return }
                guard let surname = surnames.randomElement() else { return }
                let number = generatePhoneNumber()
                let email = generateEmail(name: name, surname: surname)
                
                if !randomNames.keys.contains(name) && !randomSurnames.keys.contains(surname) &&
                    !randomNumbers.keys.contains(number) && !randomEmails.keys.contains(email) {
                    
                    randomNames[name] = true
                    randomSurnames[surname] = true
                    randomNumbers[number] = true
                    randomEmails[email] = true
                    
                    persons.append(Person(name: name, surname: surname, number: number, email: email))
                    continue
                }
                continue iterationReset
            }
        }
        
        func generatePhoneNumber() -> String {
            let randomNumber = Int.random(in: 1111111111...9999999999)
            return "+7" + String(randomNumber)
        }
        
        func generateEmail(name: String, surname: String) -> String {
            let randomNumber = Int.random(in: 0...100)
            return name + surname + String(randomNumber) + "@gmail.com"
        }
    }
}
