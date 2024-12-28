import 'package:chating_app/fetchers/auth/view/phone_view.dart';
import 'package:chating_app/fetchers/auth/widget/custom_text_field.dart';
import 'package:chating_app/fetchers/home/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/spacer.dart';
import 'manager/auth__cubit.dart';
import 'manager/auth_states.dart';

class OtpView extends StatelessWidget {
  String? verificationId;
  static const String id = 'otp_view';
  TextEditingController? otpController = TextEditingController();

  OtpView({super.key, this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40.0)),
                        border: Border.all(
                            color: const Color(0xff0a2d40), width: 2),
                        image: const DecorationImage(
                          image: AssetImage("asset/image/logo2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // color: Colors.black,

                      // color: Colors.black12,
                    ),
                  ),
                  spacerH12,
                  Text(
                    'Write OTP Number',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  spacerH12,
                  spacerH40,
                  CustomTextField(
                    hint: "OTP number",
                    myController: otpController,
                    keyboardType: TextInputType.number,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.language),
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId!,
                                  smsCode: otpController!.text);
                          await FirebaseAuth.instance
                              .signInWithCredential(credential);
                          Navigator.of(context).pushNamed(HomeView.id);
                        } catch (e) {
                          print("otp error${e.toString()}");
                        }
                      },
                    ),
                  ),
                  spacerH40,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed(PhoneView.id);
                      },
                      child: Text(
                        'Verified',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  spacerH6,
                  spacerH40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(PhoneView.id);
                          },
                          child: Text(
                            '>Back',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context).pushNamed(PhoneView.id);
                          },
                          child: Text(
                            'resend code',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
