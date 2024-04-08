import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/controller.dart';
import 'package:wanderlog_admin/model/new_post.dart';
import 'package:wanderlog_admin/util/colors.dart';
import 'package:wanderlog_admin/util/style.dart';
import 'package:wanderlog_admin/view/widgets/buttons.dart';
import 'package:wanderlog_admin/view/widgets/ratingbar.dart';

class SingleDetailPage extends StatefulWidget {
  AddNewPost addNewPost;
  SingleDetailPage({super.key, required this.addNewPost});

  @override
  State<SingleDetailPage> createState() => _SingleDetailPageState();
}

class _SingleDetailPageState extends State<SingleDetailPage>
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
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: navButton(
              icon: Icons.arrow_back_ios_new_rounded,
              hight: height * .05,
              width: width * .034,
              onTap: () {
                Navigator.of(context).pop();
              }),
        )),
        body: Column(
          children: [
            SizedBox(
              height: height * .15,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width * .3,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          width: width * .3,
                          height: height * .3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(widget.addNewPost.imageUrl)),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 30,
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
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.addNewPost.placeName,
                              style: poppinStyle(
                                  fontWeight: FontWeight.w500, fontsize: 26),
                            ),
                            constRatingBar(widget.addNewPost.rating,
                                itemSize: 30)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: width * .4,
                          // height: height * .7,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.addNewPost.placeDescription,
                              style: poppinStyle(fontsize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
