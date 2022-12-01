import 'package:face_recognation/pages/home/bloc/home_bloc.dart';
import 'package:face_recognation/shared/constant/assets.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/helper/helper.dart';
import 'package:face_recognation/shared/localization/language.dart';
import 'package:face_recognation/shared/widget/appbar/base_appbar.dart';
import 'package:face_recognation/shared/widget/custom_widget/circle_container.dart';
import 'package:face_recognation/shared/widget/custom_widget/counter_container.dart';
import 'package:face_recognation/shared/widget/custom_widget/custom_container.dart';
import 'package:face_recognation/shared/widget/custom_widget/label_container.dart';
import 'package:face_recognation/shared/widget/tab/tab_bar.dart';
import 'package:face_recognation/shared/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(vsync: this, length: 2);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.background,
          appBar: appBar(),
          body: body(context),
        );
      },
    );
  }

  AppBar appBar() {
    return baseAppBar(
      withIcon: true,
      leadingIcon: Icons.list_alt_rounded,
      title: Text(
        idDateFormat.format(DateTime.now()),
        style: const TextStyle(
          fontSize: Util.fontSize16,
          color: Palette.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            size: Util.widthHeight25,
          ),
        )
      ],
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          absenceStatus(context),
          faceRecognation(),
          myAttendace(context),
        ],
      ),
    );
  }

  Widget header() {
    return CustomContainer(
      height: Util.widthHeight130,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Palette.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Util.defaultRadius),
          bottomRight: Radius.circular(Util.defaultRadius),
        ),
      ),

      // Header content
      child: CustomContainer(
        height: Util.widthHeight90,
        padding: const EdgeInsets.symmetric(
          horizontal: Util.defaultPadding,
        ),
        borderColor: Palette.white,
        backgroundColor: Palette.white,
        child: Row(
          children: [
            // User image
            const CircleAvatar(
              radius: Util.widthHeight30,
              backgroundImage: AssetImage(Assets.imgProfile),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Util.defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // User name
                    const Text(
                      "Erix Syaiful Rohman",
                      style: TextStyle(
                        fontSize: Util.fontSize18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: Util.widthHeight5),

                    // User job
                    Row(
                      children: const [
                        LabelContainer(
                          text: "IT Staff",
                        ),
                        LabelContainer(
                          text: "Mobile Developer",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget absenceStatus(BuildContext context) {
    return CustomContainer(
      backgroundColor: Palette.white,
      borderColor: Palette.softGrey,
      height: Util.widthHeight80,
      child: Row(
        children: [
          CustomContainer(
            borderRadius: BorderRadius.circular(Util.radius15),
            width: Util.widthHeight40,
            height: Util.widthHeight40,
            margin: const EdgeInsets.only(right: Util.widthHeight15),
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.check_circle,
              color: Palette.grey,
            ),
          ),
          Expanded(
            child: CustomText(
              text: Language.of(context)!.hasPresence,
            ),
          ),
        ],
      ),
    );
  }

  Widget faceRecognation() {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const CircleContainer(
                hasGradient: true,
                color: Palette.softGrey,
                width: Util.widthHeight170,
                height: Util.widthHeight170,
                beginColor: Palette.primarySoft1,
                endColor: Palette.primarySoft2,
              ),
              const CircleContainer(
                hasGradient: true,
                width: Util.widthHeight140,
                height: Util.widthHeight140,
                beginColor: Palette.primaryLight1,
                endColor: Palette.primaryLight2,
              ),
              CircleContainer(
                padding: const EdgeInsets.all(Util.widthHeight30),
                hasGradient: true,
                color: Palette.primaryLight2,
                width: Util.widthHeight110,
                height: Util.widthHeight110,
                child: Image.asset(Assets.imgFaceId),
              ),
            ],
          ),
          CustomText(
            text: Language.of(context)!.faceRecognition,
            fontSize: Util.fontSize20,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: Language.of(context)!.faceRecognitionDescription,
          ),
          // const SizedBox(height: Util.widthHeight15),
        ],
      ),
    );
  }

  Widget myAttendace(BuildContext context) {
    return CustomContainer(
      backgroundColor: Palette.white,
      borderColor: Palette.softGrey,
      height: Util.widthHeight165,
      child: Column(
        children: [
          CustomTabBar(
            controller: controller,
            tabs: [
              Tab(text: Language.of(context)!.thisWeek),
              Tab(text: Language.of(context)!.thisMonth),
            ],
          ),
          tabBody(),
        ],
      ),
    );
  }

  Widget tabBody() {
    return CustomContainer(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: Util.widthHeight90,
      backgroundColor: Palette.white,
      borderColor: Palette.white,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          // This week attendance
          Container(
            padding: const EdgeInsets.only(top: Util.defaultPadding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CounterContainer(
                    counter: "5",
                    label: Language.of(context)!.arrive,
                  ),
                  CounterContainer(
                    counter: "1",
                    label: Language.of(context)!.sick,
                  ),
                  CounterContainer(
                    counter: "0",
                    label: Language.of(context)!.leave,
                  ),
                  CounterContainer(
                    counter: "0",
                    label: Language.of(context)!.skip,
                  ),
                ],
              ),
            ),
          ),

          // This month attendance
          Container(
            padding: const EdgeInsets.only(top: Util.defaultPadding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CounterContainer(
                    counter: "20",
                    label: Language.of(context)!.arrive,
                  ),
                  CounterContainer(
                    counter: "1",
                    label: Language.of(context)!.sick,
                  ),
                  CounterContainer(
                    counter: "0",
                    label: Language.of(context)!.leave,
                  ),
                  CounterContainer(
                    counter: "1",
                    label: Language.of(context)!.skip,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
