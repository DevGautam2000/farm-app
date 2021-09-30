import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
                child: buildContainer(size, context),
              ),
            ]),
      ),
    );
  }

  Container buildContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * .8,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                buildColumn("Username", "Please enter your username.", context),
                SizedBox(
                  height: 50,
                ),
                buildColumn("Password", "Please enter your password.", context),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: buildTextStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                buildElevatedButton(
                    size, "Sign In", Color(0xff93D7AB), Colors.black),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "or",
                  style: buildTextStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                buildElevatedButton(size, "Sign in with Google",
                    Theme.of(context).primaryColor, Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(size, text, code, textColor) {
    return ElevatedButton(
      onPressed: () {
        print("i was pressed");
      },
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        minimumSize:
            MaterialStateProperty.all(Size(size.width, size.height * .065)),
        elevation: MaterialStateProperty.all(5.0),
        backgroundColor: MaterialStateProperty.all(code),
      ),
    );
  }

  TextStyle buildTextStyle() {
    return TextStyle(fontSize: 16);
  }

  Column buildColumn(text, validationText, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: buildTextStyle(),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter your ${text.toString().toLowerCase()}',
            border: buildOutlineInputBorder(context),
            focusedBorder: buildOutlineInputBorder(context),
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validationText;
            }
            return null;
          },
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
}
