*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with 
...   RobotFramework, AppiumLibrary, and Emulated Android Phone
...   
...   This will verify that a chosen App is present in the list
...   of Applications on the phone

Library     AppiumLibrary  

Resource    testSearchUtilities.resource

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0    
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=com.android.settings    appActivity=com.android.settings.Settings

Search for ${SearchText} ${MaxVal} Times
    Click Text    Apps & notifications
    Sleep   5s

    ${recent}    Run Keyword And Return Status  Page Should Contain Text    ${SearchText}
    # Click to see all applications if SearchText is not present in the recent list
    Run Keyword If      ${recent} == False     
    ...     Click Text    See all  
    Sleep   5s

    Log to Console      **Searching Down for ${SearchText}
    Search Down for ${SearchText} ${MaxVal} Times

    Log to Console      **Searching Up for ${SearchText}
    Search Up for ${SearchText} ${MaxVal} Times

Close the Application
    Capture Page Screenshot
    Close Application 

*** Test Cases ***

Valid Open and Close
    Open the Application
    Close the Application

Search for Installed Applications 
    FOR	${SearchText}	IN	@{SEARCH_APPS}
        Log to Console  ${\n}Searching for ${SearchText}
        Open the Application
        Search for ${SearchText} 10 Times
        Close the Application
    END
    Log to Console  ${\n}Searching Complete${\n}