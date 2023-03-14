import 'package:flutter/material.dart';
import 'package:food_app/models/models.dart';
import 'package:food_app/screens/basket_screen.dart';
import 'package:food_app/screens/cart_screen.dart';
import 'package:food_app/screens/checkout_screen.dart';
import 'package:food_app/screens/delivery_time_screen.dart';
import 'package:food_app/screens/edit_basket_screen.dart';
import 'package:food_app/screens/filter_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/location_screen.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/profile_screen.dart';
import 'package:food_app/screens/restaurant_detail_screen.dart';
import 'package:food_app/screens/restaurant_list_screen.dart';
import 'package:food_app/screens/screens.dart';
import 'package:food_app/screens/signup.dart';
import 'package:food_app/screens/splash_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('The route is: ${settings.name}');

    switch(settings.name){
      case '/':
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CheckOutScreen.routeName:
        return CheckOutScreen.route();
      case RestaurantDetailScreen.routeName:
        return RestaurantDetailScreen.route(restaurantModel: settings.arguments as RestaurantModel);
      case RestaurantListScreen.routeName:
        return RestaurantListScreen.route(restaurantModel: settings.arguments as List<RestaurantModel>);
      case FilterScreen.routeName:
        return FilterScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),),),
      settings: RouteSettings(name: '/error'),
    );
  }
}