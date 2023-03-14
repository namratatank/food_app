import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/widgets/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CartScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: MyColor.bgLightColor,
      appBar: const CustomAppbar(
        title: "Saved Addresses",

      ),
      body: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IntrinsicWidth(
          child: Column(
            children: [
              // title
              Text(
                'textjghjnghfjhjhhjhj',
               // style: baseStyle,
              ),

              // underline
              Container(
                height: 4,
               // width: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
                // hacky
                // child: Text(
                //   title,
                //   style: baseStyle,
                // ),
              ),
            ],
          ),
        ),
      ],
    ),

    );
  }
}
