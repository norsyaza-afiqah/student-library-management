
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => new RegisterPageState();

}

class RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
  String _password;
  String _retypepass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Library Management")),
      body: SingleChildScrollView(
        child: new Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: FormUI()
        )
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Student ID', hintText: "A123456"),
          keyboardType: TextInputType.text,
          validator: validateId,
          onSaved: (String value) {
            _email = value;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile Number',hintText: "012-3456789"),
          keyboardType: TextInputType.phone,
          validator: validateMobile,

        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Student Email', hintText: "A123456@siswa.com"),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,

        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Password'),
          keyboardType: TextInputType.text,
          validator: validatePassword,
          onSaved: (String value) {
            _password = value;
          },
          obscureText: true,
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          //onPressed: _validateInputs,
          child: new Text('Validate'),
          onPressed: _validateInputs,
        )
      ],
    );
  }

  String validateId(String value) {
    Pattern pattern =
        r'^(([Aa\-0-9]{7,7}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Student ID';
    else
      return null;
  }

  String validateMobile(String value) {
    Pattern pattern =
        r'^(([0-9]{3,3}-[0-9]{7,8}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Phone Number';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([Aa\-0-9]{7,7}))@'
        r'(siswa.com)$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    Pattern pattern =
        r'^(([a-zA-Z\-0-9]{1,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Password';
    else
      return null;
  }

  void _validateInputs() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      Navigator.pushNamed(context, 'homepage');
    }else{
      setState(() {
        _autoValidate = true;
      });
    }
  }
}