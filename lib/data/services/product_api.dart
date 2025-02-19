import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductApi {
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products')).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw SocketException('Internet connection timeout');
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List products = data['products'];
        return products.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw HttpException(
            'Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Xatolik: ${e.toString()}');
    }
  }
}
