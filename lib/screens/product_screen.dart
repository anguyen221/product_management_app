import 'package:flutter/material.dart';
import 'package:product_management_app/models/product.dart';
import 'package:product_management_app/services/product_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductService _productService = ProductService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> _addOrUpdateProduct([Product? product]) async {
    String action = 'create';
    if (product != null) {
      action = 'update';
      _nameController.text = product.name;
      _priceController.text = product.price.toString();
    }

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(action == 'create' ? 'Add Product' : 'Update Product'),
                onPressed: () async {
                  String name = _nameController.text;
                  double price = double.parse(_priceController.text);

                  if (name.isNotEmpty && price > 0) {
                    if (action == 'create') {
                      await _productService.addProduct(Product(id: '', name: name, price: price));
                    } else if (action == 'update' && product != null) {
                      await _productService.updateProduct(Product(id: product.id, name: name, price: price));
                    }
                    _nameController.clear();
                    _priceController.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteProduct(String productId) async {
    await _productService.deleteProduct(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Management App'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: _productService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _addOrUpdateProduct(product),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteProduct(product.id),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrUpdateProduct(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
