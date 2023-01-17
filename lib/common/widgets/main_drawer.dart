import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants/assets_path.dart';

class MainDrawer extends StatelessWidget {
  final Function onPressed;

  const MainDrawer({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColorLight,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70.0),
                      child: SvgPicture.asset(AppAssets.dummyAvatar),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).username,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                onPressed();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
