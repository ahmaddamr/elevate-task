// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:elevate_task/models/product_model.dart';
import 'package:elevate_task/modules/repo/home_repo.dart';
import 'package:elevate_task/modules/repo/local_home_repo_imp.dart';
import 'package:elevate_task/modules/repo/remote_home_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ProductModel> data = [];
  late HomeRepo homeRepo;
  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> cubitData() async {
    emit(HomeLoadingState());
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      homeRepo = RemoteHomeRepoImp();
      print('Device is connected to the internet');
    } else {
      homeRepo = LocalHomeRepoImp();
      print('Device is not connected to the internet');
    }
    try {
      data = await homeRepo.getData();
      // data = productModel;
      emit(HomeSuccessState());
    } on Exception catch (e) {
      emit(
        HomeErrorState(
          error: e.toString(),
        ),
      );
    }
  }
}
// Uri uri = Uri.parse('https://fakestoreapi.com/products');
//       http.Response response = await http.get(uri);
//       var json = jsonDecode(response.body) as List;
//       log(response.body);
//       // productModel = ProductModel.fromJson(json);
//       // print(productModel?.image);
//       if (response.statusCode != 200) {
//         emit(HomeErrorState(error: 'error in response'));
//       } else {
//         data = json.map((e) => ProductModel.fromJson(e)).toList();
//         emit(HomeSuccessState());
//       }
