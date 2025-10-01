struct Address {
    let street : String
    let city : String
    let zipCode : String
    let country : String

    var formattedAddress : String {
        """
        \(country), \(city),
        \(street) st.
        \(zipCode)
        """
    }
}