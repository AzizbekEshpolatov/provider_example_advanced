import '../models/product_model.dart';
import '../services/product_api.dart';

class ProductRepository {
  final ProductApi productApi;

  ProductRepository(this.productApi);

  Future<List<ProductModel>> fetchProducts() async {
    return await productApi.fetchProducts();
  }
}
