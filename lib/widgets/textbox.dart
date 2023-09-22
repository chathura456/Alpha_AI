import 'package:flutter/material.dart';

import '../constants/theme_data.dart';

class TextBoxWidget extends StatefulWidget {
  const TextBoxWidget({super.key, required this.hintText, this.emptyError, required this.controller, this.isPassword = false, this.iconData});
  final String hintText;
  final String? emptyError;
  final TextEditingController controller;
  final bool isPassword;
  final IconData? iconData;

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(10.0),
        border: null,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword?_passwordVisible:false,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          prefixIcon: widget.iconData!=null?Icon(widget.iconData):null,
          isDense: true,
          contentPadding : const EdgeInsets.symmetric(vertical: 20),
          fillColor: AppColors.containerColor,
          prefixIconColor: Colors.white,
          suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility_off :Icons.visibility ,
            color: Colors.white,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ):null,
          suffixIconColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(29.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
    enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),

        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.emptyError ?? "";
          }
          return null;
        },
        //onSaved: (value) => _email = value!,
      ),
    );
  }
}


// class MyTextBox extends StatefulWidget {
//   const MyTextBox(
//       {Key? key,
//         this.hintText,
//         this.icon = Icons.person,
//         required this.controller,
//         this.validator,
//         this.isPassword = false})
//       : super(key: key);
//   final String? hintText;
//   final IconData icon;
//   final TextEditingController controller;
//   final FormFieldValidator? validator;
//   final bool isPassword;
//
//   @override
//   State<MyTextBox> createState() => _RoundedInputField1State2();
// }
//
// class _RoundedInputField1State2 extends State<MyTextBox> {
//   late bool _passwordVisible = true;
//   @override
//   void initState() {
//     super.initState();
//     _passwordVisible = true;
//     widget.controller.addListener(
//         (_updateText)
//     );
//   }
//
//   var myText;
//   void _updateText() {
//     setState(() {
//       myText = widget.controller.text;
//     });
//   }
//
//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       autofocus: false,
//       keyboardType: TextInputType.text,
//       textInputAction: TextInputAction.next,
//       validator: widget.validator,
//       controller: widget.controller,
//       obscureText: widget.isPassword ? _passwordVisible : false,
//       onSaved: (value) {
//         widget.controller.text = value!;
//       },
//       cursorColor: AppColors.kPrimaryColor,
//       style: const TextStyle(color: AppColors.kPrimaryColor),
//       decoration: InputDecoration(
//         errorStyle: TextStyle(color: AppColors.kPrimaryColor60),
//         filled: true,
//         fillColor: AppColors.kPrimaryColor10,
//         suffixIcon: widget.isPassword
//             ? IconButton(
//           icon: Icon(
//             // Based on passwordVisible state choose the icon
//             _passwordVisible ? Icons.visibility : Icons.visibility_off,
//             color: const Color(0xff80065d),
//           ),
//           onPressed: () {
//             // Update the state i.e. toogle the state of passwordVisible variable
//             setState(() {
//               _passwordVisible = !_passwordVisible;
//             });
//           },
//         )
//             : null,
//         prefixIcon: Icon(
//           widget.icon,
//           color: const Color(0xff80065d),
//         ),
//         hintText: widget.hintText,
//         hintStyle: TextStyle(
//           color: AppColors.kPrimaryColor60,
//         ),
//         helperStyle: const TextStyle(fontFamily: 'OpenSans'),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(29.0),
//           borderSide: const BorderSide(
//             color: AppColors.kPrimaryColor,
//             width: 1.0,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(29.0),
//           borderSide: BorderSide(
//             color: AppColors.kPrimaryColor10,
//             width: 1.0,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(29.0),
//           borderSide: const BorderSide(
//             color: AppColors.kPrimaryColor,
//             width: 2.0,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(29),
//           borderSide: BorderSide(color: AppColors.kPrimaryColor10, width: 1.0),
//         ),
//       ),
//     );
//   }
// }


