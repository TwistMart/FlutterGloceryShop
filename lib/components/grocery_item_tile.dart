import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color[200], borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              imagePath,
              height: 64,
            ),

            const SizedBox(
              height: 15,
            ),

            // item name
            Text(
              itemName,
            ),

            const Spacer(),

            // price + button
            MaterialButton(
              onPressed: onPressed, // or  child: Text('\$' + itemPrice),
              color: color,
              child: Text(
                '\$$itemPrice',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
