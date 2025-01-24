// Updated CartScreen to use a singleton instance of Cart
import 'package:flutter/material.dart';
import 'package:sneakershop/models/cart_model.dart';
import 'package:sneakershop/models/shoe_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.getUserCart().length,
        itemBuilder: (context, index) {
          Shoe shoe = cart.getUserCart()[index];
          return ListTile(
            leading: Image.asset(shoe.imagePath),
            title: Text(shoe.name),
            subtitle: Text('\$${shoe.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  cart.removeItemFromCart(shoe);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Removed ${shoe.name} from cart!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}