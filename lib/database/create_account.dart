import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccountCRUD{
  Future createUser(Map<String,dynamic> user,String id) async {
    print("Creating user");
    return await FirebaseFirestore.instance.collection("user").doc(id).set(user);
  }
}