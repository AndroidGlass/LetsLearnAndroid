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

- Project setup
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
