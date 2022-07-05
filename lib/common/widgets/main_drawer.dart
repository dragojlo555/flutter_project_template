import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      child: SvgPicture.asset('assets/images/avatar_placeholder2.svg'),
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                  ),
                  const Text(
                    "Username",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
