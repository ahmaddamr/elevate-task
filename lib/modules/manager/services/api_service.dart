// ignore_for_file: avoid_print
import 'dart:convert';
import '../../../models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ProductModel>> getData() async {
    Uri uri = Uri.parse('https://fakestoreapi.com/products');
    http.Response response = await http.get(uri);
    var json = jsonDecode(response.body) as List<dynamic>;
    print('data is ${response.body}');
    List<ProductModel> products = json.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    return products;
  }
}
