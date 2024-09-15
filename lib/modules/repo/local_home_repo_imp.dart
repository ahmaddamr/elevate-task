import 'package:elevate_task/models/product_model.dart';
import 'package:flutter/widgets.dart';

import 'home_repo.dart';

class LocalHomeRepoImp implements HomeRepo {
  @override
  Future<List<ProductModel>> getData() {
    throw 'no connection';
  }
  
}