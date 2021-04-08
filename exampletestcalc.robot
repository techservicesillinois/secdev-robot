*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with 
...   RobotFramework, AppiumLibrary, and Emulated Android Phone
...   
...   This will solve the equation 2+4 and present 6 as the answer
...   
...   Various Click styles are presented for examples
...   
...   A screenshot will be saved to the working directory before closing

Library     AppiumLibrary  

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0    
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=com.android.calculator2    appActivity=com.android.calculator2.Calculator

Enter the Equation
    Click Element    id=com.android.calculator2:id/digit_2
    Click Element    accessibility_id=plus
    Click Element    xpath=//android.widget.LinearLayout[@content-desc="Numbers and basic operations"]/android.view.ViewGroup[1]/android.widget.Button[4]

Solve the Equation
    Click Element At Coordinates    600    1600 

Close the Application
    Capture Page Screenshot
    Close Application 

*** Test Cases ***
Valid Open and Close the Calculator
    Open the Application
    Enter the Equation
    Solve the Equation
    Close the Application

Valid Open and Close no solving
    Open the Application
    Close the Application
