import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ldp_prediction/components/shimmer_loader_widget.dart';
  
class CustomNetworkImageSqr extends StatelessWidget {
  const CustomNetworkImageSqr({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // image: DecorationImage(
        //     image: AssetImage('assets/images/accountOwner.png'))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => ShimmerLoader(
              content: Container(
            height: height,
            width: width,
            color: Colors.white,
          )),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
