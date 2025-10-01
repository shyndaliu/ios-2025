import Foundation
struct Order {
    let orderId : String 
    let items : [CartItem]
    let subtotal : Double
    let discountAmount : Double
    let total : Double
    let timestamp : Date
    let shippingAddress : Address
    var itemCount: Int {
        var total : Int = 0
        for item in items{
            total += item.quantity
        }
        return total
    }

    init (from cart : ShoppingCart, shippingAddress : Address){
        self.orderId = "order-\(Date())"
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.shippingAddress = shippingAddress
        self.timestamp = Date()
    }
}