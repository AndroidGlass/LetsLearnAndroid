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
  - Commit circle.yml
  - https://circleci.com/docs/config-sample
  - android list sdk --all --no-ui --extended | grep "support"
  - https://github.com/Originate/guide/blob/master/android/guide/Continuous%20Deployment.md
- HockeyApp
  - http://hockeyapp.net/features/
  - Create free account
  - Check “I’m a developer”
  - Setting up devices
    - Guided
    - Navigate to URL
    - Install HockeyApp app
  - Create App
