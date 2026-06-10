import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:itg_mobile_pertemuan_8/models/product.dart';

class ApiService {
  final String baseUrl = 'https://dummyjson.com';

  Future<List<Product>> getProducts(String category) async {
    final String url = category == 'all' 
    ? '$baseUrl/products?limit=20' 
    : '$baseUrl/products/category/$category';
    final response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List productsJson = data['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }
}
