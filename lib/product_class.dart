class ProductDetails {
  String? imageUrl;
  String? productName;
  double? price;
  int? quantity;
  ProductDetails({this.imageUrl, this.productName, this.price, this.quantity});

  static int getSubTotal() {
    double someValue = 0;
    for (var i = 0; i < productList.length; i++) {
      someValue += productList[i].price! * productList[i].quantity!;
    }
    return someValue.round();
  }

  static List<ProductDetails> productList = [
    ProductDetails(
        imageUrl: 'images/Rectangle 382.png',
        productName: 'Carrot (1 Kg)',
        price: 20,
        quantity: 0),
    ProductDetails(
        imageUrl: 'images/Rectangle 383.png',
        productName: 'Organic tattva\nOrganic Wheat flour',
        price: 200,
        quantity: 0),
    ProductDetails(
        imageUrl: 'images/Rectangle 384.png',
        productName: 'Apple (pack of 4)',
        price: 75,
        quantity: 0),
    ProductDetails(
        imageUrl: 'images/Rectangle 385.png',
        productName: 'Egg (1 dozen)',
        price: 72,
        quantity: 0)
  ];
}
