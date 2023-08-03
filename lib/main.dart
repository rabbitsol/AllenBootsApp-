import 'package:allenboots/core/model/appcolors.dart';
import 'package:allenboots/core/model/appicons.dart';
import 'package:allenboots/core/model/appstring.dart';
import 'package:allenboots/screens/comment.dart';
import 'package:allenboots/screens/mapscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.iconpurple,
              ),
              bodyText1: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.transparent,
              titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.bgcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.3,
          flexibleSpace: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppIcons.appTitleCover),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: AppBar(
                toolbarHeight: 40,
                centerTitle: false,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CommentScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.bgcolor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.menu,
                      color: AppColors.iconlightpurple,
                    ),
                  ),
                ),
                title: Text(
                  AppString.appTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: AppColors.bgcolor),
                ),
                // ),
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 37,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.bgcolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.add,
                        color: AppColors.iconlightpurple,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: AppColors.bgcolor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(children: [
                // const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circleImage(Icons.fastfood, AppColors.iconlightpurple),
                    circleImage(Icons.shopping_bag, AppColors.iconpurple),
                    circleImage(Icons.account_balance_rounded,
                        AppColors.iconlightpurple),
                    circleImage(Icons.star_border_purple500_rounded,
                        AppColors.iconlightpurple),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MapScreen()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 2,
                            child: const MapScreen()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.placeTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: AppColors.placetitle,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900)),
                        const SizedBox(height: 15),
                        places(context, AppString.place1),
                        const SizedBox(height: 2),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: AppColors.placesnames,
                        ),
                        const SizedBox(height: 6),
                        places(context, AppString.place2),
                        const SizedBox(height: 2),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: AppColors.placesnames,
                        ),
                        const SizedBox(height: 6),
                        places(context, AppString.place3),
                        const SizedBox(height: 2),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: AppColors.placesnames,
                        ),
                        const SizedBox(height: 6),
                        places(context, AppString.place4),
                        const SizedBox(height: 25),
                      ]),
                ),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                AppIcons.boots,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                const SizedBox(height: 10)
              ]),
            ),
          ),
        ));
  }

  Widget circleImage(IconData iconss, Color colorss) {
    return CircleAvatar(
      backgroundColor: colorss,
      radius: 22,
      child: Icon(
        iconss,
        size: (24),
        color: AppColors.bgcolor,
      ),
    );
  }

  Widget places(BuildContext context, String name) {
    return Row(
      children: [
        Image.asset(
          AppIcons.location,
          height: 26,
        ),
        // size: 40,
        // color: AppColors.pointer,
        const SizedBox(width: 15),
        Text(name,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.placesnames, fontSize: 12)),
      ],
    );
  }
}
