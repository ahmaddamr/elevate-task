import '../../models/product_model.dart';

abstract class HomeRepo {
  Future<List<ProductModel>> getData();
}
