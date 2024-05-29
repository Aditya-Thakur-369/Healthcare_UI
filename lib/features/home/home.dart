// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:healthcare/common/color/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/human_profile.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning",
                        style: GoogleFonts.montserratAlternates(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        "Reze",
                        style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(IconlyLight.notification),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How Are You",
                      style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                              fontSize: 46, fontWeight: FontWeight.w500))),
                  Text("Feeling Today?",
                      style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                              fontSize: 46, fontWeight: FontWeight.w500)))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().screenWidth / 2 - 40,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(30),
                        child: Row(
                          children: [
                            const Icon(
                              IconlyBroken.heart,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "Checkup",
                              style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300)),
                            )
                          ],
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: ScreenUtil().screenWidth / 2 - 40,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(30),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.messages_14,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "Consult  ",
                              style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300)),
                            )
                          ],
                        ),
                        onPressed: () {}),
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        tap = true;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        tap = false;
                      });
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.blueColor),
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(tap ? 10 : 12.0),
                          child: const RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                IconlyBroken.call,
                                color: Colors.white,
                                size: 26,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Condition",
                    style: GoogleFonts.urbanist(
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 90.w,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(30),
                        padding: const EdgeInsets.all(2),
                        color: Colors.blue.withOpacity(0.15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.blueColor),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Health",
                              style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.blueColor,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Spacer()
                          ],
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 420,
                width: 420,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: img.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var data = img[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                          onTap: () {
                            // context.go(Routes.detailsscreen.path);
                          },
                          child: CustomCard(
                            img: data,
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> img = [
    'assets/images/brain.png',
    'assets/images/heart.png',
    'assets/images/kidney.png',
    'assets/images/liver.png',
  ];
}

class CustomCard extends StatefulWidget {
  String img;
  CustomCard({
    super.key,
    required this.img,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool flag = false;
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flag = !flag;
          // Timer.periodic(const Duration(seconds: 3), (timer) {
          //   setState(() {
          //     flag = false;
          //   });
          // });
        });
      },
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey.withOpacity(0.1),
                Colors.grey.withOpacity(0.25)
              ]),
              borderRadius: BorderRadius.circular(30.h)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.contain,
                ),
              ),
              flag
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: 60),
                            duration: const Duration(milliseconds: 200),
                            builder: (BuildContext context, double value,
                                    Widget? child) =>
                                AnimatedContainer(
                              height: value,
                              decoration: const BoxDecoration(
                                border: BorderDirectional(
                                  top: BorderSide(color: Colors.white),
                                ),
                              ),
                              duration: const Duration(milliseconds: 200),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Text(
                                    "My Heart",
                                    style: GoogleFonts.urbanist(
                                        textStyle: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTapDown: (details) {
                                      setState(() {
                                        tap = true;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        tap = false;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.blueColor),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(tap ? 8 : 10.0),
                                          child: Transform(
                                            alignment: FractionalOffset.center,
                                            transform: Matrix4.identity()
                                              ..rotateZ(12 * 3.1415927 / -80),
                                            child: const Icon(
                                              // IconlyBroken.arrowUp2,
                                              Iconsax.arrow_right_1,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  : Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 60, end: 0),
                        duration: const Duration(milliseconds: 200),
                        builder: (BuildContext context, double value,
                                Widget? child) =>
                            AnimatedContainer(
                          height: value,
                          decoration: const BoxDecoration(
                            border: BorderDirectional(
                              top: BorderSide(color: Colors.white),
                            ),
                          ),
                          duration: const Duration(milliseconds: 200),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Text(
                                "My Heart",
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTapDown: (details) {
                                  setState(() {
                                    tap = true;
                                  });
                                },
                                onTapUp: (details) {
                                  setState(() {
                                    tap = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.blueColor),
                                  duration: const Duration(milliseconds: 300),
                                  child: Padding(
                                    padding: EdgeInsets.all(tap ? 8 : 10.0),
                                    child: Transform(
                                      alignment: FractionalOffset.center,
                                      transform: Matrix4.identity()
                                        ..rotateZ(12 * 3.1415927 / -80),
                                      child: const Icon(
                                        // IconlyBroken.arrowUp2,
                                        Iconsax.arrow_right_1,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
            ],
          )),
    );
  }
}
