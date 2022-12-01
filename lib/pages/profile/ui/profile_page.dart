import 'package:face_recognation/pages/profile/bloc/profile_bloc.dart';
import 'package:face_recognation/shared/constant/palette.dart';
import 'package:face_recognation/shared/constant/util.dart';
import 'package:face_recognation/shared/localization/language.dart';
import 'package:face_recognation/shared/widget/appbar/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(vsync: this, length: 2);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Palette.background,
          appBar: appBar(),
          body: Container(),
        );
      },
    );
  }

  AppBar appBar() {
    return baseAppBar(
      withIcon: false,
      withBackButton: false,
      title: Text(
        Language.of(context)!.profile,
        style: const TextStyle(
          fontSize: Util.fontSize16,
          color: Palette.white,
        ),
      ),
      actions: [],
    );
  }
}
