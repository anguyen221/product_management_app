import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_management_app/models/product.dart';

class ProductService {
  final CollectionReference _products = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) async {
    await _products.add({
      'name': product.name,
      'price': product.price,
    });
  }

  Stream<List<Product>> getProducts() {
    return _products.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product(
          id: doc.id,
          name: doc['name'],
          price: doc['price'].toDouble(),
        );
      }).toList();
    });
  }

  Future<void> updateProduct(Product product) async {
    await _products.doc(product.id).update({
      'name': product.name,
      'price': product.price,
    });
  }

  Future<void> deleteProduct(String productId) async {
    await _products.doc(productId).delete();
  }
}
