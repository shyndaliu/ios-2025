

// 1. Create sample products
let laptop : Product = Product(
    id: "001",
    name: "MacBook M3",
    price: 1000,
    category: .electronics,
    description: "Powerful laptop with M3 chip"
)!

let book : Product = Product(
    id: "002",
    name: "The Swift Programming Language",
    price: 40,
    category: .books,
    description: "Official guide to Swift by Apple"
)!

let headphones : Product = Product(
    id: "003",
    name: "Sony WH-1000XM5",
    price: 350,
    category: .electronics,
    description: "Noise-cancelling wireless headphones"
)!

// 2. Test adding items to cart
let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

cart.displayCart()

// 3. Test adding same product twice (should update quantity)
cart.addItem(product: laptop, quantity: 1)
// Verify laptop quantity is now 2

cart.displayCart()


// 4. Test cart calculations
print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

// 5. Test discount code
cart.discountCode = "SAVE10"
print("Total with discount: \(cart.total)")

// 6. Test removing items
cart.removeItem(productId: book.id)

cart.displayCart()

//7. Demonstrate REFERENCE TYPE behavior
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
// Verify original cart was modified

cart.displayCart()

// 8. Demonstrate VALUE TYPE behavior
let item1 : CartItem = CartItem(product: laptop, quantity: 1)!
var item2 = item1
item2.updateQuantity(5)
// Verify item1.quantity is still 1 (not affected)

cart.displayCart()

// 9. Create order from cart
let address = Address(
    street: "123 Apple St",
    city: "Cupertino",
    zipCode: "95014",
    country: "USA"
)
let order = Order(from: cart, shippingAddress: address)

// 10. Modify cart after order creation
cart.clearCart()
// Verify order still contains original items (immutable snapshot)

cart.displayCart()

for item in order.items {
            print("\(item.product.name) \(item.product.price) \(item.quantity)")
}

print("Order items count: \(order.itemCount)") // Should not be 0
print("Cart items count: \(cart.itemCount)")   // Should be 0