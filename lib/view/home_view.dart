import 'package:flutter/material.dart';
import 'package:mvvm_db/data/database/get_all_student.dart';
import 'package:mvvm_db/model/munu_model.dart';
import 'package:mvvm_db/res/app_all_strings.dart';
import 'package:mvvm_db/res/app_colors.dart';
import 'package:mvvm_db/res/components/sizebox_height.dart';
import 'package:mvvm_db/res/components/sizebox_width.dart';
import 'package:mvvm_db/utils/option_menu.dart';
import 'package:mvvm_db/utils/routes_name.dart';
import 'package:mvvm_db/utils/toast_msg.dart';
import 'package:mvvm_db/view_model/getdatabase_view_model.dart';
import 'package:mvvm_db/view_model/login_view_model.dart';
import 'package:mvvm_db/view_model/remove_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController(text: "3");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: Text(AllString.homeViewTitleMsg,style: Theme.of(context).textTheme.bodyMedium),
          actions: [
            PopupMenuButton<MenuModel>(color: Colors.white,
              onSelected: (value) {
                onSelectValue(context, value);
              },
              itemBuilder: (context) => [
                ...OptionMenu.firstItem.map(buildList).toList(),
              ],
            )
          ],
        ),
        body: Consumer2<GetAllStudentViewModel,RemoveViewModel>(
          builder: (context, value, vls, child) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          style: TextStyle(color: txtColor),
                          cursorColor: btnBgColor,
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Enter Limit",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: inputBorderColor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: inputBorderColor, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: inputBorderColor, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: inputBorderColor, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      SizeBoxWidth(width: 20.0),
                      Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: () {
                                value.setLimitData(
                                    searchController.text.toString());
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: btnBgColor),
                              child: Icon(Icons.search,color: whiteColor,)))
                    ],
                  ),
                ),
                // SizedBox(height: 20,),
                Expanded(
                  child: FutureBuilder(
                    future: value.getAllStudent(searchController.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: value.listData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(value.listData[index].studentEmail
                                  .toString(),style: TextStyle(color: txtColor),),
                              trailing: InkWell(
                                child: Icon(Icons.delete,color: btnBgColor,),
                                onTap: () {
                                      vls.removeStudents(value.listData[index].studentEmail.toString());
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }

  PopupMenuItem<MenuModel> buildList(MenuModel e) {
    return PopupMenuItem(
      value: e,
      child: Row(
        children: [
          Icon(e.iconData),
          SizeBoxWidth(width: 12.0),
          Text(e.txt.toString()),
        ],
      ),
    );
  }

  void onSelectValue(BuildContext context, MenuModel value) {
    final provider = Provider.of<LoginViewModel>(context, listen: false);
    switch (value) {
      case OptionMenu.logout:
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginView, (route) => false);
        provider.clearSP();
        break;
    }
  }
}
