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
Use GoRouter https://gorouter.dev/

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
Prefer use Provider https://pub.dev/packages/provider but you also can use Bloc because Bloc is based on Provider,
There is example in this codebase.


####### Other useful links for this project
https://pub.dev/packages/flutter_native_splash - for splash screen

####### Cloning project and working on it
First thing to do after cloning project is to rnu this command on your 
terminal 'git config core.hooksPath ./.githooks'.

####### Before starting application you need to generate Routes with next command
flutter packages pub run build_runner build        







