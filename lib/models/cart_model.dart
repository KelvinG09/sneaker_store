import 'shoe_model.dart';

class Cart {
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK',
      price: '236',
      description: 'The forward-thinking design of his latest signature shoe.',
      imagePath: 'assets/images/sneakers-1.png',
    ),
    Shoe(
      name: 'Air Jordans',
      price: '220',
      description:
          'You\'ve got the hops and the speed—lace up in shoes that enhance it.',
      imagePath: 'assets/images/sneakers-2.jpg',
    ),
    Shoe(
      name: 'KD Treys',
      price: '240',
      description:
          'A secure midfoot strap is suited for scoring binges and defensive stops.',
      imagePath: 'assets/images/sneakers-3.png',
    )
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList({String? filter}) {
    if (filter != null && filter.isNotEmpty) {
      return shoeShop.where((shoe) => shoe.name.toLowerCase().contains(filter.toLowerCase())).toList();
    }
    return shoeShop;
  }


  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
  }
}
