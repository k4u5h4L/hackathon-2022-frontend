import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dr_jadoo/constants/assets.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:dr_jadoo/constants/strings.dart';
import 'package:dr_jadoo/model/Asset/asset_response.dart';
import 'package:dr_jadoo/model/User/current_user.dart';
import 'package:dr_jadoo/routes/router.gr.dart';
import 'package:dr_jadoo/services/assets_service.dart';
import 'package:dr_jadoo/widget/asset_card.dart';
import 'package:dr_jadoo/widget/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({super.key, this.user});
  final CurrentUser? user;
  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  List<AssetResponse> assets = [];
  @override
  void initState() {
    super.initState();
    initstate();
  }

  initstate() async {
    List<AssetResponse> _assets =
        await AssetService.instance.getCurrentOwnedAsset();
    setState(() {
      assets = _assets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.91,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DottedBorder(
                  borderType: BorderType.Circle,
                  radius: const Radius.circular(50),
                  padding: const EdgeInsets.all(6),
                  color: AppColors.primaryColor,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      height: 75,
                      width: 75,
                      color: AppColors.primaryColor,
                      child: Center(
                          child: Text(
                        '${widget.user!.username![0]}${widget.user!.username!.split(' ')[1][0]}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: AppColors.white),
                      )),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hi ${widget.user!.username} !',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: AppColors.black),
                      ),
                      Text(
                        AppStrings.employeeDashboardWelcome,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColors.grey),
                      ),
                    ])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (AssetResponse asset in assets)
                  AssetCard(
                    asset: asset,
                  ),
                GestureDetector(
                    onTap: () {},
                    child: const Image(
                        image: AssetImage(Assets.addNewAsset),
                        fit: BoxFit.cover,
                        height: 300))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TileCard(
                    backgroundImage: Assets.requestTab,
                    tileImage: Assets.request,
                    text: AppStrings.requests,
                    onTap: () {
                      AutoRouter.of(context)
                          .push(EmployeeDashboardRoute(selectedIndex: 1));
                    }),
                TileCard(
                    backgroundImage: Assets.timelineTab,
                    tileImage: Assets.timeline,
                    text: AppStrings.timeline,
                    onTap: () {
                      AutoRouter.of(context)
                          .push(EmployeeDashboardRoute(selectedIndex: 2));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
