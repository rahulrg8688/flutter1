import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerItemWidget extends StatelessWidget {
  final String title;
 final Function()? onTap;
  const drawerItemWidget({super.key,this.title='',this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(onPressed:onTap!=null?onTap:null, child: Text(title)),
        Divider(),
      ],

    );
  }
}
