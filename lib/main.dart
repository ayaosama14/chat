import 'package:chating_app/chat_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
void main() async{

   WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
 await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
   await Supabase.initialize(
     url:'https://vbqdgucobdgmkyihqgjc.supabase.co',
     anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZicWRndWNvYmRnbWt5aWhxZ2pjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM0MjExNDMsImV4cCI6MjA0ODk5NzE0M30.3yoMx2oNrAb1Ea0nZk9aXmuITxnMhVVnIqkDipyIxRc',
   );
  runApp(const MyChatApp());
}

