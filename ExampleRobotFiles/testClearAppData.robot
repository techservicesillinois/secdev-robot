*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with 
...   RobotFramework, AppiumLibrary, and Emulated Android Phone
...   
...   This will reset all chosen App data

Library     AppiumLibrary  

Resource    testClearUtilities.resource

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0    
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=com.android.settings    appActivity=com.android.settings.Settings

Go to Apps and Notifications ${app}
    Click Text    Apps & notifications
    Sleep  5s
    ${recent}    Run Keyword And Return Status  Page Should Contain Text    ${app}
    # Click App IF it is in the Recent List, ELSE go to Chosen App logic
    Run Keyword If      ${recent} == True     
    ...     Click Text   ${app}     
    ...     ELSE    
    ...     Go to Chosen App ${app}

Go to Chosen App ${app}
    Click Text    See all
    # Scroll Down to the App
    Sleep   5s
    FOR    ${count}    IN RANGE    10
        ${value}    Run Keyword And Return Status  Page Should Contain Text    ${app}
        Exit For Loop If    ${value} == True
        Swipe    500     1600     500    500  1000
    END
    # Click the App if it exists
    Run Keyword If      ${value} == True     
    ...     Click Text   ${app}     
    ...     ELSE    
    ...     Log to Console  **** ERROR: ${app} NOT PRESENT! ****

Force Stop Chosen
    Sleep   5s
    Click Element   id=com.android.settings:id/button2_negative
    Sleep   5s
    Click Element At Coordinates    900    1050 
    Sleep   5s
    
Clear Chosen Data
    # Go to Storage
    Click Text    Storage
    Sleep  5s
    # Clear Cache
    Click Element   id=com.android.settings:id/button2_negative
    Sleep   5s
    # Clear Storage
    Click Element   id=com.android.settings:id/button1_negative
    Sleep   5s
    Click Element At Coordinates    880    1060 
    Sleep   5s
    
    # Clear All Data
    ${value}    Run Keyword And Return Status    Page Should Contain Text    CLEAR ALL DATA
    Run Keyword If      ${value} == True     Click Text   CLEAR ALL DATA
    Sleep   5s
    Click Element At Coordinates    880    1060 
    Sleep   5s

Close the Application
    Capture Page Screenshot
    Close Application 

*** Test Cases ***

Valid Open and Close
    Open the Application
    Close the Application

Clear All Chosen Related Data 
    FOR	${app}	IN	@{CLEAR_APPS}
        Log to Console  ${\n}Clearing ${app}
        Open the Application
        Go to Apps and Notifications ${app}
        Force Stop Chosen
        Clear Chosen Data
        Close the Application
    END
    Log to Console  ${\n}Clearing Complete${\n}
