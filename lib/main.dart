import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsipa/network/cacheHalper.dart';
import 'package:newsipa/network/dio_helper.dart';
import 'package:newsipa/layout/newslayout.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cachehHlper.init();

  bool? isdark = cachehHlper.getshare(key:'isdark');
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  final bool? isdark ;
  MyApp(this.isdark);

  @override
  Widget build(BuildContext context) {
  var blocConsumer = BlocConsumer<newsCubit,states>(
        listener: (context,state){},
        builder:(context,state){
          var cubit =newsCubit.get(context);
    return MaterialApp(
       themeMode: cubit.brightness ? ThemeMode.light :ThemeMode.dark ,
       debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
         elevation: 0,
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: HexColor('eeebf0'),
           statusBarBrightness: Brightness.values[1],  
           systemNavigationBarColor: HexColor('eeebf0'),         
         ),
         color: Colors.white,
         iconTheme: IconThemeData(color: Colors.black),
         titleTextStyle:TextStyle(
           color: Colors.black,
           fontSize: 30, ),
        textTheme: TextTheme(
         bodyText2: TextStyle(
           color: Colors.black,
           fontSize: 20,
           fontWeight: FontWeight.w800,
         ),
       ),
      ) ,
       bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[700],
        elevation: 20,
        unselectedItemColor: Colors.black87,
       ),
      ),
     // themeMode: ThemeMode.dark ,
      darkTheme: ThemeData(
        scaffoldBackgroundColor:  HexColor('232b2b'),
       appBarTheme: AppBarTheme(
         backwardsCompatibility: false,
         elevation: 0,
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: HexColor('353839'),
           statusBarBrightness: Brightness.dark,  
           systemNavigationBarColor: HexColor('353839'),         
         ),
         color: HexColor('353839'),
         iconTheme: IconThemeData(color: Colors.white),
         titleTextStyle:TextStyle(
           color: Colors.white,
           fontSize: 30, ),
       ) ,
       bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent[200],
        elevation: 20,
        unselectedItemColor: Colors.grey[200],
        backgroundColor: HexColor('353839'),
       ),
       textTheme: TextTheme(
         bodyText2: TextStyle(
           color: Colors.white,
           fontSize: 20,
           fontWeight: FontWeight.w800,
         ),
       ),
      ),
     
      home: newslayout(),
    );
        }
      );
  return BlocProvider(
      create: (BuildContext context)=> newsCubit()..getsportsdata()..ChangeBrightness(
        formshered: isdark
      ),
      child: blocConsumer
     
    );
  }
}