import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/models/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<AppEvent, AppState> {
  CartBloc() : super(LoadingState()){
    on<GetDataEvent>(getCartItems);
    on<AddEvent>(increaseItemQuantity);
    on<RemoveEvent>(decreaseItemQuantity);
    add(GetDataEvent());
  }

  //======================================
  //====================================== Variables
  //======================================
  List<MealModel> cartItemsList = [];

  //======================================
  //====================================== Functions
  //======================================
  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        return List.generate(
          10,
          (index) => MealModel(
            id: index,
            name: 'Meal $index',
            price: 10.0 * (index + 1),
            image: 'assets/images/meal_placeholder.png',
            description: 'This is a description for meal $index',
          ),
        );
      },
    );
  }
  void _increaseItemQuantity(int id) {
    for(var item in cartItemsList){
      if(item.id == id){
        item.quantity++;
        break;
      }
    }
  }
  void _decreaseItemQuantity(int id) {
    for(var item in cartItemsList){
      if(item.id == id){
        item.quantity--;
        break;
      }
    }
  }
  //======================================
  //====================================== Events
  //======================================
  getCartItems(GetDataEvent event,Emitter emit) async{
    emit(LoadingState());
    try{
      cartItemsList = await _requestCartItems();
      if(cartItemsList.isNotEmpty){
        emit(LoadedState(cartItemsList));}
      else{
        emit(EmptyState());
      }
    }
    catch(e){
      emit(ErrorState(e.toString()));
    }
  }
  increaseItemQuantity(AddEvent event,Emitter emit){
    int id = event.data;
    _increaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }
  decreaseItemQuantity(RemoveEvent event,Emitter emit){
    int id = event.data;
    _decreaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }
}
