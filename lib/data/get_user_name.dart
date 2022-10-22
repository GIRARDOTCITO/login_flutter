import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
    GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('lacuenta');
  //como podemos ver en esta parte se carga el crud de nuestra base de datos
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, shapshot){
        //La instantánea es el resultado del Futuro o la Corriente que está escuchando en su FutureBuilder . Antes de interactuar con los datos que se devuelven y usarlos en su constructor, primero debe acceder a ellos.
        if(shapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data =
              shapshot.data!.data() as Map<String, dynamic>;
          return Text('Nombre Usuario: ${data['First name']} ${data['Last name']}, ${data['User profile']}');
        }
        return const Text('cargando..');
      })
    );
  }
}
