import 'package:fast_work_app/models/works_ready_user.dart';
import 'package:fast_work_app/services/data_post_services.dart';
import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/utils/show_scaffold_message.dart';
import 'package:fast_work_app/widgets/buttons/button_riased_gradient_widget.dart';
import 'package:fast_work_app/widgets/cards/profile_card.dart';
import 'package:fast_work_app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class InfoWorkSheet extends StatefulWidget {
  final WorkReadyData workReadyData;
  final String type;
  InfoWorkSheet({@required this.workReadyData, @required this.type});
  @override
  _InfoWorkSheetState createState() => _InfoWorkSheetState();
}

/*
  The following allows to build the sheet of music when the user is able to launch
  a music app
 */
class _InfoWorkSheetState extends State<InfoWorkSheet> {
  @override
  void initState() {
    super.initState();
  }

  //build
  @override
  DataPostService _dataPostService = DataPostService();
  bool _loadPost = false;
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return _buildBody(context, size);
  }

//Body of the sheet
  Widget _buildBody(BuildContext context, Size size) {
    return SizedBox.expand(
      child: Container(
        //decoration: BoxDecoration(borderRadius: ),
        child: StatefulBuilder(builder: (BuildContext context, setStateBottom) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                globalSizedbox,
                ClipRRect(
                  borderRadius: globalRadius,
                  child: Container(
                    width: 90,
                    height: 5,
                    color: grey,
                  ),
                ),
                globalSizedbox,
                ProfileCard(
                  name: widget.workReadyData.data.userInfo.name,
                  urlImage: widget.workReadyData.data.userInfo.profilePhoto,
                  description: widget.workReadyData.data.description,
                ),
                globalSizedbox,
                Container(
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.workReadyData.data.listPlaces.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: grey.withOpacity(0.3),
                              height: 90,
                              width: 300,
                              child: Column(
                                children: [
                                  Spacer(),
                                  TextScalableWidget(
                                    widget.workReadyData.data.listPlaces[index]
                                        .place,
                                    context: context,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  TextScalableWidget(
                                    widget.workReadyData.data.listPlaces[index]
                                        .placeDescription,
                                    context: context,
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                globalSizedbox,
                widget.type == "sin asignar"
                    ? !_loadPost
                        ? RaisedGradientButton(
                            gradient: LinearGradient(
                              colors: <Color>[secondaryColor, mainColor],
                            ),
                            child: TextScalableWidget(
                              'ACEPTAR',
                              context: context,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _loadPost = true;
                              });
                              Map<String, dynamic> response =
                                  await _dataPostService
                                      .acceptWork(widget.workReadyData.id);
                              setState(() {
                                _loadPost = false;
                              });

                              if (response['ok']) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              } else {
                                showLocalScaffoldMessage(
                                  message: response['mensaje'],
                                  context: context,
                                );
                              }
                            },
                          )
                        : Center(child: CircularProgressIndicator())
                    : SizedBox(),
                globalSizedbox,
              ],
            ),
          );
        }),
      ),
    );
  }
}

/*
  The following class allows to use the build of the modal music sheet 
  as modal sheet
 */
class LaunchInfoWorkSheet {
  void launchDialog(
      {@required BuildContext context,
      @required WorkReadyData workReadyData,
      @required String type}) {
    showModalBottomSheet<void>(
      context: context, //Context
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10), //Border gloval
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        final Size _size = MediaQuery.of(context).size;
        return Container(
            height: MediaQuery.of(context).viewInsets.bottom == 0.0
                ? _size.height * 0.65
                : _size.height * 0.65,
            child: InfoWorkSheet(type: type, workReadyData: workReadyData));
      },
    );
  }
}
