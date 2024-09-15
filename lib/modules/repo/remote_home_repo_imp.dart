import 'package:elevate_task/models/product_model.dart';
import 'package:elevate_task/modules/manager/services/api_service.dart';
import 'package:elevate_task/modules/repo/home_repo.dart';

class RemoteHomeRepoImp implements HomeRepo {
  @override
  Future<List<ProductModel>> getData() {
    return ApiService().getData();
  }
}
