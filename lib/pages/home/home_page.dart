import 'package:fast_work_app/models/works_ready_user.dart';
import 'package:fast_work_app/pages/home/profile_page.dart';
import 'package:fast_work_app/pages/home/works_page.dart';
import 'package:fast_work_app/pages/sheets/info_work.dart';
import 'package:fast_work_app/services/data_get_services.dart';
import 'package:fast_work_app/services/preferencias_usuario/preferencias_usuario.dart';
import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/widgets/cards/orders_card.dart';
import 'package:fast_work_app/widgets/labels/profile_label.dart';
import 'package:fast_work_app/widgets/section/section_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PreferenciasUsuario _preferenciasUsuario = PreferenciasUsuario();
  DataGetServices _dataGetServices = DataGetServices();
  WorksReadyModel _data;
  LaunchInfoWorkSheet _launchInfoWorkSheet = LaunchInfoWorkSheet();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WorksPage()));
        },
        child: Icon(Icons.work),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: _createForm(_size),
      )),
    );
  }

  Widget _createForm(Size size) {
    final List<Widget> _listOfItems = _listOfWidgets(size, context);

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _listOfItems.length,
        itemBuilder: (context, index) {
          return _listOfItems[index];
        });
  }

  List<Widget> _listOfWidgets(Size size, BuildContext context) {
    return [
      globalSizedbox,
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: ProfileWelcomeLabel(
          name: _preferenciasUsuario.name,
          urlImage: _preferenciasUsuario.profilePhoto,
        ),
      ),
      globalSizedbox,
      SectionViewWidget(
        title: "Tus trabajos en curso",
        content: RefreshIndicator(
          onRefresh: () async {
            _data = await _dataGetServices.getMyReadyWorks();
            setState(() {});
          },
          color: Colors.black,
          child: FutureBuilder(
              future: _dataGetServices.getMyReadyWorks(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  _data = snapshot.data;
                  if (_data.data.length != 0) {
                    return Container(
                      height: size.height * 0.8,
                      child: ListView.builder(
                        itemCount: _data.data.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              _launchInfoWorkSheet.launchDialog(
                                context: context,
                                workReadyData: _data.data[index],
                                type: _data.data[index].data.userWorker
                                            .profilePhoto ==
                                        ""
                                    ? "sin asignar"
                                    : "asignada",
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: OrdersCard(
                                avatarPicture: _data
                                    .data[index].data.userInfo.profilePhoto,
                                content: _data.data[index].data.description,
                                state: _data.data[index].data.state,
                                image: _data.data[index].data.image,
                                subsubtitle: _data.data[index].data.createdAt
                                    .toString()
                                    .split(" ")[0],
                                title: _data.data[index].data.title,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("No tienes trabajos en curso"),
                    );
                  }
                } else {
                  return Container(
                      height: size.height * 0.8,
                      child: Center(child: CircularProgressIndicator()));
                }
              }),
        ),
        context: context,
      )
    ];
  }
}
