import 'package:dotted_border/dotted_border.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:dr_jadoo/constants/strings.dart';
import 'package:dr_jadoo/model/User/current_user.dart';
import 'package:dr_jadoo/screens/employee_dashboard/pages/asset_page.dart';
import 'package:dr_jadoo/screens/employee_dashboard/pages/insights_page.dart';
import 'package:dr_jadoo/screens/employee_dashboard/pages/request_page.dart';
import 'package:dr_jadoo/screens/employee_dashboard/pages/timeline_page.dart';
import 'package:dr_jadoo/widget/tile_card.dart';
import 'package:dr_jadoo/services/employee_dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:dr_jadoo/constants/assets.dart';
import 'package:dr_jadoo/widget/asset_card.dart';

class EmployeeDashboardScreen extends StatefulWidget {
  EmployeeDashboardScreen({Key? key, this.selectedIndex = 0}) : super(key: key);
  int selectedIndex;
  @override
  State<EmployeeDashboardScreen> createState() =>
      _EmployeeDashboardScreenState();
}

class _EmployeeDashboardScreenState extends State<EmployeeDashboardScreen> {
  CurrentUser? user;
  Widget? currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initstate();
  }

  void initstate() async {
    final CurrentUser? _user =
        await EmployeeDashboardService.instance.getCurrentUser();
    setState(() {
      user = _user;
    });

    getCurrentPage(widget.selectedIndex);
  }

  void getCurrentPage(int selectedIndex) {
    Widget _currentPage = const CircularProgressIndicator(
      color: AppColors.primaryColor,
    );
    switch (selectedIndex) {
      case 0:
        _currentPage = AssetPage(user: user);
        break;
      case 1:
        _currentPage = const RequestPage();
        break;
      case 2:
        _currentPage = const TimelinePage();
        break;
      case 3:
        _currentPage = const InsightsPage();
        break;
    }
    setState(() {
      widget.selectedIndex = selectedIndex;
      currentPage = _currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 5.0,
            leadingWidth: 250.0,
            leading: Image.asset(Assets.jadooLogoSmall, fit: BoxFit.contain)),
        body: user != null
            ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.91,
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              SizedBox(
                                height: 80,
                                child: Column(
                                  children: [
                                    Text(
                                      user!.groups!
                                          .map((u) => u.name)
                                          .join("/n"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: AppColors.white),
                                    ),
                                    Text(
                                      user!.designation.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: AppColors.textColor),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Divider(
                                color: Colors.white,
                              ),
                              getDrawerTile(
                                AppStrings.assets, 
                                Assets.asset, 
                                0,
                                () {
                                  getCurrentPage(0);
                                }),
                              const Divider(
                                color: Colors.white,
                              ),
                              getDrawerTile(
                                AppStrings.requests, 
                                Assets.request, 
                                1,
                                () {
                                  getCurrentPage(1);
                                }),
                              const Divider(
                                color: Colors.white,
                              ),
                              getDrawerTile(
                                AppStrings.timeline, 
                                Assets.timeline, 
                                2,
                                () {
                                  getCurrentPage(2);
                                }),
                              const Divider(
                                color: Colors.white,
                              ),
                              getDrawerTile(
                                AppStrings.insights, 
                                Assets.insights, 
                                3,
                                () {
                                  getCurrentPage(3);
                                }),
                              const Divider(
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      currentPage!
                    ],
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ));
  }

  Widget getDrawerTile(String title, String asset, int index, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(asset),
              height: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(color: index == widget.selectedIndex ? AppColors.primaryColor : AppColors.white, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
