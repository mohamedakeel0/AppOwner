import 'package:flutter/material.dart';
import 'package:foodapp/model/model_shop.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/resources/color_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
class review_screen extends StatelessWidget {
  ModelShop? modelShop;
  review_screen(this.modelShop);


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: builditemAppbar(context),),body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child:     Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                height:10,
              ),
              Row(
                children: [
                  Text(
                    'Reviews ',
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          modelShop!.reviews!.length>0?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                          modelShop!.reviews!.length>1?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                          modelShop!.reviews!.length>2?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                          modelShop!.reviews!.length>3?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                          modelShop!.reviews!.length>4?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                          modelShop!.reviews!.length>5?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),


                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('(212)'),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 5,),
              myDivider(),
              SizedBox(
                height: 5,
              ),
              SizedBox(height:  modelShop!.reviews!.length * 60,
                child: ListView.separated(physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [


                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        modelShop!.reviews![index].user!,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                        modelShop!.reviews![index].rate!>0?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                        modelShop!.reviews![index].rate!>1?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                        modelShop!.reviews![index].rate!>2?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                        modelShop!.reviews![index].rate!>3?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                        modelShop!.reviews![index].rate!>4?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),
                        modelShop!.reviews![index].rate!>5?   Icon(Icons.star,color: ColorManager.primary,size: 17,):Icon(Icons.star_border_purple500_sharp,color: ColorManager.black,size: 17,),


                          ],
                        ),
                      ),
                      Text(
                        modelShop!.reviews![index].review!,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: ColorManager.black),
                      ),
SizedBox(height: 5,),
                    ],
                  );
                }, separatorBuilder: (context, index) =>  myDivider(), itemCount:  modelShop!.reviews!.length),
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
      ),
    ),backgroundColor:  ColorManager.whiteOpactity,);
  }
}
