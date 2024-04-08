import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/fire_controller.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/singleplacedetailpage.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/ratingbar.dart';

class HomeScreen extends StatelessWidget {
  double width;
  double height;
  List<AddNewPost> post;
  HomeScreen(
      {super.key,
      required this.height,
      required this.width,
      required this.post});

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
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(post[index].imageUrl)),
                      color: GREY,
                      borderRadius: BorderRadius.circular(20)),
                  child: Consumer<Firecontroller>(
                      builder: (context, fireController, child) {
                    return FutureBuilder(
                        future: fireController
                            .fetchSelectedUserDetail(post[index].uid),
                        builder: (context, snapShot) {
                          if (snapShot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          }
                          final user = fireController.selectedUserData;
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: height * .1,
                                width: width * .06,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(user!
                                            .imageUrl)), // color: DARK_BLUE_COLOR,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(40, 50),
                                        bottomRight: Radius.elliptical(69, 90),
                                        topRight: Radius.elliptical(60, 30),
                                        bottomLeft: Radius.elliptical(60, 50))),
                              ),
                              Text(
                                user.name,
                                style: nunitoStyle(
                                    fontsize: 12, fontWeight: FontWeight.w600),
                              )
                            ],
                          );
                        });
                  }),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post[index].placeName,
                            style: poppinStyle(
                                fontWeight: FontWeight.w500, fontsize: 26),
                          ),
                          constRatingBar(post[index].rating, itemSize: 30)
                        ],
                      ),
                      Text(
                        post[index].placeDescription,
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
                                  builder: (context) => SingleDetailPage(
                                    addNewPost: post[index],
                                  ),
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
        itemCount: post.length);
  }
}
