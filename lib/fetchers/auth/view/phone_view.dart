import 'package:chating_app/fetchers/auth/view/otp_view.dart';
import 'package:chating_app/fetchers/auth/widget/custom_text_field.dart';

// import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_snack_bar.dart';
import '../../../core/spacer.dart';
import 'manager/auth__cubit.dart';
import 'manager/auth_states.dart';

class PhoneView extends StatelessWidget {
  static const String id = 'phone_view';
  TextEditingController? phoneController = TextEditingController();

  PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
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
                    'Login with phone number',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  spacerH12,
                  spacerH40,
                  CustomTextField(
                    hint: "Phone number",
                    myController: phoneController,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      phoneController?.text;
                    },
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // showCountryPicker(
                        //   context: context,
                        //   showPhoneCode: true,
                        //   // optional. Shows phone code before the country name.
                        //   onSelect: (Country country) {
                        //     phoneController?.text = country.phoneCode;
                        //     print('Select country: ${country.displayName}');
                        //   },
                        // );
                      },
                    ),
                  ),
                  spacerH40,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // context
                        //     .read<AuthCubit>()
                        //     .signInWithPhoneFirebase(phoneController!.text);
                        // print('**phone number is : ${phoneController?.text}');
                        if (state is SignedPhoneSuccessState) {
                          AppSnackBar.success(context: context);
                          Navigator.of(context).pushNamed(
                              OtpView(verificationId: state.verificationId)
                                  as String);
                        }
                        if (state is SignedPhoneFailedState) {
                          AppSnackBar.failure(context,text: state.error!);
                        }
                      },
                      child: Text(
                        'Send Code',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
