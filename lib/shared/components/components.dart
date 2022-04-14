import 'package:flutter/material.dart';

var blueColor = Color(0xff3db2ff);
var redColor = Color(0xffff2442);
var goldColor = Color(0xffffb830);
var indigoColor = Color(0xff2f2e41);
var light_orangeColor = Color(0xffffedda);


var DarkBlueColor = Color(0xff4081b3);
var GoldColor = Color(0xfffec644);
var LightGreyColor = Color(0xffa7a9ac);
var TealColor = Color(0xff44a8c6);
var lightTealColor = Color(0xff59d0d0);


Widget DefaultFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required prefix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffisPressed,
  required String? Function(String?) validate,
  void Function()? onTap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:Icon(
          prefix,
        ),
        suffixIcon: suffix != null ? IconButton(
          icon: Icon(suffix),
          onPressed:suffisPressed!(),
        ) : null,
        border:const OutlineInputBorder(),
      ),
    );