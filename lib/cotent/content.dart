//https://newsapi.org/
//v2/top-headlines?
//country=eg&category=business&apiKey=aaba9dd8507549baabb19a12d718fb8e
//https://newsapi.org/v2/everything?q=tesla&from=2021-08-08&sortBy=publishedAt&
//apiKey=aaba9dd8507549baabb19a12d718fb8e
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsipa/modules/webview.dart';

Widget divider()=>Padding(
  padding: const EdgeInsets.all(20),
  child:  Container(
    height: 2,
    color: Colors.grey,
  ),
);

Widget defultTextField ({
  required context,
  TextEditingController? controller,
  TextInputType? type,
  String? labal,
  IconData? prefix , suffix, suffixpressed,
  String? initivalue,
  Function(String)? onsubmit ,onchange , ontap,
 required String? Function(String?) vaildate,
 bool ispassword =false,  enable =true,

})=>Container(
  decoration:BoxDecoration(borderRadius: BorderRadius.circular(20)) ,
  child:   TextFormField(
    controller: controller ,
   keyboardType:type ,
  obscureText: ispassword,
  textAlign: TextAlign.start,
  decoration: InputDecoration(border:OutlineInputBorder(),
  labelText: labal,
  suffixIcon: suffix !=null ?IconButton(
    onPressed: suffixpressed,
     icon:Icon(suffix) ) :null,
     prefixIcon: Icon(prefix),
    ),
    validator:vaildate ,  
    onChanged: onchange,
    onTap: ontap,
    onFieldSubmitted: onsubmit,
    initialValue: initivalue,
    style: Theme.of(context).textTheme.bodyText1,
  
  ),
);


Widget buildArticle(list,context,{isSearch =false})=>
   BuildCondition(
  
    condition:list.length>0,
  
    fallback:(context)=>isSearch ? Container():Center(child: CircularProgressIndicator()),
  
    builder: (context)=> Padding(
  
      padding: const EdgeInsets.all(20.0),
  
    child:InkWell(
  onTap: ()
  {
    Navigator.push(context,MaterialPageRoute(builder:(context)=>webviewscreeen(list['url']),));
    //Navigator.push(context,webview(list['url']),);
  },
      child: Row(
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(
             width: 120,
             height: 120,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(11),
               image: DecorationImage(
                 fit: BoxFit.cover,
                 image: NetworkImage
                 ('${list["urlToImage"]}'),),
                 ),
      
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Container(
                height: 120  ,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [ 
                    Expanded(
                          child: Text('${list["title"]}',
                          style:Theme.of(context).textTheme.bodyText2,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,),
                          ),
                        Text('${list["publishedAt"]}',
                         style: TextStyle(
                           fontSize: 17,
                          fontWeight: FontWeight.w800,
                          ),maxLines: 1,
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