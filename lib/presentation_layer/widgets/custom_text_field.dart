

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key, required this.hint,  this.maxlines=1, this.onSaved, this.onchanged}) : super(key: key);
final String hint;
final int maxlines;
 final  void Function(String)? onchanged;
final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onSaved: onSaved,
onChanged:onchanged ,
validator: (value){
    if(value?.isEmpty ?? true){
      return 'field is required';
    }else{
      return null;
    }
},
maxLines: maxlines,
      decoration: InputDecoration(
        hintText:hint,
       hintStyle: TextStyle(color: Colors.black),

       // border: buildborder(),
        enabledBorder: buildborder(),





      ),

    );
  }

  OutlineInputBorder buildborder() {
return OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: BorderSide(
    color: Colors.green
  )


) ;


  }
}
