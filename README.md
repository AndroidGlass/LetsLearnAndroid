# LetsLearnAndroid
Files and instructions for learning Android.

# Lesson 1
## Setup Guide

- Install Android Studio
  - Download Android Studio from 
  - (Mac) http://developer.android.com/sdk/index.html
  - Open Android Studio
       - Import/Don’t settings from previous installation 
       - Use default installation for setting up sdk: ~/Library/Android/sdk
####Project setup
- Open Android Studio
  - Start New Android Project
  - New Project
    - Application Name: MiiDroid
    - Company Domain: unique identifier
  - Target Android Device
    - 5.0
  - Add Target Activity
    - Empty activity
  - Customize:
    - MainActivity
  - Finish
  - Change the build tool version to 23.0.1

- Add version control
    - Click on vcs
    - Enable version control
    - Select Git
    - Add .idea to .gitignore
    - Add and Commit changes
- Github
    - Create a new github respository
    - Add remote 
    - Push to Github
- CircleCI
  - Add Project
  - Link to GitHub
  - Build your project
- HockeyApp
  - http://hockeyapp.net/features/
  - Create free account
  - Check “I’m a developer”
  - Setting up devices
    - Guided
    - Navigate to URL
    - Install HockeyApp app
  - Create App
    - Android - alpha
  - Create scripts folder in project
    - Create [deployHockeyApp.sh](https://github.com/AndroidGlass/LetsLearnAndroid/blob/master/scripts/deployHockeyApp.sh) under scripts
  - Create [circle.yml](https://github.com/AndroidGlass/LetsLearnAndroid/blob/master/circle.yml)
    - For more information visit https://github.com/Originate/guide/blob/master/android/guide/Continuous%20Deployment.md
  - Commit the files, don't push!
  - On HockeyApp
    - Account settings > API Tokens > Create API Token
      - App : your app
      - Rights : Upload & Release
      - Name : CircleCI
  - On Circle CI 
    - Go to project settings > Enviroment variables
      - HOCKEYAPP_APP_IDENTIFIER : copy from hockeyapp project
      - HOCKEYAPP_EXPORT_APK_PATH : app/build/outputs/apk/app-debug.apk
      - HOCKEYAPP_TOKEN : copy from hockyapp account settings
  - Push to github.


# Lesson 2
## First Activity

  - Running The Application:
    - Open up Android Studio
    - Select MiiDroid
    - Setting up device
      - On the device: Settings -> developer options -> Enable USB Debugging
      - Plug device into the laptop
      - Click on the green play button and select the device from the list. The app should launch on the device 
    - Setting up emulator
      - Launch the Android Virtual Device Manager
        - In Android Studio, select Tools > Android > AVD Manager, or click the AVD Manager icon  in the toolbar. 
        - Select the desired hardware, selection system version (5.0+ for our project)
        - Verify configurations and then click finish.
        - Click on green play button and select and select the emulator that you just created
        - The app should launch on the emulator
      - For more details please visit: http://developer.android.com/intl/es/training/basics/firstapp/running-app.html
  
  - Building your first user interface
    - Open up your project in Android studio.
      - All your layout files are contained in `res/layout` folder 
      - Open up `activity_main.xml` and examine the layout
      - Change the top level layout to `LinearLayout` with `vertical` orientation
      - Change `TextView` to `EditText` text -> `height` = `wrap_content`, `width` = `match_parent`, `text` = `username`
      - Add another `EditText` with similar contraints and set `text` to `password`
      - Add a `Button` with text `Login`
