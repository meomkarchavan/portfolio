import 'package:flutter/material.dart';
import 'package:portfolio_app/presentation/constants.dart';
import 'package:portfolio_app/widgets/navList.dart';
import 'package:portfolio_app/widgets/nav_head.dart';
import 'package:portfolio_app/widgets/proflie_info.dart';
import 'package:portfolio_app/widgets/responsive_widget.dart';
import 'package:portfolio_app/widgets/social_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  changePage(BuildContext context, String route) {}

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.black,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: appBar('Omkar Chavan', true),
              )
            : null,
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: navButtons(context),
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(navButtons: navButtons(context)),
                  if (!ResponsiveWidget.isSmallScreen(context))
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ProfileInfo(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  SocialInfo(),
                  if (ResponsiveWidget.isSmallScreen(context))
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  if (ResponsiveWidget.isSmallScreen(context)) copyRightText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
