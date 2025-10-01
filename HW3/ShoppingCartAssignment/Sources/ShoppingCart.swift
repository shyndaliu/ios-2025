class ShoppingCart {
    public private(set) var items : [CartItem] 
    var discountCode : String?
    var subtotal : Double {
        var subtotal : Double = 0
        for item in items{
            subtotal += item.subtotal
        }
        return subtotal
    }
    var discountAmount : Double {
        if(discountCode==nil){
            return 0
        }
        let restring = "SAVE[0-9]+"
        if let re = try? Regex(restring){
            if let _ = discountCode!.firstMatch(of : re){
                var discountPercent=""
                for i in 4...discountCode!.count-1{
                    discountPercent += "\(discountCode![discountCode!.index(discountCode!.startIndex, offsetBy: i)])"
                }
                if let discountPercentInt = Double(discountPercent) {
                    if discountPercentInt<=100{
                        return subtotal*discountPercentInt/100
                    }
                }
            }
        }
        return 0
    }
    var total : Double {
        subtotal - discountAmount
    }
    var itemCount: Int {
        var total : Int = 0
        for item in items{
            total += item.quantity
        }
        return total
    }
    var isEmpty : Bool {
        itemCount == 0
    }


    init(){
        items = []
    }

    func addItem(product: Product, quantity: Int = 1){
        if let newItem = CartItem(product: product, quantity : quantity){
            if(items.count == 0){
                items.append(newItem)
                return
            }
            for i in 0...(items.count - 1) {
                if items[i].product.name == product.name {
                    items[i].increaseQuantity(by : quantity)
                    return
                }
            }
            items.append(newItem)
        }
    }

    func removeItem(productId : String){
        var newItems : [CartItem] = []
        for item in items{
            if(item.product.id == productId){
                continue
            }
            newItems.append(item)
        }
        items = newItems
    }

    func updateItemQuantity(productId : String, quantity : Int){
        for i in 0...items.count-1{
            if(items[i].product.id == productId){
                let newQuantity = items[i].quantity - quantity
                if(newQuantity <= 0){
                    removeItem(productId : productId)
                    return
                }
                items[i].updateQuantity(newQuantity)
            }
        }
    }

    func clearCart(){
        items = []
    }

    func displayCart(){
        print("------Shopping cart-------")
        for item in cart.items {
            print("\(item.product.name) \(item.product.price) \(item.quantity)")
        }
        print("--------------------------")
    }
}

