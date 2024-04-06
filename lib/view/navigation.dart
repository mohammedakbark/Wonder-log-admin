import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/controller.dart';
import 'package:wanderlog_admin/controller/fire_controller.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/notification.dart';

import 'package:wanderlog_admin/view/about.dart';

import 'package:wanderlog_admin/view/users.dart';

import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/padding.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final controller = Provider.of<Controller>(context);
    return Scaffold(
      body: Consumer<Firecontroller>(builder: (context, fireController, child) {
        return FutureBuilder(
            future: fireController.fetchApprovedPost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    "No Data",
                    style: poppinStyle(letterSpacing: 1),
                  ),
                );
              }
              final data = fireController.listOfPost;
              return data.isEmpty
                  ? Center(
                      child: Text(
                        "No Data",
                        style: poppinStyle(letterSpacing: 1),
                      ),
                    )
                  : CustomePadding(
                      child: DefaultTabController(
                        // animationDuration: Duration(microseconds: 100),
                        length: 4,
                        child: Column(
                          children: [
                            SizedBox(
                                width: width,
                                height: 70,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: FadeTransition(
                                        opacity: _animation,
                                        child: TabBar(
                                            overlayColor:
                                                const MaterialStatePropertyAll(
                                                    Colors.transparent),
                                            indicatorColor: DARK_BLUE_COLOR,
                                            dividerColor: Colors.transparent,
                                            tabs: [
                                              Tab(
                                                child: text(title: "HOME"),
                                              ),
                                              Tab(
                                                child:
                                                    text(title: "NOTIFICATION"),
                                              ),
                                              Tab(
                                                child: text(title: "USERS"),
                                              ),
                                              Tab(
                                                child: text(title: "ABOUT"),
                                              )
                                            ]),
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: FadeTransition(
                                    //     opacity: _animation,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.only(left: 100, right: 100),
                                    //       child: Row(
                                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //         children: [
                                    //           textButton(onPressed: () {}, title: "HOME"),
                                    //           textButton(onPressed: () {}, title: "NOTIFICATION"),
                                    //           textButton(onPressed: () {}, title: "USERS"),
                                    //           textButton(onPressed: () {}, title: "ABOUT")
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    IconButton(
                                        onPressed: () {
                                          controller.isButtonClicked();
                                          if (controller.isVisible) {
                                            _controller.forward();
                                          } else {
                                            _controller.reverse();
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.sort_sharp,
                                          color: DARK_BLUE_COLOR,
                                          size: 33,
                                        )),
                                  ],
                                )),
                            SizedBox(
                              height: height * .1,
                            ),
                            Expanded(
                                child: TabBarView(children: [
                              HomeScreen(
                                list: data,
                                height: height * .7,
                                width: width * .7,
                              ),
                              NotificationScreen(),
                              UsersScreen(),
                              AboutScreen()
                            ]))
                          ],
                        ),
                      ),
                    );
            });
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
