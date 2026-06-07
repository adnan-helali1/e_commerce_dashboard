import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final List<double> data;
  final List<String> labels;
  final double maxY;
  final int divisions;

  const Square({
    super.key,
    required this.data,
    required this.labels,
    this.maxY = 100,
    this.divisions = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:250,
      width: 400,
      child: AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
      
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(divisions + 1, (i) {
                    return Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.3),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(data.length, (i) {
                    return Container(
                      width: 1,
                      height: height,
                      color: Colors.grey.withOpacity(0.2),
                    );
                  }),
                ),
                Positioned(
                  left: 5,
                  top: 0,
                  bottom: 0,
                  child: Container(width: 2, color: Colors.black),
                ),
                //X
                Positioned(
                  left: 8,
                  right: 0,
                  bottom: 0,
                  child: Container(height: 2, color: Colors.black),
                ),
      
                /////////////////////////////////////////////////////////////
                Positioned(
                  left: 8,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(data.length, (i) {
                      final barHeight = (data[i] / maxY) * height;
      
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: barHeight,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: List.generate(labels.length, (i) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            labels[i],
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
//مخطط توزيع مستخدمين يعني مخطط منحني
