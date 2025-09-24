func hasUniqueCharacters(_ text: String) -> Bool{
    var characters = Set<Character>()
    //put all characters in the set and only unique one will be stored
    for i in text{
        characters.insert(i)
    }
    return text.count == characters.count
}

print(hasUniqueCharacters("hgHf"))