import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/fire_controller.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/popupnotification.dart';

class UsersScreen extends StatelessWidget {
  List<AddNewPost> post;
  UsersScreen({super.key, required this.post});

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
              title: "USERS",
              fontsize: 29,
            ),
            SizedBox(
              height: height * .05,
            ),
            Consumer<Firecontroller>(builder: (context, fireController, child) {
              return FutureBuilder(
                  future: fireController.fetchAllUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text(
                          "Loading...",
                          style: poppinStyle(letterSpacing: 1, fontsize: 33),
                        ),
                      );
                    }
                    final userList = fireController.userList;
                    return Expanded(
                      child: SizedBox(
                        width: width * .4,
                        // height: height * .7,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: Container(
                                    height: height * .1,
                                    width: width * .04,
                                    decoration: BoxDecoration(
                                        image: userList[index].imageUrl.isEmpty
                                            ? const DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/noprofile.png"))
                                            : DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    userList[index].imageUrl)),
                                        // color: DARK_BLUE_COLOR,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.elliptical(40, 50),
                                            bottomRight:
                                                Radius.elliptical(69, 90),
                                            topRight: Radius.elliptical(60, 30),
                                            bottomLeft:
                                                Radius.elliptical(60, 50))),
                                  ),
                                  title: Text(
                                    userList[index].name,
                                    style: normalStyle(
                                        fontsize: 22, color: DARK_BLUE_COLOR),
                                  ),
                                  subtitle: Text(
                                    userList[index].description,
                                    style:
                                        normalStyle(fontsize: 17, color: GREY),
                                  ),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 180, 19, 7),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    onPressed: () {
                                      showconfirmation(
                                          context,
                                          "Do you want to delete this user credential forever?",
                                          "Yes",
                                          "No", () {
                                        fireController.deleteuserData(
                                            userList[index].uid);
                                        Navigator.of(context).pop();
                                      }, () {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text(
                                      "Delete",
                                      style: normalStyle(color: WHITE),
                                    ),
                                  ));
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: height * .06,
                                ),
                            itemCount: userList.length),
                      ),
                    );
                  });
            })
          ],
        )
      ],
    );
  }
}
