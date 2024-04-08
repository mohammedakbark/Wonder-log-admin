import 'package:flutter/material.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';

class AboutScreen extends StatelessWidget {
  List<AddNewPost> post;
  AboutScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: width * .3,
            child: HomeScreen(
              height: height * .3,
              width: width * .3,
              post: post,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text(
              title: "ABOUT",
              fontsize: 29,
            ),
            SizedBox(
              height: height * .05,
            ),
            Expanded(
              child: SizedBox(
                width: width * .4,
                // height: height * .7,
                child: SingleChildScrollView(
                  child: Text(
                    " Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,   Lorem ipsum dolor sit amet, con Lorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,   Lorem ipsum dolor sit amet, con Lorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,   Lorem ipsum dolor sit amet, conLorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,   Lorem ipsum dolor sit amet, conLorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,   Lorem ipsum dolor sit amet, conLorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,   Lorem ipsum dolor sit amet, con Lorem i",
                    style: poppinStyle(fontsize: 18),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
