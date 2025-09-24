func fibonacci(_ number : Int) -> [Int] {
    //base cases 0, 1, 2
    if(number <= 0){
        return []
    }
    if(number == 1){
        return [1]
    }
    if(number == 2){
        return [1, 1]
    }
    // fibonachi(i) = fibonachi(i-1) + the sum of the last 2 elements
    let prevFib = fibonacci(number-1)
    let fib = prevFib + [prevFib[prevFib.count-2] + prevFib[prevFib.count-1]]
    return fib
}

print(fibonacci(9))