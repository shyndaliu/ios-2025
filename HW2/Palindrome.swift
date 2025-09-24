//helping function that will use regex to check if character is a letter
func isLetter(_ letter : Character) -> Bool {
    let restring = "[a-zA-Z]+"
        if let re = try? Regex(restring){
            if let _ = "\(letter)".firstMatch(of : re){
                return true
            }
        }
        return false
}

func isPalindrome(_ text : String) -> Bool {
    //first we set iterators to the first and last character
    var i = 0, j=text.count - 1
    while (i<j){
        let leftCharacter =  text[text.index(text.startIndex, offsetBy: i)]
        let rightCharacter = text[text.index(text.startIndex, offsetBy: j)]
        //until the leftmost character is not a letter we move it to the right
        if(!isLetter(leftCharacter)){
            i += 1
            continue
        }
        //same logic for the rightmost character
        if(!isLetter(rightCharacter)){
            j -= 1
            continue
        }
        //if they both letters, we check their equality and 
        //in case of true move to the next leftmost and rightmost characters
        if(leftCharacter.lowercased()==rightCharacter.lowercased()){
            i += 1
            j -= 1
        }else{
            //otherwise it is obvi not palindrome, no need to check the rest
            return false
        }
    }
    return true
}

print(isPalindrome("aB!!bb,,  .,. a"))