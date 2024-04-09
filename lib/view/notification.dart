import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/fire_controller.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/popupnotification.dart';

class NotificationScreen extends StatelessWidget {
  List<AddNewPost> post;
  NotificationScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        post.isEmpty
            ? Center(
                child: Text(
                  "No Data",
                  style: poppinStyle(letterSpacing: 1),
                ),
              )
            : SizedBox(
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
              title: "NOTIFICATION",
              fontsize: 29,
            ),
            SizedBox(
              height: height * .05,
            ),
            Consumer<Firecontroller>(builder: (context, fireController, child) {
              return FutureBuilder(
                  future: fireController.fetchPendingRequest(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text(
                          "Loading...",
                          style: poppinStyle(letterSpacing: 1, fontsize: 33),
                        ),
                      );
                    }
                    final request = fireController.pendingRequest;
                    return Expanded(
                      child: SizedBox(
                        width: width * .4,
                        // height: height * .7,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: MouseRegion(
                                  onExit: (event) {},
                                  // onEnter: (event) {
                                  //   Navigator.of(context).pop();
                                  // },
                                  onHover: (event) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Image.network(
                                            request[index].imageUrl,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: height * .1,
                                    width: width * .04,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            request[index].imageUrl,
                                          ),
                                        ), // color: DARK_BLUE_COLOR,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.elliptical(40, 50),
                                            bottomRight:
                                                Radius.elliptical(69, 90),
                                            topRight: Radius.elliptical(60, 30),
                                            bottomLeft:
                                                Radius.elliptical(60, 50))),
                                  ),
                                ),
                                title: FutureBuilder(
                                    future:
                                        fireController.fetchSelectedUserDetail(
                                            request[index].uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text("");
                                      }
                                      return RichText(
                                          text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: fireController
                                                  .selectedUserData!.name,
                                              style: normalStyle(
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: " is uploaded new place",
                                              style: normalStyle(
                                                  color: Colors.grey.shade400))
                                        ],
                                      ));
                                    }),
                                subtitle: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    button("Reject",
                                        const Color.fromARGB(255, 180, 19, 7),
                                        () {
                                      showconfirmation(
                                          context,
                                          "Make sure rejecting this post.Once the post  rejected,never can retrieve this post again ",
                                          "Reject",
                                          "Cancel", () {
                                        fireController.updateTheRequestStatus(
                                            request[index].placeId, "Rejected");
                                        Navigator.of(context).pop();
                                      }, () {
                                        Navigator.of(context).pop();
                                      });
                                    }),
                                    SizedBox(
                                      width: width * .01,
                                    ),
                                    button("Accept",
                                        const Color.fromARGB(255, 21, 169, 26),
                                        () {
                                      showconfirmation(
                                          context,
                                          "Make sure,before accepting request,this post is not encouraging eny violation",
                                          "Confirm",
                                          "Cancel", () {
                                        fireController.updateTheRequestStatus(
                                            request[index].placeId, "Approved");
                                        Navigator.of(context).pop();
                                      }, () {
                                        Navigator.of(context).pop();
                                      });
                                    }),
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
                            itemCount: request.length),
                      ),
                    );
                  });
            })
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
