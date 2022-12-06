
import 'package:flutter/material.dart';
import 'package:grocery_shop/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Consumer<CartModel>(
        // consume the data in CartModel
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          // with the list tile you can all the values of our CartModel
                          title: Text(value.cartItems[index][0]), // name
                          leading: Image.asset(
                            value.cartItems[index][2], // path
                            height: 36,
                          ),
                          subtitle:
                              Text('\$' + value.cartItems[index][1]), // price
                          trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index)),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // total + pay now 
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:  Colors.green[900]
                  ),
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              color: Colors.green[100],),

                            ),
                          
                          const SizedBox(
                            height: 8,
                          ),
                          Text('\$${value.calculateTotal()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),

                        ],
                      ),
                      InkWell(
                        onTap: () {
                          
                        },                        
                        child: Container(
                          decoration: BoxDecoration(                         
                          borderRadius: BorderRadius.circular(8),
                            color: Colors.green
                            ) , 
                          padding: const EdgeInsets.all(12),                        
                          child: Row(
                            children: const [
                              Text(
                                "Pay Now",                        
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,                          
                                ), 
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
