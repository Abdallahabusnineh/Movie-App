import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget defaultButton (
    {

      double width=double.infinity,
      double radus=10,
      required String text,
      required void Function () onpressed,
      Color backgrund=Colors.blue,



    }
    ){
  return Container(
    width: width,
    decoration:   BoxDecoration(
      borderRadius: BorderRadius.circular(radus),
      color: backgrund,
    ),
    child: TextButton(
        onPressed: onpressed,
        child: Text('${text.toUpperCase()}',
          style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),

        )
    ),

  );
}

Widget defaultTextButton({
  required Function,
required var Text,
})=>TextButton(onPressed: Function,

    child:Text(Text.toUpperCase()),);




Widget defaultTextFromFiled({
  required TextEditingController Controller,
  required TextInputType type,
    void  Function(String val)? onSubmit,
  void  Function(String val)? onChange,
   void Function() ?onTab,


  required IconData preIcon,
  required String lable,

  double radus=10.0,
  bool isPassword=false,
  var sufIcon=null,
  required String? Function(String? value) validate,

  Function()? onpressedSuffex,
bool isClickable=true,



})=>TextFormField(
    validator: validate,
enabled: isClickable,
    obscureText: isPassword,
    controller: Controller,
    keyboardType: type,
    onFieldSubmitted:onSubmit,
    onChanged: onChange,
    onTap: onTab,
    decoration: InputDecoration(
      prefixIcon: Icon(preIcon),
      suffixIcon: sufIcon !=null ?IconButton(onPressed:onpressedSuffex,
          icon: Icon(sufIcon))
          : null,
      labelText: '${lable.toUpperCase()}',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radus),


      ),





    ),

  );




Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.all(10.0),
  child: Container(

    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);


Widget BuildArticleItem(artcle,context){
  return
  InkWell(
    onTap: (){
//navigateTo(context, WebViewScreen(artcle['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${artcle['urlToImage']}'),
                    fit: BoxFit.cover,
                  )
              )
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(

                      '${artcle['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${artcle['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  ),

                ],
              ),
            ),
          )

        ],
      ),
    ),
  );
}
// {isSearch=false}
//هاد عشان ما اخلي الsearch screen يضل يحمل لأ هيك بوقفها وبتحمل لما انا اعمل search
Widget articleBulider(list,context,{isSearch=false}){
 return ConditionalBuilder(
      condition: list.length>0 ,
      builder: (context) =>
          ListView.separated(
              physics: BouncingScrollPhysics(),

              itemBuilder: (context,index)=>BuildArticleItem(list[index],context),
              separatorBuilder: (context,index)=>myDivider(),
              itemCount: 10
          ),
// if isSearch true => Container (nothing)
// if isSearch false =>  خلي ال صفحة تضل تعجيبلك معلومات

      fallback: (context)=> isSearch ? Container() :Center(child: CircularProgressIndicator()));


}
void navigateAndFinish(
context,
widget,
)=> Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>widget),
        (route)=>false,
);

void navigateTo(context,Widget)=>  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=> Widget,
));

void showToast(
{
  required String text,
  required ToastStates state

}
    )=> Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
// enum we use enum when i need to choose more than one from anything
enum ToastStates{
  SUCCESS,ERROR,WARNING
}

Color ?chooseToastColor(ToastStates states){
  Color color;
switch(states)
    {
  case ToastStates.SUCCESS:
    color= Colors.green;
    break;
  case ToastStates.WARNING:
    color= Colors.yellow;
    break;
  case ToastStates.ERROR:
    color= Colors.red;
    break;

    }
    return color;
}


