import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsipa/cotent/content.dart';
import 'package:newsipa/cubit/cubit.dart';
import 'package:newsipa/cubit/states.dart';

class business extends StatelessWidget {
  const business({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,states>(
      listener: (context,state){},
      builder: (context,state){
        var list=newsCubit.get(context).Business;
        newsCubit.get(context).getBusinessdata();
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildArticle(list[index],context) ,
             separatorBuilder:(context,index)=>divider(),
              itemCount: list.length); 
        },
       );
  }
}