import 'package:dr_jadoo/constants/assets.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:dr_jadoo/constants/strings.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final String backgroundImage;
  final String tileImage;
  final String text;
  final Function() onTap;

  const TileCard({super.key, required this.backgroundImage, required this.tileImage, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        width: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(color: AppColors.grey, blurRadius: 2.5)
            ]),
        child: Center(
            child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            tileImage,
            height: 25,
            width: 25,
          ),
          title: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: AppColors.black),
          ),
          trailing: Image.asset(
            Assets.arrowRight,
            height: 25,
            width: 25,
          ),
        )));
  }
}
