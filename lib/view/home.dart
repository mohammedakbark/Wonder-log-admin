import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/singleplacedetailpage.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/padding.dart';
import 'package:wanderlog_admin/view/widgets/ratingbar.dart';
import 'package:wanderlog_admin/view/navigation.dart';

class HomeScreen extends StatelessWidget {
  double width;
  double height;
  HomeScreen({super.key, required this.height, required this.width});

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
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://s3-alpha-sig.figma.com/img/9002/a10e/92afc22c4fb716d785abc2f63fd808a6?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YFsvQsggoNN5ZWRR1Zx6RRfJYru4m-B~bq3~3QTSR068ikBjwFLaiDi~OAVhM-qxEwQsaT9P2cjrVY~3ewqFDXqMijtpanjNprUiZUpVx5Bb7kIDgik8sQqg1TfoxAPl9JA~QAcD8Lc0HLVS74imRFFpFyS-5VPRwg8BUYNaRzZJtNO-g~oTTrvxjqB09rmstcpbuj3FSCwkLalhGlfHBXRaPcHQJUuP1a7vOXIlQBpqO~PFS-ok7zjtIbyG0S1k33E1cQF4Zc~6RIFR0TkgkaK9ICyICCsjed~FYqDyj06m1gUmO5xPSPRalVJR48e3NY0AY1jaBxDyoYJ5JTBGTQ__")),
                            // color: DARK_BLUE_COLOR,
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
        itemCount: 10);
  }
}
