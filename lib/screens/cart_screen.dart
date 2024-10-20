import 'package:diet_planner/blocs/cart_bloc.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../configuration/app_events.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is ErrorState){
            return Center(
              child: Text(state.message),
            );
          }
          else if(state is EmptyState){
            return Center(
              child: Text('No items in the cart'),
            );
          }
          else if(state is LoadedState) {
            List<MealModel> cartItemsList = state.data as List<MealModel>;
            return ListView.separated(
              itemBuilder: (context, index) => Container(
                child: Row(
                  children: [
                    Image.network(
                      "https://picsum.photos/200/300",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItemsList[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${cartItemsList[index].price}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context).add(AddEvent(cartItemsList[index].id));
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text('${cartItemsList[index].quantity}'),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context).add(RemoveEvent(cartItemsList[index].id));
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: cartItemsList.length
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
