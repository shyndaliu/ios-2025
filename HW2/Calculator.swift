func add(_ lhs: Double, _ rhs: Double) -> Double {
    lhs + rhs
}

func subtract(_ lhs: Double, _ rhs: Double) -> Double {
    lhs - rhs
}

func multiply(_ lhs: Double, _ rhs: Double) -> Double {
    lhs * rhs
}

func divide(_ lhs: Double, _ rhs: Double) -> Double? {
    if rhs == 0 {
        return nil
    }
    return lhs / rhs
}

while true{
    // first we create placeholders for the arguments
    var num1 : Double?
    var num2 : Double?

    //retrieving first number
    print("enter first number: ")
    if let firstInput = readLine(){
        if let firstNumber = Double(firstInput){
            num1 = firstNumber
        }else{
            print("incorrect input")
            continue
        }
    }

    //retrieving second number
    print("enter second number: ")
    if let secondInput = readLine(){
        if let secondNumber = Double(secondInput){
            num2 = secondNumber
        }else{
            print("incorrect input")
            continue
        }
    }
    
    //retrieving operation
    print("enter operation / * - +")
    let operation = readLine()
    var result: Double?

    //self explainatory
    if num1==nil, num2==nil {
        print("One of the entered numbers were incorrect")
        continue
    }
    
    switch operation {
    case "+":
        result = add(num1!, num2!)
    case "-":
        result = subtract(num1!, num2!)
    case "*":
        result = multiply(num1!, num2!)
    case "/":
        result = divide(num1!, num2!)
        if result == nil {
            print("division by zero is not allowed")
            continue
        }
    default:
        print("incorrect operation")
        continue
    }
    
    print("=\(result!)")
    
    //ending loop if user types q
    print("type q to quit or type anything else to continue")
    if let choice = readLine(){
        if(choice=="q"){
            break
        }
    }
}
