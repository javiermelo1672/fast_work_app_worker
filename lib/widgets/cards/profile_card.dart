import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/widgets/indicators/star_Indicator.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String urlImage;
  final String name;
  final String description;
  ProfileCard(
      {@required this.urlImage,
      @required this.name,
      @required this.description});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: globalRadius,
      child: Container(
        height: 250,
        color: grey.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: grey,
              backgroundImage:
                  urlImage != null ? NetworkImage(urlImage) : NetworkImage(""),
              child: urlImage == null
                  ? Text(
                      name != null
                          ? name.substring(0, 2).toUpperCase()
                          : "JA".toUpperCase(),
                      style: TextStyle(
                          color: white,
                          fontSize: 40,
                          fontWeight: FontWeight.w800),
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name != null ? name.toUpperCase() : "JAVIER MELO",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: blackGlobal),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              description ??
                  "Trabajo en mis horas libres y genero ingresos en esta aplicación",
              style: TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            StarIndicator(
              rate: 5.0,
            )
          ],
        ),
      ),
    );
  }
}
