struct Product{
    let id : String
    let name : String
    var price : Double {
        didSet{
            if(price < 0){
                price = oldValue
            }
        }
    }
    let category : Category
    var description : String
    var displayPrice : String {
        return "$\(price)"
    }

    init?(id: String, name : String, price: Double, category: Category, description: String) {
        if(price>0){
            self.price = price
        }else{
            return nil
        }

        
        self.id = id
        self.name = name
        self.category = category
        self.description = description
    }

}

enum Category {
    case electronics, clothing, food, books
}