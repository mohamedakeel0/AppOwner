import 'package:flutter/material.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class detailsservices_screen extends StatefulWidget {
  const detailsservices_screen({Key? key}) : super(key: key);

  @override
  _detailsservices_screenState createState() => _detailsservices_screenState();
}

class _detailsservices_screenState extends State<detailsservices_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Show bottom'),
            onPressed: () async {
              showModalBottomSheet(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 31.4,
                        left: 2,
                        right: 2,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    myDivider(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Descripes',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Masasaa losdasld alsdlasdao asldlasldo asdlalsdoa lalsdoa sdasdasd asdasda asdasd asda .',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.black),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(height: 130,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.separated( physics: BouncingScrollPhysics(), scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                                                return Container(width: 130,decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(ImageAssets.image),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                    new BorderRadius.circular(20)),);
                                              }, separatorBuilder: (context, index) => SizedBox(width: 5,), itemCount: 10),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(left: 5, right: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[


                                                Row(
                                                  children: [
                                                    Text(
                                                      'Review ',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500,
                                                          color: ColorManager.black),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: ColorManager.primary,
                                                          size: 15,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: ColorManager.primary,
                                                          size: 15,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: ColorManager.primary,
                                                          size: 15,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .star_border_purple500_sharp,
                                                          size: 15,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .star_border_purple500_sharp,
                                                          size: 15,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text('(212)'),
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                                SizedBox(height: 73*20,
                                                  child: ListView.separated(physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
                                                    return Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        myDivider(),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 8.0),
                                                          child: Text(
                                                            '11 Septemper 2020 ',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w300,
                                                                color: Colors.grey),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 8.0),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'A******** ',
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color:
                                                                    ColorManager.black),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.only(
                                                                    left: 8.0),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.star,
                                                                      color: ColorManager
                                                                          .primary,
                                                                      size: 15,
                                                                    ),
                                                                    Icon(
                                                                      Icons.star,
                                                                      color: ColorManager
                                                                          .primary,
                                                                      size: 15,
                                                                    ),
                                                                    Icon(
                                                                      Icons.star,
                                                                      color: ColorManager
                                                                          .primary,
                                                                      size: 15,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_border_purple500_sharp,
                                                                      size: 15,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_border_purple500_sharp,
                                                                      size: 15,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 8.0),
                                                          child: Text(
                                                            'Every came in the very well packet 0000000 is edcadaksdas asa asdas dasd asd asd asda',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w300,
                                                                color: ColorManager.black),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }, separatorBuilder: (context, index) =>  myDivider(), itemCount: 20),
                                                ),

                                                SizedBox(
                                                  height: 5,
                                                ),
                                                myDivider(),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
