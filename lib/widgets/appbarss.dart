import 'package:flutter/material.dart';

import '../core/model/appcolors.dart';
import '../core/model/appstring.dart';

class AppBarss extends StatelessWidget {
  const AppBarss({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          width: 35,
          height: MediaQuery.of(context).size.height * 0.01,
          decoration: BoxDecoration(
              color: AppColors.bgcolor, borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.menu,
            color: AppColors.iconlightpurple,
          ),
        ),
        // flexibleSpace: Container(
        //   height: MediaQuery.of(context).size.height,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(AppIcons.appTitleCover),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        title: const Text(AppString.appTitle),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            width: 35,
            height: MediaQuery.of(context).size.height * 0.01,
            decoration: BoxDecoration(
                color: AppColors.bgcolor,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.add,
              color: AppColors.iconlightpurple,
            ),
          )
        ]);
  }
}
