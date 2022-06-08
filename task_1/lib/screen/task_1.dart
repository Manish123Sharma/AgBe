import 'package:flutter/material.dart';


class Contacts{
 String Name;
 String phn;
  Contacts({required this.Name, required this.phn});
}
class Task_1 extends StatefulWidget {
  
  @override
  State<Task_1> createState() => _Task_1State();
}

class _Task_1State extends State<Task_1> {
  late Contacts _contact;
  List<Contacts> _contacts = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ctrlMobile = TextEditingController();
  TextEditingController _ctrlName = TextEditingController();

 @override
   Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Contact List',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 162, 9, 9)),), 
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
   
    _contacts.add(Contacts(Name: _ctrlName.text,phn: _ctrlMobile.text));
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
                    size: 40.0,
                  ),
                  title: Text(
                    _contacts[index].Name.toUpperCase(),
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_contacts[index].phn),
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


