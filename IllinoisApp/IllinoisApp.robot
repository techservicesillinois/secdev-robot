*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with
...   RobotFramework, AppiumLibrary, and Emulated Android Phone

Library     Dialogs     # Built-in, but requires tkinter as part of Python install.
Library     AppiumLibrary
Library     String

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    alias=MyApp1    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity
        ...    allowInvisibleElements=true    ignoreUnimportantViews=false

Close the Application
    Close All Applications

*** Test Cases ***
Validate Open Application
    Open the Application
    Close the Application
