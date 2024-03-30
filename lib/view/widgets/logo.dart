import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';

Column appLogo(
  double aspectration,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 3,
              child: Image.asset(
                scale: aspectration * .17,
                "assets/logolayer1.png",
              )),
          Positioned(
              child: Image.asset(
            scale: aspectration * .17,
            "assets/logolayer2.png",
            color: WHITE,
          )),
        ],
      ),
      Text(
        "Wander  Log",
        style: poppinStyle(
            color: WHITE,
            letterSpacing: 28,
            fontsize: aspectration * 22,
            fontWeight: FontWeight.w500),
      )
    ],
  );
}
