import 'dart:ffi';

class Product {
  final String id;
  final String pTitle;
  final String pImage;
  final String type;
  final String price;

  const Product(
      {required this.id,
      required this.pTitle,
      required this.pImage,
      required this.type,
      required this.price});
}
