import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: width * .3,
            child: HomeScreen(height: height * .3, width: width * .3,list: [],)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text(
              title: "NOTIFICATION",
              fontsize: 29,
            ),
            SizedBox(
              height: height * .05,
            ),
            Expanded(
              child: SizedBox(
                width: width * .4,
                // height: height * .7,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Container(
                            height: height * .1,
                            width: width * .04,
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
                        title: Text(
                          "is uploaded new place",
                          style: normalStyle(),
                        ),
                        subtitle: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            button("Reject", Color.fromARGB(255, 180, 19, 7),
                                () {}),
                            SizedBox(
                              width: width * .01,
                            ),
                            button("Accept",
                                const Color.fromARGB(255, 21, 169, 26), () {}),
                          ],
                        ),
                      );
                      // return Container(
                      //   color: Colors.green,
                      //   width: width,
                      //   height: height * .1,

                      // );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: height * .06,
                        ),
                    itemCount: 10),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget button(String title, Color bgColor, void Function()? onPressed) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(
          title,
          style: normalStyle(color: WHITE),
        ));
  }
}
