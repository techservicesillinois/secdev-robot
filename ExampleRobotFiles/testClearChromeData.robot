*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with 
...   RobotFramework, AppiumLibrary, and Emulated Android Phone
...   
...   This will reset all Chrome Browser data

Library     AppiumLibrary  

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0    
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=com.android.settings    appActivity=com.android.settings.Settings

Go to All Apps
    Click Element    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.support.v7.widget.RecyclerView/android.widget.LinearLayout[4]
    Sleep  5s
    Click Element At Coordinates    360    1200 
    Sleep  5s

Go to Chrome App
    Click Element   xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[2]/android.support.v7.widget.RecyclerView/android.widget.LinearLayout[5]/android.widget.LinearLayout[1]/android.widget.ImageView
    Sleep  5s

Force Stop Chrome
    Click Element   id=com.android.settings:id/button2_negative
    Sleep  5s
    Click Element At Coordinates    900    1050 
    Sleep  5s
    
Clear Chrome Data
    # Go to App Data
    Click Element At Coordinates    250    1120 
    Sleep  5s
    # Clear Cache
    Click Element   id=com.android.settings:id/button2_negative
    Sleep  5s
    # Clear Storage
    Click Element   id=com.android.settings:id/button1_negative
    Sleep  5s
    # Clear All Data
    Click Element   id=com.android.chrome:id/clear_all_data
    Sleep  5s
    Click Element At Coordinates    880    1060 
    Sleep  5s
    
Close the Application
    Capture Page Screenshot
    Close Application 

*** Test Cases ***

Valid Open and Close
    Open the Application
    Close the Application

Clear All Chrome Related Data
    Open the Application
    Go to All Apps
    Go to Chrome App
    Force Stop Chrome
    Clear Chrome Data
    Close the Application

