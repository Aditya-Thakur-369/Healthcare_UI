// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';

import 'package:healthcare/common/color/app_color.dart';
import 'package:healthcare/features/detail/widget/master_painter.dart';
import 'package:healthcare/features/home/model/organModel.dart';

class DetailsScreen extends StatefulWidget {
  final OrganModel model;
  const DetailsScreen({
    super.key,
    required this.model,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double slider = 1.0;
  Color dominantColor = AppColors.blueColor;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(widget.model.imageUrl),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? dominantColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 150),
                tween: Tween<double>(begin: 0, end: ScreenUtil().screenWidth),
                builder: (BuildContext context, double? value, Widget? child) =>
                    AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: value,
                  height: 50.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(IconlyLight.arrowLeft)),
                      Flexible(
                        child: Text(
                          widget.model.name,
                          style: GoogleFonts.urbanist(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.qr_code,
                              color: dominantColor,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  CustomPaint(
                    painter:
                        MasterPainter(color: dominantColor.withOpacity(slider)),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: ScreenUtil().screenHeight / 2,
                      width: ScreenUtil().screenWidth * 0.8,
                      child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 500),
                          tween: Tween<double>(begin: 0.1, end: 0.9),
                          builder: (BuildContext context, double value,
                                  Widget? child) =>
                              AnimatedOpacity(
                                  // opacity: slider == 1.0 ? value : slider,
                                  opacity: value,
                                  duration: const Duration(milliseconds: 500),
                                  child: Image.asset(widget.model.imageUrl))),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().screenHeight / 2 - 100,
                    width: ScreenUtil().screenWidth * 0.13,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Slider(
                        activeColor: dominantColor,
                        value: slider,
                        onChanged: (value) {
                          setState(() {
                            slider = value;
                            log(slider.toString());
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Your Condition",
                style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.model.conditions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CustomOrganTile(
                      model: widget.model.conditions[index],
                      dominantColor: dominantColor,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomOrganTile extends StatefulWidget {
  final ListModel model;
  Color dominantColor;
  CustomOrganTile({
    super.key,
    required this.model,
    required this.dominantColor,
  });

  @override
  State<CustomOrganTile> createState() => _CustomOrganTileState();
}

class _CustomOrganTileState extends State<CustomOrganTile> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flag = !flag;
        });
      },
      child: AnimatedContainer(
        width: ScreenUtil().scaleWidth,
        duration: const Duration(milliseconds: 250),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.h),
                  color: flag ? widget.dominantColor.withOpacity(0.4) : null),
              child: Center(
                child: Icon(
                  widget.model.icon,
                  color: flag ? Colors.white : null,
                  size: 40.sp,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.model.name,
                  style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600)),
                ),
                Text(
                  widget.model.value,
                  style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: flag ? widget.dominantColor : Colors.grey,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            const Spacer(),
            flag
                ? TweenAnimationBuilder<double>(
                    builder:
                        (BuildContext context, double? value, Widget? child) =>
                            Image.asset(
                      "assets/images/main_graph.png",
                      height: value,
                      width: 60.w,
                      color: widget.dominantColor,
                    ),
                    tween: Tween(begin: 1, end: 30),
                    duration: const Duration(milliseconds: 350),
                  )
                : const SizedBox.shrink(),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              height: 35.h,
              width: 90.w,
              child: CupertinoButton(
                  borderRadius: BorderRadius.circular(30),
                  padding: const EdgeInsets.all(2),
                  color: flag ? Colors.blue.withOpacity(0.15) : null,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      flag
                          ? Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.dominantColor),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "New",
                        style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: flag
                                    ? widget.dominantColor
                                    : Colors.grey.shade600,
                                fontWeight: FontWeight.w600)),
                      ),
                      const Spacer()
                    ],
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
