import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigContainer extends StatelessWidget {
  final List<Widget> children;
  final double width;
  final double height;
  final Color? colorcontainer;
  const BigContainer({super.key, 
  required this.children,
  required this.height,
  required this.width,
  required this.colorcontainer,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorcontainer ?? Colors.grey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Column(
        // wa2t bedna n7ot el column  in scroll we need main axis aligment  start
        //  mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
//الصندوق الكبير اللي حوافو منحنية و هو رمادي