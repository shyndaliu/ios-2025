let firstName = "Uldana"
let lastName = "Shyndali"
let isStudent = true
let height = 168
let birthYear = 2005
let currentYear = 2025
let age = currentYear - birthYear


let hobby = "video editing"
let numberOfHobbies = 3
let favoriteNumber = 5
let isHobbyCreative = true

let interestingFact = "I have visited the northerst McDonalds in the world."

let lifeStory = "My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). " 
+ (isStudent ? "I am currently a student. " : "") 
+ "I enjoy \(hobby), which is " 
+ (isHobbyCreative ? "a creative" : "not a creative")
+ " hobby. I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). \(interestingFact)"
print(lifeStory)