
var isCollectingStudentNames = true
var isCollectingStudentGrades = true
var studentsGrades : [String : Double] = [:]

func getAverage(_ grades : [Double]) -> Double {
    var sum : Double = 0
    for grade in grades {
        sum += grade
    }

    //divides sum by the count and uses ternary operation for case where count = 0
    return grades.count > 0 ? sum/Double(grades.count) : 0
    
}

func getMax(_ grades : [Double]) -> Double {
    if(grades.count == 0){
        return 0
    }
    // set the first value as the max, as we iterate over array we will encounter the real max and replace it
    var maxGrade = grades[0]
    for  grade in grades{
        if grade > maxGrade {
            maxGrade = grade
        }
    }
    return maxGrade
}

func getMin(_ grades : [Double]) -> Double {
    if(grades.count == 0){
        return 0
    }
    //same logic as for the max
    var minGrade = grades[0]
    for grade in grades{
        if grade < minGrade {
            minGrade = grade
        }
    }
    return minGrade
}

//loop to collect names
while isCollectingStudentNames{
    print("Enter student name bellow, if you are finished type 1")
    if let input = readLine(){
        if(input == "1"){
            isCollectingStudentNames = false
            break
        }
        studentsGrades[input] = 0
    }
}
//iterate over students to get the grade
for (student, grade) in studentsGrades{
    print("Enter \(student)'s grade, enter s to skip, current grade is \(grade)")
    if let input = readLine(){
        if(input=="s"){
            continue
        }
        if let grade = Double(input){
            studentsGrades[student] = grade
        }
    }
}



print(studentsGrades)
let average = getAverage(Array(studentsGrades.values))
print(average)
print(getMax(Array(studentsGrades.values)))
print(getMin(Array(studentsGrades.values)))

for (student, grade) in studentsGrades{
    print("\(student) is \(grade > average ? "above" : "below") the average with \(grade)")
}