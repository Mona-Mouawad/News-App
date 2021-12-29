import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsipa/cotent/content.dart';
import 'package:newsipa/cubit/cubit.dart';
import 'package:newsipa/cubit/states.dart';

class searchscreen extends StatelessWidget {
   
   var searchcontroller=TextEditingController();
 
  @override
  Widget build(BuildContext context) { 
    //var keyform= GlobalKey<FormState>();
   return BlocConsumer<newsCubit,states>(
      listener: (context,stats){},
      builder: (context,stats){
        var cubit=newsCubit.get(context);
        var list =cubit.search;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
             child: defultTextField(
                controller: searchcontroller,
                context: context,
                labal: 'search',
                /*onchange: (value)
                 {
                   cubit.getsearchdata(value);
                    print(value);
                }, */
                vaildate: (String?value ) {  },
                prefix: Icons.search,
                type: TextInputType.text,
                onsubmit: (value)
                 {
                   cubit.getsearchdata(value);
                    print(value);
                },
              ),
                  

                
            ),
          ),
          if(states  is ! Successearch)
             Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LinearProgressIndicator(),
          ),
         Expanded(child:ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildArticle(list[index],context,isSearch: true) ,
           separatorBuilder:(context,index)=>divider(),
            itemCount:  list.length)
         )
        ],
      ),
      
    );
  
      }, );
    
     }
}



