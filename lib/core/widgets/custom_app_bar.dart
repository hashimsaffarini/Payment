import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/app_images.dart';
import 'package:payment/core/utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        Assets.imagesArrow,
      ),
    ),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: Styles.style25,
      textAlign: TextAlign.center,
    ),
  );
}
