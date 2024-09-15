import 'package:elevate_task/core/shared/widgets/product_item.dart';
import 'package:elevate_task/modules/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..cubitData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is HomeErrorState) {
            Center(child: Text(state.error.toString()));
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: GridView.builder(
              itemCount: cubit.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductItem(
                    img: cubit.data[index].image,
                    name: cubit.data[index].title,
                    desc: cubit.data[index].description,
                    price: cubit.data[index].price.toString(),
                    rate: cubit.data[index].rating.rate.toString(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
