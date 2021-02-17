*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with 
...   RobotFramework, AppiumLibrary, and Emulated Android Phone
...   
...   This will solve the equation 2+4 and present 6 as the answer
...   
...   Various Click styles are presented for examples
...   
...   Screenshots will be saved through a few methodologies 
...   including the BuiltIn "Capture Page Screenshot" and 
...   using a User created Keyword in an external resource file

Library     AppiumLibrary  

Resource    testCalcUtilities.resource

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

    # Take Screenshots with the builtin Keyword logic
    #   Capture a Screenshot with a Specific Name
    Capture Page Screenshot     filename=SolveEquation.png
    #   Capture a Screenshot with a Variable Set Name
    ${varaibletext}     Set Variable    VariableText
    Capture Page Screenshot     filename=${varaibletext}.png

    # Take Screenshots with the User Defined Keyword logic
    #   Capture a Screenshot with a Specific Name
    Create CustomKeywordText Screenshot
    #   Capture a Screenshot with a Variable Set Name
    ${custom}       Set Variable    OtherCustomKeywordText
    Create ${custom} Screenshot

Close the Application
    Capture Page Screenshot
    Close Application 

*** Test Cases ***
Valid Open and Close the Calculator
    Open the Application
    Enter the Equation
    # Take Screenshots with the User Defined Keyword logic
    #   Capture a Screenshot with a Specific Name
    Create FromTestCases Screenshot
    #   Capture a Screenshot with a Variable Set Name
    ${custom}       Set Variable    OtherFromTestCases
    Create ${custom} Screenshot
    Solve the Equation
    Close the Application

Valid Open and Close no solving
    Open the Application
    Close the Application
