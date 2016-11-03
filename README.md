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
      - Change `TextView` to `EditText`:  `id` = `@+id/et_username`, text` -> `height` = `wrap_content`, `width` = `match_parent`, `text` = `username`
      - Add another `EditText` with similar contraints and set `text` to `password`, `id` = `@+id/et_password`
      - Add a `Button` with text `Login`, `id` = `@+id/btn_login`
      - Open `MainActivity` from `java/your.package.name/MainActivity`
      - Set Listeners
        -  Create instance variables for the Button and the two EditText
        -  In the `onCreate` of your activity
          - Set click listener on the button
          - `mBtnLogin.setOnClickListener(this);`
          - Implement the click listener to print out user name and password on button click
    
# Lesson 3
## Intents
  - Launch Android Studio and Open Up MiiDroid
  - Create a new Activity called MenuActivity
  - Open up MenuActivity and navigate to its layout file
  - Add a scroll view as the root view
  - Add a button called Send Implicit intent
  - Implement functionality for sending a implicit `ACTION_SEND` intent with text `Hello World`
      ```java
      // Create the text message with a string
      Intent sendIntent = new Intent();
      sendIntent.setAction(Intent.ACTION_SEND);
      sendIntent.putExtra(Intent.EXTRA_TEXT, textMessage);
      sendIntent.setType("text/plain");
      
      // Verify that the intent will resolve to an activity
      if (sendIntent.resolveActivity(getPackageManager()) != null) {
          startActivity(sendIntent);
      }
      ```
  - Open up main activity and adjust the current layout to center on screen
  - Add a new text view which will be used to display an error message
  - Add a method called `isValid(username, password)` that returns a boolean
    - verify username and password against static data
  - Create an Intent object to start `MenuActivity` and navigate the user to it on valid username/password
  - Show error if username/password is incorrect.

# Lesson 7
## Service
  - Create class MyIntentService extends IntentService
  - Implement default constructor
  
      ```java
      public MyIntent() {
        super("MyService");
      }
      ```
  - Define TAG
  
    ```java
    public static final String TAG = MyIntentService.class.getSimpleName();
    ```
  - Override onHandleIntent(Intent intent)
  
    ```java
    for (int i = 0; i < 5; i++) {
      try {
        Log.d(TAG, "Sleeping for 0.5 seconds " + i);
        Thread.sleep(500);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    ```
  - Declare service in AndroidManifest.xml
  
    ```xml
    <service android:name=".service.MyIntentService" />
    ```
  - Create new activity MyServiceActivity.java
  - Add button btn_start_service in activity_my_service.xml
  
    ```xml
    <Button
      android:id="@+id/btn_start_service"
      android:text="@string/btn_start_service"
      android:layout_width="match_parent"
      android:layout_height="wrap_content" />
    ```
  - onCreate
  
    ```java 
    findViewById(R.id.btn_start_service).setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        Intent intent = new Intent(MyServiceActivity.this, MyIntentService.class);
        startService(intent);
      }	
    ;})
    ```
  - Add new menu item in MenuActivity.java
  
    ```java
    new MenuItem(MyServiceActivity.class, "Service Demo")
    ```
  
# Lesson 8
## MediaPlayer
- Update Gradle (2.14.1)
- Create package "media.player"
- New Empty Activity "MediaPlayerActivity"
- In MenuActivity, add New MenuItem "Media Player Demo"
- activity_media_player.xml
  - Change root to ScrollView with a LinearLayout
  - Add buttons
    - Play
    - Pause
    - Stop

 ```xml
 <?xml version="1.0" encoding="utf-8"?>

<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="wrap_content">

    <LinearLayout
        android:id="@+id/activity_media_player"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:paddingBottom="@dimen/activity_vertical_margin"
        android:paddingLeft="@dimen/activity_horizontal_margin"
        android:paddingRight="@dimen/activity_horizontal_margin"
        android:paddingTop="@dimen/activity_vertical_margin"
        tools:context="meetup.droid.miidroid.media.player.MediaPlayerActivity">

        <Button
            android:id="@+id/btn_play"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="@string/play_foreground" />

        <Button
            android:id="@+id/btn_pause"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="@string/pause" />

        <Button
            android:id="@+id/btn_stop"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="@string/stop" />

    </LinearLayout>
</ScrollView>
```

- Create "raw" folder under res
- Put music file into folder
- In MediaPlayerActivity
  - onClickListener
  - Implementing buttons

```java
private MediaPlayer mMediaPlayer;

@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_media_player);

    findViewById(R.id.btn_play).setOnClickListener(this);
    findViewById(R.id.btn_stop).setOnClickListener(this);
    findViewById(R.id.btn_pause).setOnClickListener(this);

    mMediaPlayer = MediaPlayer.create(this, R.raw.viviq);
}

@Override
public void onClick(View v) {
    switch (v.getId()) {
        case R.id.btn_play:
            playMusic();
            break;
        case R.id.btn_pause:
            pauseMusic();
            break;
        case R.id.btn_stop:
            stopMusic();
            break;
    }
}

private void stopMusic() {
    mMediaPlayer.stop();
    try {
        //This is a blocking operation, avoid calling it on UI thread
        mMediaPlayer.prepare();
    } catch (IOException e) {
        Log.e("MediaPlayerActivity", "Prepare exception", e);
    }
}

private void pauseMusic() {
    mMediaPlayer.pause();

}

private void playMusic() {
    mMediaPlayer.start();
}

@Override
protected void onStop() {
    super.onStop();
    if (mMediaPlayer != null) {
        mMediaPlayer.release();
    }
}
```
