print("Enter any sentence")

var words : [String: Int] = [:]


if let sentence = readLine(){
    //i looked how to use regex up
    var currentWord = ""
    let restring = "[a-zA-Z]+"
    for i in sentence{
        if let re = try? Regex(restring){
            if let _ = "\(i)".firstMatch(of : re){
                currentWord = currentWord + i.lowercased()
            }else if currentWord.count > 0{
                //if curentword is not empty and current character is 
                // not letter then currentword has ended and we must add it
                words[currentWord] = (words[currentWord] ?? 0) + 1
                currentWord=""
            }
        }
    }
    //case when ".......a"
    if currentWord.count > 0 {
        words[currentWord] = (words[currentWord] ?? 0) + 1
    }
}

print(words)