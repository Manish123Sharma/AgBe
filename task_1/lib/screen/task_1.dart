import 'package:flutter/material.dart';

import '../model/Contact.dart';

const darkBlueColor = Color(0xff486579);
class Task_1 extends StatefulWidget {
  
  @override
  State<Task_1> createState() => _Task_1State();
}

class _Task_1State extends State<Task_1> {
  late Contact _contact;
  List<Contact> _contacts = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ctrlMobile = TextEditingController();
  TextEditingController _ctrlName = TextEditingController();

 @override
   Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(  
        centerTitle: true,
         backgroundColor: Colors.white,
        title: Text('Contact List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),), 
      ),
     body: Container(child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Form(
         key: _formKey,
            child: Column(
            children: <Widget>[ 
              SizedBox(height: 20,),
            TextFormField( 
 
              controller: _ctrlName,
              decoration: const InputDecoration(
                
                border: OutlineInputBorder(),
                icon: const Icon(Icons.person),  
                hintText: 'Enter your name',  
                labelText: 'Full Name',  
              ), 
              ),
              SizedBox(height: 20),
            TextFormField(  
              controller: _ctrlMobile,
              decoration: const InputDecoration(  
                border: OutlineInputBorder(),
                icon: const Icon(Icons.phone),  
                hintText: 'Enter a phone number',  
                labelText: 'Phone',  
               ), 
             ),
            
            Container(  
              margin: EdgeInsets.all(25), 
                child :ElevatedButton(
               
                   onPressed: () {
                     _onSubmit();
 
                   } ,
                  child: const Text('Submit')),
          
            ),
            _list(),
            ]  
       ),
       ),
     )
     ),); 
  }

  _onSubmit()  {
  var form = _formKey.currentState;
  if (form!.validate()) {
    form.save();
   
    _contacts.add(Contact(name: _ctrlName.text,mobile: _ctrlMobile.text));
    print("phone number $_contacts");
    setState(() {
      
    });
  }
}

_list() => Expanded(
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Scrollbar(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: darkBlueColor,
                    size: 40.0,
                  ),
                  title: Text(
                    _contacts[index].name.toUpperCase(),
                    style: TextStyle(
                        color: darkBlueColor, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_contacts[index].mobile),
                  onTap: () {},
                ),
                Divider(
                  height: 5.0,
                ),
              ],
            );
          },
          itemCount: _contacts.length,
        ),
      ),
    ),
  );
}


