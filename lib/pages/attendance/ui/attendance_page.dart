import 'package:face_recognation/pages/attendance/bloc/attendance_bloc.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/localization/language.dart';
import 'package:face_recognation/shared/widget/appbar/base_appbar.dart';
import 'package:face_recognation/shared/widget/custom_widget/custom_container.dart';
import 'package:face_recognation/shared/widget/tab/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => AttendancePageState();
}

class AttendancePageState extends State<AttendancePage>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(vsync: this, length: 3);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.background,
          appBar: appBar(),
          body: body(),
        );
      },
    );
  }

  AppBar appBar() {
    return baseAppBar(
      withIcon: false,
      withBackButton: false,
      backgroundColor: Palette.background,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Palette.background,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: Text(
        Language.of(context)!.attendance,
        style: const TextStyle(
          fontSize: Util.fontSize16,
          color: Palette.black,
        ),
      ),
      actions: [],
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(Util.defaultPadding),
      child: Column(
        children: [
          CustomTabBar(
            backgroundColor: Palette.background,
            borderColor: Palette.background,
            controller: controller,
            tabs: [
              Tab(text: Language.of(context)!.thisWeek),
              Tab(text: Language.of(context)!.thisMonth),
              Tab(text: Language.of(context)!.thisSemester),
            ],
          ),
          tabBody(),
        ],
      ),
    );
  }

  Widget tabBody() {
    return Expanded(
      child: CustomContainer(
        borderRadius: BorderRadius.zero,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        backgroundColor: Palette.background,
        borderColor: Palette.background,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            // This week attendance
            Container(),
            // This month attendance
            Container(),
            // This semester attendance
            Container(),
          ],
        ),
      ),
    );
  }
}
