import 'package:flutter/material.dart';



class NurseHomePage extends StatelessWidget {


const NurseHomePage({super.key});



@override
Widget build(BuildContext context){


return Scaffold(

appBar: AppBar(
title: const Text('لوحة الممرض'),
),


body: const Center(

child: Text(
'مرحبا بك كممرض'
),

),


);


}


}