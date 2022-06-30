import 'package:flutter/material.dart';

class Text_field extends StatelessWidget {
  late String label;
  late TextEditingController msg;
  Size ds;
  Text_field(this.label, this.msg, this.ds);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ds.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            controller: msg,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(

              

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,

              hintText: "$label",

              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),

              labelText: '$label ',
              //lable style
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            )),
      ),
    );
  }
}
