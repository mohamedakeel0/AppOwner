import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/model/categories.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/constants_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
import 'package:foodapp/shared/resources/string_manager.dart';

class details_screen extends StatelessWidget {
  const details_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => AppCubic()..getshop(),
      child: BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubic = AppCubic.get(context);
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SingleChildScrollView(
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
                          ConditionalBuilder(condition: cubic.shop !=null ,builder: (context) => Card(child: builditemCategories(context,cubic.shop!),),fallback:(context) => Center(child: CircularProgressIndicator()),),
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
                                    Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Size ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.black),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 60,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                cubic.changeBottom(0);
                                              },
                                              child: Text('12 *'),
                                              style: ElevatedButton.styleFrom(
                                                primary: cubic.selectedIndex == 0
                                                    ? ColorManager.primary
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 60,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                cubic.changeBottom(1);
                                              },
                                              child: Text('12 *'),
                                              style: ElevatedButton.styleFrom(
                                                primary: cubic.selectedIndex == 1
                                                    ? ColorManager.primary
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 60,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                cubic.changeBottom(2);
                                              },
                                              child: Text('12 *'),
                                              style: ElevatedButton.styleFrom(
                                                primary: cubic.selectedIndex == 2
                                                    ? ColorManager.primary
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, bottom: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Quenasdasd ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.black),
                                          ),
                                          Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.circular(20),
                                              color: cubic.color == false
                                                  ? ColorManager.primary
                                                  : ColorManager.white,
                                              border: Border.all(
                                                  color: Colors.white70,
                                                  width: 1.0,
                                                  style: BorderStyle.solid),
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  cubic.decrementCounter();
                                                  cubic.changeColor(false);
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: cubic.color == false
                                                      ? ColorManager.white
                                                      : ColorManager.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${cubic.counter} ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.black),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white70,
                                                  width: 1.0,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  new BorderRadius.circular(20),
                                              color: cubic.color == true
                                                  ? ColorManager.primary
                                                  : ColorManager.white,
                                            ),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  cubic.incrementCounter();
                                                  cubic.changeColor(true);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: cubic.color == true
                                                      ? ColorManager.white
                                                      : ColorManager.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Addons ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.black),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 90,
                                            child: ListView.separated(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height: 90,
                                                    width: 90,
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10.0),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              cubic.changeCard(
                                                                  index);
                                                            },
                                                            child: Container(
                                                              width: 90,
                                                              height: 65,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                        .circular(10),
                                                                color: ColorManager
                                                                    .primary,
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text('Cheese'),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text('& 5.00'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: Row(
                                                              children: [
                                                                InkWell(
                                                                  child: Icon(
                                                                    Icons.remove,
                                                                    size: 16,
                                                                  ),
                                                                  onTap: () {},
                                                                ),
                                                                Spacer(),
                                                                Text('0'),
                                                                Spacer(),
                                                                InkWell(
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    size: 16,
                                                                  ),
                                                                  onTap: () {},
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) => SizedBox(),
                                                itemCount: 4),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  'Total Amounts : ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: ColorManager.black),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '& 20.25',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: ColorManager.primary),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                              Spacer(),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                        context,
                                                        Routes
                                                            .review_screen);
                                                  },
                                                  child: Text('View All'))
                                            ],
                                          ),
                                          SizedBox(height: 220,
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
                                            }, separatorBuilder: (context, index) =>  myDivider(), itemCount: 3),
                                          ),

                                          SizedBox(
                                            height: 5,
                                          ),
                                          myDivider(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          defaultButton(
                                              icon: false,
                                              width: 350,
                                              shape: true,
                                              function: () {

                                              },
                                              text: 'Add To Cart',
                                              isUpperCase: false),
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
            ),
          );
        },
      ),
    );
  }
}

List detailscategoriesList = <categoriesmodel>[
  categoriesmodel(
      title: AppStrings.attractionAr,
      id: AppConstants.idhotels,
      icon: Icons.attractions),
  categoriesmodel(
      title: AppStrings.startAr, id: AppConstants.idmuseums, icon: Icons.send),
  categoriesmodel(
      title: AppStrings.callAr,
      id: AppConstants.idpharmacies,
      icon: Icons.call),
  categoriesmodel(
      title: AppStrings.saveAr,
      id: AppConstants.idrestaurants,
      icon: Icons.save),
];
