import 'package:flutter/cupertino.dart';

class SectionViewWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final BuildContext context;

  SectionViewWidget(
      {Key key,
      @required this.title,
      @required this.content,
      @required this.context});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Container(height: size.height * 0.015),
        content
      ],
    );
  }
}
