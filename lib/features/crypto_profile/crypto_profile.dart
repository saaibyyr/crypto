import 'package:cryptocoins_app/features/crypto_profile/bloc/profile_bloc.dart';
import 'package:cryptocoins_app/features/crypto_profile/bloc/profile_event.dart';
import 'package:cryptocoins_app/features/crypto_profile/bloc/profile_state.dart';
import 'package:cryptocoins_app/features/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoProfile extends StatefulWidget {
  @override
  State<CryptoProfile> createState() => _CryptoProfileState();
}

class _CryptoProfileState extends State<CryptoProfile> {
  @override
  void initState() {
    super.initState();
    // Fetch profile data when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            'Мой профиль',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
        body: ProfileBuild(),
      ),
    );
  }
}

class ProfileBuild extends StatelessWidget {
  const ProfileBuild({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(FetchProfileData());
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(state.imageUrl),
                  ),
                  SizedBox(height: 20),
                  // Display other profile information
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    state.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Address:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    state.address,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    state.email,
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Выйти из аккаунта',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(Icons.exit_to_app),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is ProfileErrorState) {
          // Handle error state
          return Center(
            child: Text('Error: ${state.error}'),
          );
        } else {
          // Display a loading indicator while fetching data
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
