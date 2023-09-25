import 'package:alowin_mini/data/model/product/product_model.dart';
import 'package:alowin_mini/routes/screen_arguments.dart';
import 'package:flutter/material.dart';

class BlinkAnimation extends StatefulWidget {
  const BlinkAnimation({super.key, required this.data});

  final ScreenArguments data;

  @override
  _BlinkAnimationState createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends State<BlinkAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController controller;
  DataProductModel? dataProductModel;

  @override
  initState() {
    super.initState();
    dataProductModel = widget.data.arg1;
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    final CurvedAnimation curve =
    CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.white, end: Colors.orange[100]).animate(curve);
    // Keep the animation going forever once it is started
    animation.addStatusListener((status) {
      // Reverse the animation after it has been completed
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      setState(() {});
    });
    // Remove this line if you want to start the animation later
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: dataProductModel!.productItem!.isNotEmpty,
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: animation.value,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${dataProductModel?.productItem?[0].skuName}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SKU: ${dataProductModel?.productItem?[0].sku}'),
                      Text('Vị trí: ${dataProductModel?.productItem?[0].location}'),
                      Text('SL: ${dataProductModel?.productItem?[0].pickQty}'),
                    ],
                  )
                ],
              )
          );
        },
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}