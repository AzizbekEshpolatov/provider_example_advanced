import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../data/repository/product_repository.dart';

class ProductProvider with ChangeNotifier {
  /// provider bilan ishlaganimizda bizga change notifier kerak boladi.
  /// buning vazifasi asosan ozgarish bolganda xabar berishdan iborat.
  /// Biror o‘zgaruvchi o‘zgarsa, notifyListeners() metodini chaqirasiz.
  /// Bu chaqirilganda, kuzatayotgan barcha joylar xabardor bo‘ladi.
  /// notifyListeners()-chaqirishimiz shart bolmasa ozgarishni sezmaydi.

  final ProductRepository _productRepository;

  ProductProvider(this._productRepository);

  // loading xolati uchun ozgaruvchi olindi.
  bool _isLoading = false;

  // response-dan qaytgan elementlar.
  List<ProductModel> _products = [];

  // qanaqadur error xolati bolsa message qilib chiqarishimiz uchun.
  String _errorMessage = '';

  bool get isLoading => _isLoading;

  List<ProductModel> get products => _products;

  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await _productRepository.fetchProducts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// void qilib foydalanmasdan return qilmoqchi bolsak quyidagicha yozamiz.
/*
Future<List<ProductModel>> fetchProducts() async {
  _isLoading = true;
  notifyListeners();

  try {
    _products = await _productRepository.getProducts();
    _errorMessage = '';
  } catch (e) {
    _errorMessage = 'Failed to fetch products: $e';
  } finally {
    _isLoading = false;
    notifyListeners();
  }

  return _products; // Optional return
}

 */
