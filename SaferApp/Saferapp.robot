*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with
...   RobotFramework, AppiumLibrary, and Emulated Android Phone

...   Various Click styles are presented for examples
...
...   A screenshot will be saved to the working directory before closing

Library     Dialogs     # Built-in, but requires tkinter as part of Python install.
Library     AppiumLibrary
Library    String
Variables    input.yaml
*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub
${LOCAL_APPIUM_SERVER1}    http://localhost:4723/wd/hub
*** Keywords ***
Open the Application Noreset
    Open Application    ${LOCAL_APPIUM_SERVER}    alias=MyApp1    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.covid    appActivity=edu.illinois.covid.MainActivity
        ...    noReset=true    fullReset=false    desiredCapabilities=lastOpenedActivity
        ...    allowInvisibleElements=true    ignoreUnimportantViews=false

Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    alias=MyApp1    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.covid    appActivity=edu.illinois.covid.MainActivity
        ...    allowInvisibleElements=true    ignoreUnimportantViews=false




Start the Application
    Sleep  10s
    Capture Page Screenshot     filename=SaferApp01.png

    Click Element    accessibility_id=Get Started
    Sleep  5s
    Capture Page Screenshot     filename=SaferApp02.png
    Sleep  5s
    Page Should Contain Element    accessibility_id = Information Usage Disclosure, Header 1
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=unchecked, checkbox, Acknowledge
    Click Element    accessibility_id=Next
    Sleep  15s

    #Enable Location
    Click Element    accessibility_id=Continue
    Sleep  15s

    Click Element At Coordinates    775    1042
   # who are you screen
	Sleep  10s
	#Select University student role
	Capture Page Screenshot     filename=SaferApp03.png
	Click Element    accessibility_id=unchecked, checkbox, University Student

    # Click on Confirm button
    Click Element    accessibility_id=Confirm
    Sleep  10s
    Capture Page Screenshot     filename=SaferApp04.png

Proceed with NO Netid
    Sleep  5s

    Click Element At Coordinates    517    1697
    Sleep  5s

    Click Element    accessibility_id=Continue
    Click Element    accessibility_id=Next
    #Consent screen Exposure Notification
    Sleep  5s
    # Toggle on the 1st consent button
    Click Element At Coordinates    895    1525
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep  5s
    #scroll down and tap on Next button
    Click Element    accessibility_id=Next
    Sleep  5s
    Click Element    accessibility_id=Get started
    Sleep  5s
    Wait Until Page Contains Element  accessibility_id=Safer Illinois Home    timeout=None    error=None
    #Your care team screen
    Click Element At Coordinates    757    531
    sleep  5s
    Wait Until Page Contains Element  accessibility_id=Your Care Team    timeout=None    error=None

    Swipe    500     100     500    0  1000
    Swipe    500     100     500    0  1000
    Click Element At Coordinates    956    1416
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element At Coordinates    956    1640
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000

    Click Element    accessibility_id=Back
    #County Guidelines screen
    Click Element At Coordinates    956    1640289    557
    Sleep    5s
    Wait Until Page Contains Element  accessibility_id=Champaign, Illinois County
    Sleep    5s
    Click Element    accessibility_id=Back
    #Test location screen
    Sleep  5s
    Click Element  accessibility_id=Find test locations
    Wait Until Page Contains Element  accessibility_id=Test Locations
    Click Element At Coordinates    971    511
    Sleep  5s
    Click Element  accessibility_id=All Providers
    Sleep  5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000

    Click Element    accessibility_id=Back
    #Wellness Answer Center
    Sleep  5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element  accessibility_id=COVID-19 Wellness Answer Center
    Sleep  10s
    Wait Until Page Contains Element  accessibility_id=COVID-19 Wellness Center    timeout=None    error=None
    Click Element    accessibility_id=Back



Proceed with Netid

    Sleep    15s

    # get all the context displayed on the Shib screen
    ${contexts}    Get Contexts

    #Get the current active context Native app
    ${current}    Get Current Context

    # Displays Webview
    Switch To Context    ${contexts}[1]
    #Log To Console    ${contexts}[1]
    Sleep    10s
    ${current}        Get Current Context

    Input Text    id=j_username    ${NETID}
    Input Password  id=j_password   ${PWD}
    #Close the keyboard
    Press Keycode    4
    #Tap on Login button
    Press Keycode    66
    #Close the keyboard
    Sleep  10s
    # Swtich back to Native app
    Switch To Context     ${contexts}[0] 
    Sleep  10s
    Capture Page Screenshot     filename=SaferApp05.png
    Covid onboarding screen

User already loggedin
    Sleep    5s
    Click Element    accessibility_id=Log in with NetID
    Sleep    10s
    ${Value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Continue
    Run Keyword If   ${Value}
    ...    Covid onboarding screen
    ...    ELSE
    ...    Proceed with Netid

CheckQRCodeStatus
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element   accessibility_id=Reset my COVID-19 Secret QRcode
    Sleep   5s
    Click Element   accessibility_id=Yes
    Sleep    10s
    Wait Until Page Contains Element    accessibility_id=Continue  timeout=120s
    Capture Page Screenshot     filename=SaferApp09.png
    Click Element    accessibility_id=Continue

Covid onboarding screen

    #How to work screens
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep    5s
    Capture Page Screenshot     filename=SaferApp06.png
    Click Element    accessibility_id=Next

    #Consent screen Exposure Notification
    Sleep  5s
    # Toggle on the 1st consent button
    Capture Page Screenshot     filename=SaferApp07.png
    Click Element At Coordinates    895    1525
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000

    Sleep  5s
    #scroll down and tap on Next button
    Click Element    accessibility_id=Next
    Sleep  5s
    Capture Page Screenshot     filename=SaferApp08.png
    Sleep   10s
    ${TValue}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Transfer Later
    Sleep  5s

    Run Keyword If   ${TValue}
    ...    CheckQRCodeStatus
    ...    ELSE
    ...    Click Element    accessibility_id=Continue
    Sleep    5s
    Capture Page Screenshot     filename=SaferApp10.png
    Click Element    accessibility_id=Get started

Safer app with symptoms checkin

    Sleep  10s
    Capture Page Screenshot     filename=SaferApp11.png
    Click Element At Coordinates    442    968
    Sleep  20s
    Capture Page Screenshot     filename=SaferApp12.png
    Click Element    accessibility_id=unchecked, checkbox, Fever or chills
    Click Element    accessibility_id=unchecked, checkbox, Fatigue
    Click Element    accessibility_id=unchecked, checkbox, Headache
    Click Element    accessibility_id=unchecked, checkbox, New loss of taste or smell
    Click Element    accessibility_id=unchecked, checkbox, Cough
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Submit
    Sleep  10s
    Click Element    accessibility_id=OK
    Sleep  10s

Safer Add Test Result
    Sleep    10s
    Click Element At Coordinates    384    1255
    Sleep    5s
    Capture Page Screenshot     filename=SaferApp13.png

    Wait Until Page Contains Element    accessibility_id=Healthcare Provider    timeout=None    error=None
    Click Element    accessibility_id=Select a provider
    Sleep    5s
    Click Element    accessibility_id=McKinley Health Center / SHIELD
    Sleep    5s
    ${passed}=    Run Keyword And Return Status    Page Should Contain Element    accessibility_id = Test results from this health care provider will automatically appear if you have consented to Health Provider Test Results in settings and you are connected with your NetID.
    Sleep    5s
    Run Keyword If   ${passed}    Click Element    accessibility_id=McKinley Health Center / SHIELD
    Sleep    5s
    Click Element    accessibility_id=OSF Health Care
    Sleep    5s
    Click Element    accessibility_id=Retrieve Results
    Sleep    5s
    ${contexts}    Get Contexts
    Sleep    10s
    Switch To Context     ${contexts}[1]
    Sleep    10s
    Press Keycode    4
    Switch To Context     ${contexts}[0]
    Sleep   5s
    Click Element    accessibility_id=Back

Safer Illinois home screen Your Care Team
    Sleep  5s
    Wait Until Page Contains Element  accessibility_id=Safer Illinois Home    timeout=None    error=None
    # Tap on Your care team on Home screen
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Capture Page Screenshot     filename=SaferApp14.png
    Click Element At Coordinates    805    1104
    Sleep  5s
    Capture Page Screenshot     filename=SaferApp15.png
    Wait Until Page Contains Element  accessibility_id=Call 18336735669    timeout=None    error=None
    Swipe    500     100     500    0  1000
    Swipe    500     100     500    0  1000
    Capture Page Screenshot     filename=SaferApp16.png
    Click Element At Coordinates    956    1416
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element At Coordinates    956    1640
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Back

Safer Illinois home screen Wellness
    Sleep  5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element  accessibility_id=COVID-19 Wellness Answer Center
    Sleep  10s
    Capture Page Screenshot     filename=SaferApp17.png
    Wait Until Page Contains Element  accessibility_id=COVID-19 Wellness Center    timeout=None    error=None
    Click Element    accessibility_id=Back

Safer Illinois home Find test location
    Sleep  5s
    Click Element  accessibility_id=Find test locations
    Sleep   5s
    Capture Page Screenshot     filename=SaferApp18.png
    Wait Until Page Contains Element  accessibility_id=Test Locations
    Click Element At Coordinates    971    511
    Sleep  5s
    Click Element  accessibility_id=All Providers
    Sleep  5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Capture Page Screenshot     filename=SaferApp19.png
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Back

Safer Illinois home screen County Guidelines
    Sleep  5s
    #scroll down and tap on Next button
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element At Coordinates    278    1084
    Sleep    5s
    Capture Page Screenshot     filename=SaferApp20.png
    Wait Until Page Contains Element  accessibility_id=Champaign, Illinois County
    #County Guidelines
    Click Element    accessibility_id=Back

Setting screen with NO NETID

	Sleep  5s
    # Tap on Settings icon
	Click Element  	accessibility_id=Settings
    # Tap on connect your netid on setting screen
    Sleep  5s
    Click Element  	accessibility_id=Connect your NetID
    # Shib page displays
    Sleep   10s
    # get all the context displayed on the Shib screen
    ${contexts}    Get Contexts
    # Print the content in cammand line ie Native app and Webview chrome
    Log To Console    ${contexts}
    #Get the current active context Native app
    ${current}    Get Current Context
    # Result of current is Native app
    Log To Console    ${current}
    # Context [1]  is Webview chrome
    Log To Console    ${contexts}[1]
    # Displays Webview
    Switch To Context    ${contexts}[1]
     #Log To Console    ${contexts}[1]
     ${current}        Get Current Context
     Log To Console      ${current}  
     Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.view.ViewPager/android.widget.FrameLayout/android.widget.Button
     Sleep    5s
     Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.view.ViewPager/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.Button[1]
     Sleep    5s
     Input Text    id=j_username    ${NETID}
     Input Password  id=j_password   ${PWD}
    #Close the Keyboard
    Press Keycode    4
    #Go back to Safer App
    Press Keycode    4
    Sleep  5s
    # Swtich back to Native app
    Switch To Context     ${contexts}[0] 
    ${current}        Get Current Context
    Log To Console       ${current}  

BuildingAccessDeny

    Sleep    5s
    Click Element    accessibility_id=Show Status Card
    Sleep    10s
    ${Deny}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=DENIED
    Sleep    5s
    Swipe    880     1298     240    1244  1000
    ${Orange}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Orange, Test Required
    Sleep    5s
    Click Element    accessibility_id=Close

BuildingAccessGrant

    Sleep    5s
    Click Element    accessibility_id=Show Status Card
    Sleep    10s
    ${Access}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=GRANTED
    Sleep    5s
    Swipe    880     1298     240    1244  1000
    ${Yellow}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Yellow, Recent Negative Test
    Sleep    5s
    Click Element    accessibility_id=Close

Show Staus Card
    Sleep    10s
    Swipe    500     1300     500    0  1000
    Sleep    15s
    ${title}=  Get Element Attribute    class=android.widget.ImageView  content-desc
    Log to Console    ${title}
    ${Value}    Run Keyword And Return Status    Should Contain    ${title}    Orange
    Run Keyword If   ${Value}
    ...    BuildingAccessDeny
    ...    ELSE
    ...    BuildingAccessGrant
    Sleep    5s

Status Change Yellow
    Sleep    30s
    Click Element    accessibility_id=See Next Steps
    Sleep    5s
    Click Element    accessibility_id=Find location
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    10s
    Swipe    500     1300     500    0  1000
    BuildingAccessGrant

Status Change Orange
    Sleep    30s
    Click Element    accessibility_id=See Next Steps
    Sleep    5s
    Click Element    accessibility_id=Get in Touch with Care Team
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    10s
    Swipe    500     1300     500    0  1000
    BuildingAccessDeny



    #Click Element    class=android.widget.TextView

#FIXME: Once we get correct TEXT and ID attributes
Action Status Update
    Sleep    15s
    Page Should Contain Element    class=//android.view.View[1]
    ${HealthValue}=  Get Element Attribute    accessibility_id=View Health History   content-desc
    Log to Console    ${HealthValue}
    Sleep    5s
    ${HValue}    Run Keyword And Return Status    Should Contain    ${HealthValue}    View Health History
    Sleep    5s
    ${LoctionValue}=  Get Element Attribute    accessibility_id=Find test locations   content-desc
    Log to Console    ${LoctionValue}
    Sleep    5s
    ${LValue}    Run Keyword And Return Status    Should Contain    ${LoctionValue}    Find test locations
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Click Element At Coordinates    278    1101
    Sleep    5s
    ${CountyValue}=  Get Element Attribute    class=android.view.View    content-desc
    Log to Console    ${CountyValue}
    ${CValue}    Run Keyword And Return Status    Should Contain    ${CountyValue}     Yellow, Recent Negative Test
    Click Element    accessibility_id=Back
    Sleep    5s

Failure Login credentials NETID

	Sleep  5s
    # Tap on Settings icon
	Click Element  	accessibility_id=Settings
    # Tap on connect your netid on setting screen
    Sleep  5s
    Click Element  	accessibility_id=Connect your NetID
    # Shib page displays
    Sleep   10s
    # get all the context displayed on the Shib screen
    ${contexts}    Get Contexts
    # Print the content in cammand line ie Native app and Webview chrome
    Log To Console    ${contexts}
    #Get the current active context Native app
    ${current}    Get Current Context
    # Result of current is Native app
    Log To Console    ${current}
    # Context [1]  is Webview chrome
    Log To Console    ${contexts}[1]
    # Displays Webview
    Switch To Context    ${contexts}[1]
     #Log To Console    ${contexts}[1]
     ${current}        Get Current Context
     Log To Console      ${current}  
     Input Text    id=j_username    asdasdas
     Input Password  id=j_password   poewdfdfg
    #Tap on Login button
     Press Keycode    66
    #Close the keyboard
     Press Keycode    4
     Sleep  5s
     Swipe    500    400    500    1300    1000
     Swipe    500    400    500    1300    1000
     Sleep  5s
    #Go back to Safer App
    Press Keycode    4
    Press Keycode    4
    Sleep  5s
    # Swtich back to Native app
    Switch To Context     ${contexts}[0] 
    ${current}        Get Current Context
    Log To Console       ${current}  

Setting screen with NETID validating elements in setting screen

    # Verify who are
    Click Element  	accessibility_id=Settings
    Sleep     5s
    Capture Page Screenshot     filename=SaferApp21.png
    Click Element  	accessibility_id=Who you are
    Sleep     5s
    #Log To Console  ${User_role}
    Element Should Be Enabled    accessibility_id=checked, checkbox, University Student
    Click Element  	accessibility_id=Back
    Sleep    5s
    Page Should Contain Element    accessibility_id=Settings
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Capture Page Screenshot     filename=SaferApp22.png
    Element Should Be Enabled    accessibility_id=checked, checkbox, COVID-19 notifications
    Sleep    5s
    Element Should Be Enabled    accessibility_id=checked, checkbox, Exposure Notifications
    Sleep    5s
    Element Should Be Enabled    accessibility_id=checked, checkbox, Health Provider Test Results
    #privacy screen
    Swipe    500     1000     500    600  1000
    Sleep  5s
    Capture Page Screenshot     filename=SaferApp23.png
    Click Element  	accessibility_id=Privacy Statement
    Sleep  5s
    Capture Page Screenshot     filename=SaferApp24.png
    Page Should Contain Element    accessibility_id=Privacy Statement
    Sleep  10s
    Click Element  	accessibility_id=Back
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element  	accessibility_id=Personal Info
    Sleep  5s
    Capture Page Screenshot     filename=SaferApp25.png
    Page Should Contain Element    accessibility_id=mmerit
    Click Element  	accessibility_id=Back
    Sleep    10s
    Click Element  	accessibility_id=Submit Feedback
    Sleep  10s
    Click Element  	accessibility_id=Back

Clear Browser Cachea
    Close Browser

Close the Application
#    Capture Page Screenshot
    Close All Applications

*** Test Cases ***

Clear Chrome Browser Cache
    Open the Browser
    clear browser cachea

Validate Acknowledgement Screen
    Open the Application
    Start the Application
    Close the Application

Valid Status User Yellow
    Open the Application Noreset
    #Open the Application
    #Start the Application
    #User already loggedin
    Status Change Yellow
    Close the Application

Valid Status User Orange
    Open the Application Noreset
    #Open the Application
    #Start the Application
    #User already loggedin
    Status Change Orange
    Close the Application



#DEMO
Valid Screenshot Result
    Open the Application
    Start the Application
    User already loggedin
    Safer Add Test Result
    Safer Illinois home Find test location
    Safer app with symptoms checkin
    Safer Illinois home screen County Guidelines
    Safer Illinois home screen Your Care Team
    Safer Illinois home screen Wellness
    Show Staus Card
    Setting screen with NETID validating elements in setting screen
    Close the Application

Valid Status Result
    Open the Application
    Start the Application
    Proceed with Netid
    Covid onboarding screen
    Show Staus Card
    Close the Application

Checking User already loggedin
    Open the Application
    Start the Application
    User already loggedin
    Close the Application

Valid Add Test Result
    Open the Application
    Start the Application
    Proceed with Netid
    Covid onboarding screen
    Safer app with symptoms checkin
    Safer Add Test Result
    Close the Application

Valid Safer app with Netid
    Open the Application
    Start the Application
    Proceed with Netid
    Covid onboarding screen
    Safer Illinois home Find test location
    Safer Illinois home screen County Guidelines
    Safer Illinois home screen Wellness
    Safer Illinois home screen Your Care Team
    Setting screen with NETID validating elements in setting screen
    Close the Application

Valid Wellness screen
     Open the Application
     Start the Application
     Proceed with NO Netid
     Covid onboarding screen
     Safer Illinois home screen Wellness
     Close the Application

Valid Your Care Team
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       Safer Illinois home screen Your Care Team
       Close the Application

Valid County Guidelines
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       Safer Illinois home screen County Guidelines
       Close the Application

Validating Setting screen
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       Setting screen with NO NETID
       Close the Application

Failure path of connect Netid screen
       Open the Application
       Start the Application
       Proceed with NO Netid
       Failure Login credentials NETID
       Close the Application

Validating elements on setting screen
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       Setting screen with NO NETID validating elements in setting screen
       Close the Application

Demo Test case user without login
       Open the Application
       Start the Application
       Proceed with NO Netid
       Setting screen with NO NETID validating elements in setting screen
       Close the Application
