# project_structure

This project represents the structure of Flutter projects in JSGuru. It is created to help other 
developers and PMs to understand better the structure of the project and to get to know with the 
structure of the project. Here will be explained directory structure, navigation, state management etc.

## Directory Structure
- assets 
    - here we store images, translation files, custom font files, HTML files.
    
/lib
- config directory
    - represents directory where we can find files which are used for navigation. 
    - file router_delegate.dart is the most important file for navigation. 

- constants 
    - here are everything from api paths, strings which are used in a project and assets path, so we
    can reuse them throughout the project.
    
- features 
    - core directory represents authentication part of the app. Such as Login, SignUp
    - visual parts of the project will be divided in features. For example, Profile, Home etc. 
    - if ProfileScreen have EditProfileScreen, it will be find in profile/screens/edit_profile_screen.dart

-  l10n 
    - we use this directory for storing other languages of the app. 

- models
    - we use this for storing general models, which we could use through an app
    
- styles
    - every styling of the text, colors, widgets, which could be reused, should be found here 
    - general dark and light theme, also is defined here
  
- utils 
    - contains the helpers, services, UI utils, mixins which are used throughout 
    the application

- widgets
    - here we store our own custom widgets, which will be used through the app


#### Navigation
For our projects we use Flutter Navigation 2.0 with cubit state management. 
For editing and setting new screens, the most important file is router_delegate.dart (/lib/config/router/)  file and pages 
directory (/lib/config/router/pages). In router_delegate we need to define which page will be navigate 
based on cubit_state. 
Example:  
pages = [
            const LoginPage(),
            if (authState.myRoute == MyRoute.signup)
              const SignUpPage(
                  // onSignUp: onLogin
                  )
          ];
        }
Every screen we also should create first in pages directory, where we extend Page widget with unique 
key value and return MaterialPageRoute with our own created Screen. We use Page, because Navigation 2.0 
is working with Page widget. 
Example:
class LoginPage extends Page {
  

  const LoginPage() : super(key: const ValueKey('LoginPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (_) => BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
              child: const LoginScreen(),
            ));
  }
}

Recommended resources:
https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
https://docs.google.com/document/d/1Q0jx0l4-xymph9O6zLaOY4d_f7YFpNWX_eGbzYxr9wY/edit

##### Localization
In directory l10n (lib/l10n) we create .arb files for specific language. Every constant text 
which will be reused through app should should be specified and translated for each language.
Example:
In english(app_en.arb):
{
  "welcomeTitle":"Welcome",
  "@welcomeTitle": {
    "description": "First message in the app"
  }
}
In german(app_de.arb):
{
  "welcomeTitle": "Willkommen"
}

If we want to use this localization in app, it looks like this:
Text(AppLocalizations.of(context)!.welcomeTitle),

Recommended resources:  
https://flutter.dev/docs/development/accessibility-and-localization/internationalization

###### State Management
In Flutter Apps we use Cubit as our State Management. 
We divide them in two sections, such as global and local cubits.
Global cubits represents state which spread throughout the hall app. In our case it is RouteCubit
and AuthCubit. So if we change state in those two Cubits, it will affect the navigation. 

Recommended link: 
https://medium.com/flutterdevs/cubit-state-management-flutter-d372ec0044f7

####### Other useful links for this project
https://pub.dev/packages/flutter_native_splash - for splash screen

####### Cloning project and working on it
First thing to do after cloning project is to rnu this command on your 
terminal 'git config core.hooksPath ./.githooks'.

####### Before starting application you need to generate Routes with next command
flutter packages pub run build_runner build        







