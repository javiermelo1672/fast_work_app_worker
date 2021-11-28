import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {
  final String title;
  final String image;
  final String content;
  final String subsubtitle;
  final String state;
  final String avatarPicture;
  OrdersCard(
      {@required this.image,
      @required this.title,
      @required this.content,
      @required this.subsubtitle,
      @required this.state,
      @required this.avatarPicture});
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: globalRadius,
      child: Container(
        height: 140,
        color: grey.withOpacity(0.1),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: globalRadius,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image ??
                              "https://www.exoticca.com/es/blog/wp-content/uploads/2019/07/Los-15-mejores-lugares-de-Am%C3%A9rica-del-Sur-para-ir-de-vacaciones.jpg"))),
                ),
              ),
              Spacer(),
              _createColumn(_size),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

//Creating Column For the card
  SizedBox _createColumn(Size size) {
    return SizedBox(
      width: size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.03,
            child: Text(
              title ?? "Texto de ejemplo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: size.height * 0.04,
            child: Container(
              child: Text(
                content ??
                    "Esto es un texto largo que representa un párrafo largo",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subsubtitle ?? "45 MIN",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          _createRowAvatar()
        ],
      ),
    );
  }

  //Create row Avatar

  Row _createRowAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          state != null
              ? state == "created"
                  ? "Por Completar"
                  : "Completado"
              : "Por Completar".toUpperCase(),
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        avatarPicture != null && avatarPicture != ""
            ? Container(
                height: 35,
                child:
                    CircleAvatar(backgroundImage: NetworkImage(avatarPicture)),
              )
            : SizedBox(),
      ],
    );
  }
}
