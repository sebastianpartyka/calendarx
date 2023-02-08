import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key}
  );

  @override
  Widget build(BuildContext context) {
   
    return ProfileScreen(
      providerConfigs: const [
        EmailProviderConfiguration(),
        // GoogleProviderConfiguration(
        //  clientId: '...',
        //   ),
        // AppleProviderConfiguration(),
      ],
      actions: [
        SignedOutAction(
          (context) {
            Navigator.of(context).pop();
          },
        ),
      ],
      avatarSize: 24,
    );
  }
}
