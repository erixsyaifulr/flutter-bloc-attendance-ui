import 'package:face_recognation/pages/attendance/bloc/attendance_bloc.dart';
import 'package:face_recognation/pages/attendance/ui/attendance_page.dart';
import 'package:face_recognation/pages/home/bloc/home_bloc.dart';
import 'package:face_recognation/pages/home/ui/home_page.dart';
import 'package:face_recognation/pages/main/bloc/main_bloc.dart';
import 'package:face_recognation/pages/profile/bloc/profile_bloc.dart';
import 'package:face_recognation/pages/profile/ui/profile_page.dart';
import 'package:face_recognation/shared/constant/assets.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/localization/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      body: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SecondPageLoaded) {
            return BlocProvider(
              create: (context) => AttendanceBloc()..add(AttendanceStart()),
              child: const AttendancePage(),
            );
          }
          if (state is ThirdPageLoaded) {
            return BlocProvider(
              create: (context) => ProfileBloc()..add(ProfileStart()),
              child: const ProfilePage(),
            );
          }

          // Default page
          return BlocProvider(
            create: (context) => HomeBloc()..add(HomeStart()),
            child: const HomePage(),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return bottomNavigationBar(context, mainBloc);
        },
      ),
    );
  }

  Widget bottomNavigationBar(
    BuildContext context,
    MainBloc mainBloc,
  ) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        unselectedItemColor: Palette.grey,
        selectedItemColor: Palette.primaryDark,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.white,
        currentIndex: mainBloc.currentIndex,
        onTap: (value) {
          mainBloc.add(MainChange(index: value));
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.icHome,
              width: Util.widthHeight25,
              color: mainBloc.currentIndex == 0
                  ? Palette.primaryDark
                  : Palette.grey,
            ),
            label: Language.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.icAttendance,
              width: Util.widthHeight25,
              color: mainBloc.currentIndex == 1
                  ? Palette.primaryDark
                  : Palette.grey,
            ),
            label: Language.of(context)!.attendance,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.icProfile,
              width: Util.widthHeight25,
              color: mainBloc.currentIndex == 2
                  ? Palette.primaryDark
                  : Palette.grey,
            ),
            label: Language.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
