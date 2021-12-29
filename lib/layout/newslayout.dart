import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsipa/cubit/cubit.dart';
import 'package:newsipa/cubit/states.dart';
import '../modules/search.dart';


class newslayout extends StatelessWidget {
  const newslayout({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<newsCubit,states>(
        listener: (context,state){},
        builder:(context,state){
          var cubit =newsCubit.get(context);
          return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('News')),
          actions: [IconButton(
               icon:Icon(Icons.search,),
               onPressed:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>searchscreen()));
               } , ),
            IconButton(
               icon:Icon(Icons.brightness_4,),
               onPressed:(){
                 cubit.ChangeBrightness();
               } , ),    
          ],
                  
        ),
        body: cubit.screen[cubit.currentindex],
        bottomNavigationBar: BottomNavigationBar(
          items: cubit.itemsbottom,
          currentIndex: cubit.currentindex,
          onTap: (index){
           cubit.changebottomitem(index);
          },
        ),
         );
        } 
        
     
    );
  }
}