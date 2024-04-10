import 'package:flutter/material.dart';
 import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final Widget content;
  const ShimmerLoader({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFFCCCCCC).withOpacity(.3),
      highlightColor: Colors.grey.withOpacity(0.1),
      direction: ShimmerDirection.ltr,
      child: content,
    );
  }
}
