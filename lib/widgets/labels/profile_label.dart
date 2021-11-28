import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class ProfileWelcomeLabel extends StatelessWidget {
  final String name;
  final String urlImage;
  ProfileWelcomeLabel({@required this.name, @required this.urlImage});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola!,",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              name != null ? name.toUpperCase() : "Javier".toUpperCase(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            )
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: grey,
          backgroundImage:
              urlImage != null ? NetworkImage(urlImage) : NetworkImage(""),
          child: urlImage == null
              ? Text(
                  name != null
                      ? name.substring(0, 2).toUpperCase()
                      : "JA".toUpperCase(),
                  style: TextStyle(
                      color: white, fontSize: 20, fontWeight: FontWeight.w800),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
