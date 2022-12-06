import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/components/grocery_item_tile.dart';
import 'package:grocery_shop/model/cart_model.dart';
import 'package:grocery_shop/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: const Icon(Icons.shopping_bag),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // good morning text
            const SizedBox(
              height: 48,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Good morning',
              ),
            ),

            const SizedBox(
              height: 4,
            ),

            // let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(
              height: 24,
            ),

            // fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Fresh Items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                // Consumer is widget to consume data
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemTocart(index);
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
