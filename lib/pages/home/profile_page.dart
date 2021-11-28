import 'package:fast_work_app/models/works_ready_user.dart';
import 'package:fast_work_app/pages/auth/login.dart';
import 'package:fast_work_app/services/data_get_services.dart';
import 'package:fast_work_app/services/preferencias_usuario/preferencias_usuario.dart';

import 'package:fast_work_app/utils/colors_utils.dart';
import 'package:fast_work_app/widgets/cards/orders_card.dart';
import 'package:fast_work_app/widgets/cards/profile_card.dart';
import 'package:fast_work_app/widgets/section/section_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PreferenciasUsuario _preferenciasUsuario = PreferenciasUsuario();

  WorksReadyModel _data;

  DataGetServices _dataGetServices = DataGetServices();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: _createForm(_size, context),
      )),
    );
  }

  Widget _createForm(Size size, BuildContext context) {
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
      Row(children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        Spacer(),
        GestureDetector(
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            },
            child: Icon(Icons.logout, color: redGlobal)),
      ]),
      globalSizedbox,
      ProfileCard(
        name: _preferenciasUsuario.name,
        urlImage: _preferenciasUsuario.profilePhoto,
        description: _preferenciasUsuario.description,
      ),
      globalSizedbox,
      SectionViewWidget(
        title: "Tus trabajos",
        content: RefreshIndicator(
          onRefresh: () async {
            _data = await _dataGetServices.getMyFinishWorks();
            setState(() {});
          },
          color: Colors.black,
          child: FutureBuilder(
              future: _dataGetServices.getMyFinishWorks(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  _data = snapshot.data;
                  if (_data.data.length != 0) {
                    return Container(
                      height: size.height * 0.5,
                      child: ListView.builder(
                        itemCount: _data.data.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: OrdersCard(
                              avatarPicture:
                                  _data.data[index].data.userInfo.profilePhoto,
                              content: _data.data[index].data.description,
                              state: _data.data[index].data.state,
                              image: _data.data[index].data.image,
                              subsubtitle: _data.data[index].data.createdAt
                                  .toString()
                                  .split(" ")[0],
                              title: _data.data[index].data.title,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("No tienes trabajos finalizados"),
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
