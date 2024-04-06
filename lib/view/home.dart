import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/singleplacedetailpage.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/padding.dart';
import 'package:wanderlog_admin/view/widgets/ratingbar.dart';
import 'package:wanderlog_admin/view/navigation.dart';

class HomeScreen extends StatelessWidget {
  double width;
  double height;
  List<AddNewPost> list;
  HomeScreen(
      {super.key,
      required this.height,
      required this.width,
      required this.list});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height * .1,
                        width: width * .06,
                        decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image: NetworkImage(list[index]
                            //         .imageUrl)), // color: DARK_BLUE_COLOR,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(40, 50),
                                bottomRight: Radius.elliptical(69, 90),
                                topRight: Radius.elliptical(60, 30),
                                bottomLeft: Radius.elliptical(60, 50))),
                      ),
                      Text(
                        "Lakshmi",
                        style: nunitoStyle(
                            fontsize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rome,Italy",
                            style: poppinStyle(
                                fontWeight: FontWeight.w500, fontsize: 26),
                          ),
                          constRatingBar(4, itemSize: 30)
                        ],
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,Lorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,  ",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: navButton(
                              iconSize: 15,
                              icon: Icons.arrow_forward_ios,
                              hight: height * .05,
                              width: width * .034,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SingleDetailPage(),
                                ));
                              })),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: height * .1,
            ),
        itemCount: list.length);
  }
}
