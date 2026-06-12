import 'package:flutter/material.dart';


class PatientHomePage extends StatelessWidget {

const PatientHomePage({super.key});


@override
Widget build(BuildContext context){

return Scaffold(

appBar: AppBar(
title: const Text('لوحة المريض'),
),


body: const Center(

child: Text(
'مرحبا بك كمريض'
),

),


);


}

}