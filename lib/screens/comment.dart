import 'package:allenboots/main.dart';
import 'package:flutter/material.dart';

import '../core/model/appcolors.dart';
import '../core/model/appicons.dart';
import '../core/model/appstring.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.45,
        flexibleSpace: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppBar(
              toolbarHeight: 40,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyHomePage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.bgcolor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.iconlightpurple,
                  ),
                ),
              ),
              centerTitle: false,
              title: Text(
                AppString.appTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppColors.bgcolor),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            AppIcons.appTitleCover,
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 290),
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: BoxDecoration(
                color: AppColors.bgcolor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.fromLTRB(20.0, 15, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.appTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColors.placename),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppString.address,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColors.address),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppString.intro,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColors.intro),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Comments",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.intro,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  commentbox(
                      context, AppString.commentperson1, AppString.comment1),
                  const SizedBox(height: 2.5),
                  commentbox(
                      context, AppString.commentperson2, AppString.comment2),
                  const SizedBox(height: 2.5),
                  commentbox(
                      context, AppString.commentperson3, AppString.comment3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commentbox(BuildContext context, String name, String comment) {
    return
        // Container(
        //   color: Colors.pink,
        //   child:
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   color: Colors.grey,
        //   child:
        ListTile(
          minLeadingWidth: 14,
          contentPadding: const EdgeInsets.all(0),
          leading:
              // Container(
              //   color: Colors.green,
              //   child:
              Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.profile,
                    child: const Icon(Icons.person)),
              )
            ],
          ),
          // ),
          title:
              // Container(
              //   color: Colors.amber,
              //   child:
              SizedBox(
            height: 50,
            child: Card(
              margin: EdgeInsets.zero,
              borderOnForeground: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 12,
                                  color: AppColors.name,
                                  fontWeight: FontWeight.bold)),
                      Text(
                        comment,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 12, color: AppColors.comment),
                      )
                    ]),
              ),
            ),
          ),
        ),
        // ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.like,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 10.5, color: AppColors.reply),
            ),
            const SizedBox(width: 10),
            Text(AppString.reply,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 10.5, color: AppColors.reply))
          ],
        ),
      ],
      // ),
    );
  }
}
