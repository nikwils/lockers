import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherWidget extends StatelessWidget {
  final String assetName;
  const OtherWidget({
    Key? key,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        assetName,
        colorFilter: const ColorFilter.mode(Color.fromRGBO(35, 56, 51, 1), BlendMode.srcIn),
      ),
    );
  }
}
