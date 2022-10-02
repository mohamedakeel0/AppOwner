import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/assets_manager.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';

class shopInfo_screen extends StatefulWidget {
  const shopInfo_screen({Key? key}) : super(key: key);

  @override
  _shopInfo_screenState createState() => _shopInfo_screenState();
}

class _shopInfo_screenState extends State<shopInfo_screen> {
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var SearchController = TextEditingController();

  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => AppCubic()..getshop()..getPopservices()..getAllservices() ,
      child: BlocConsumer<AppCubic, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {

            var cubic = AppCubic.get(context);
            cubic.getCurrentLocation();
            return Scaffold(
              appBar: AppBar(leading:  builditemAppbar(context),
                title: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: defaultFormField(
                      controller: SearchController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      label: 'Name',
                      prefix: Icons.search,
                      onSubmit: (text) {}),
                ),
              ),
              body:   RefreshIndicator(
                onRefresh: _refreshLocalGallery,
                color: Colors.blue,

                child:SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(condition: cubic.shop !=null ,builder: (context) =>  CarouselSlider(
                            items: cubic.shop!.gallery!
                                .map(
                                  (e) => Image(
                                image: NetworkImage(e),
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            )
                                .toList(),
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              height: 250,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                            )),fallback:(context) => Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ConditionalBuilder(condition: cubic.shop !=null ,builder: (context) => Card(child: builditemCategories(context,cubic.shop!),),fallback:(context) => Center(child: CircularProgressIndicator()),

                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Pop Services ',
                            style: Theme.of(context).textTheme.headline2!.copyWith(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5,),
                        ConditionalBuilder(condition: cubic.Popservices!=null ,builder: (context) =>Container(
                            height: 170,
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  child: buildCategories(
                                      false,cubic.Popservices![index]
                                  ),
                                  onTap: () {
                                    cubic.getdetailsservices(cubic.Popservices![index]['id']);
                                    builditemdetailsservice(context,cubic.detailsServices!);
                                  },
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                                itemCount: cubic.Popservices!.length)),fallback:(context) => Center(child: CircularProgressIndicator()),

                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                          child: Text(
                            'All Service ',
                            style: Theme.of(context).textTheme.headline2!.copyWith(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ConditionalBuilder(condition: cubic.allservices!=null ,builder: (context) =>   Container(
                          child: GridView.count(
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1,
                            childAspectRatio: 1 / 1.3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            children:
                            List.generate(cubic.allservices!.length, (index) => buildGridproduct(context,cubic.allservices![index])),
                          ),
                        ),fallback:(context) => Center(child: CircularProgressIndicator()),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );

          }),
    );
  }
  Future<Null> _refreshLocalGallery() async{
    print('refreshing stocks...+++++++++++++++++++++++++++++');

  }
}

