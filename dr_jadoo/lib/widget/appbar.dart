import 'package:dr_jadoo/constants/colours.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/assets.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          color: AppColors.white,
          child: const Image(
            image: AssetImage(Assets.jadooLogoSmall),
            height: 40,
          ),
        ),
      ],
    );
  }
}
