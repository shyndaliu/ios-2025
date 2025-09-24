
func isPrime(_ number : Int ) -> Bool {
    var i : Int = 2;
    // get sqrt as the dividors wont exceed sqrt (we can find the others just by division)
    let sqrt : Int = Int(Double(number).squareRoot())
    while (i<=sqrt){
        //if is divided by i then its not prime
        if(number%i==0){
            return false
        }
        i+=1
    }
    return true
} 

for i in 1...100{
    if(isPrime(i)){
        print(i)
    }
}