import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsipa/cubit/states.dart';
import 'package:newsipa/modules/business.dart';
import 'package:newsipa/modules/science.dart';
import 'package:newsipa/modules/sports.dart';
import 'package:newsipa/network/cacheHalper.dart';
import 'package:newsipa/network/dio_helper.dart';

class newsCubit extends Cubit<states>{
  newsCubit() : super(initstates());

  static newsCubit get(context)=>BlocProvider.of(context);

 int currentindex=1;

  List<BottomNavigationBarItem> itemsbottom=[
    BottomNavigationBarItem(
      icon:Icon(Icons.business),
      label:'business' ,
    ), 
    BottomNavigationBarItem(
      icon:Icon(Icons.sports),
      label:'sports' ,
    ), 
    BottomNavigationBarItem(
      icon:Icon(Icons.science_rounded),
      label:'science' ,
    ),
  ];

  void changebottomitem(int index)
  {
    currentindex=index;
    emit(changebuttomnav());
  }   
  
  List<Widget>screen=[
    business(),
    sport(),
    science(),
  ];

List<dynamic> Business=[];
List<dynamic> sports=[];
List<dynamic> sciences=[];

void getBusinessdata()
{
  emit(loadingBusiness());
  DioHelper.getdata(
    url: 'v2/top-headlines', 
    query: {
      'country':'eg',
      'category':'business',
      'apiKey':'aaba9dd8507549baabb19a12d718fb8e',
      }).then((value) {
        Business=value.data['articles'];
        print(Business.length);
        emit(getBusiness());
      } ).catchError((Error)
      {
        emit(errorBusiness(Error));
        print(Error.toString());
      });
}  

void getsportsdata()
{
  emit(loadingsports());
  DioHelper.getdata(
    url: 'v2/top-headlines', 
    query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'aaba9dd8507549baabb19a12d718fb8e',
      }).then((value) {
        sports=value.data['articles'];
        print(sports.length);
        emit(getsports());
      } ).catchError((Error)
      {
        emit(errorsports(Error));
        print(Error.toString());
      });
}  

void getsciencesdata()
{
  emit(loadingscience());
  DioHelper.getdata(
    url: 'v2/top-headlines', 
    query: {
      'country':'eg',
      'category':'science',
      'apiKey':'aaba9dd8507549baabb19a12d718fb8e',
      }).then((value) {
        sciences=value.data['articles'];
        print(sciences.length);
        emit(getscience());
      } ).catchError((Error)
      {
        emit(errorscience(Error));
        print(Error.toString());
      });
}  

bool brightness =false;

void ChangeBrightness ({bool? formshered})
{
  if(formshered ==null)
  {
    brightness =!brightness;
     cachehHlper.putshare(key: 'isdark', value: brightness).then(
     (value) => emit(changeBrightness()));
  }
  else
  {brightness=formshered;
  emit(changeBrightness());}

   
     
}
  
 List<dynamic> search=[]; 
void getsearchdata(String value)
{
  search=[]; 
  emit(loadingsearch());
  DioHelper.getdata(
    url: 'v2//everything', 
    query: {
      'q':'$value',
      'apiKey':'aaba9dd8507549baabb19a12d718fb8e',
      }).then((value) {
        search=value.data['articles'];
        print(search.length);
        emit(Successearch());
      } ).catchError((error)
      {
        emit(errorsearch(error));
        print(error.toString());
      });
}  


}