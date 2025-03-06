import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppbar({Key? key, this.title, this.hideBack = false, this.action}) : super(key: key);
  final Widget ? title;
  final bool hideBack;
  final Widget ? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(''),
      actions: [action ?? Container()],
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: hideBack ? null : IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.03),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
