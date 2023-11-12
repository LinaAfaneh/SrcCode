import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class New1FirebaseUser {
  New1FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

New1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<New1FirebaseUser> new1FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<New1FirebaseUser>((user) => currentUser = New1FirebaseUser(user));
