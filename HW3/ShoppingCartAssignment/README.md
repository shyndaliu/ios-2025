1. **Why did you choose class for ShoppingCart?**

- because it needs to be shared across the app

2. **Why did you choose struct for Product and Order?**

- the copies can be created freely without accidentaly modifiying other variables, for example creating new order without changing the already completed order or updating product's price without changing it in shopping cart  

3. **Explain one example where reference semantics matter in your code**

- in the test when I applied modify cart function, because changes must have been done to the object that was passed to the function. for example, in appliction same cart can be modified from different pages (main page or search page or before making an order)


4. **Explain one example where value semantics matter in your code**

- when creating order, as in real life the list of products that we get from shopping cart are like snapshots, no matter how we change the shopping cart it will not alter it in our order because we just created a copy

5. **What challenges did you face and how did you solve them?**

- i struggled with a problem of immutability, turned out when using "for item in items" all items here are immutable copies, therefore in order to manipulates items on the list they must be accessed with their index -> items[i], i googled it :)

- did not really understand which cases requires init?() or init throws

- struggled with accessor notation a lot, googled for "public private(set) var" 

- was too lazy to comment on everything, sorry :(