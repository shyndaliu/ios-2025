struct CartItem {
    let product : Product
    var quantity : Int {
        didSet{
            if(quantity<=0){
                quantity = oldValue
            }
        }
    }
    var subtotal : Double {
        product.price * Double(quantity)
    }

    mutating func updateQuantity(_ newQuantity : Int){
        self.quantity = newQuantity
    }
    mutating func increaseQuantity(by amount : Int){
        self.quantity += amount
    }

    init?(product : Product, quantity : Int){
        if(quantity<0){
            return nil
        }
        self.product = product
        self.quantity = quantity
    }
}