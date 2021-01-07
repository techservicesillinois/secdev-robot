*** Settings ***
Documentation  Test Cases for evaluation of a proper setup with
...   RobotFramework, AppiumLibrary, and Emulated Android Phone

...   Various Click styles are presented for examples
...
...   A screenshot will be saved to the working directory before closing

Library     Dialogs     # Built-in, but requires tkinter as part of Python install.
Library     AppiumLibrary
Variables    input.yaml
*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub
${LOCAL_APPIUM_SERVER1}    http://localhost:4723/wd/hub
*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    alias=MyApp1    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.covid    appActivity=edu.illinois.covid.MainActivity

Open the Browser

    Open Application    ${LOCAL_APPIUM_SERVER1}    alias=MyApp2    platformName=android    platformVersion=9.0
       ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=com.android.chrome    appActivity=org.chromium.chrome.browser.ChromeTabbedActivity

Start the Application
    Sleep  5s
    #Wait Until Page Contains Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button
    Click Element    accessibility_id=Get Started
    Sleep  5s
    #Enable Location
    Click Element    accessibility_id=Enable Location Services

    Sleep  5s
    # pop up Allow
    Wait Until Page Contains Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout
    Click Element At Coordinates    784    1050
    #Confirm google location pop up
    #Wait Until Page Contains Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout
    #Click OK to location
    #Click Element    id=android:id/button1
    # who are you screen
	Sleep  5s
	#Select University student role
	Click Element    accessibility_id=unchecked, checkbox, University Student

    # Click on Confirm button
    Click Element    accessibility_id=Confirm

Proceed with NO Netid
    Sleep  5s
    #Click Element    accessibility_id=Not right now, Skip verification
    Click Element At Coordinates    517    1697
    Sleep  5s



Covid onboarding screen

    Sleep  5s
    #Click on continue in Covid onboarding screen
    Click Element    accessibility_id=Continue
    #Click Element  xpath = //android.widget.Button[@content-desc="Continue"]
    #Click Element At Coordinates    526    1673

    #How to work screens
    Sleep  5s
    Click Element    accessibility_id=Next

    #Consent screen Exposure Notification
    Sleep  5s
    #${response}  Get Text  accessibility_id = [contains(@text,'Exposure Notifications')]
    #${response}  Get Text  xpath = /android.view.View[@content-desc="Consent for COVID-19 features, Header 1"] [contains(@text,'Consent for COVID-19 features')]
    # Toggle on the 1st consent button
    Click Element At Coordinates    895    1525
    #Click Element    accessibility_id="unchecked, checkbox, I consent to participate in the Exposure Notification System (requires Bluetooth to be ON)."
    #Click Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.view.View[3]
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep  5s
    #scroll down and tap on Next button
    Click Element    accessibility_id=Next

#All set
    #${response}  Get Text  xpath = //android.view.View[@content-desc="You’re all set!, Header 1"] [contains(@text,'You’re all set!')]
    Sleep  5s
    Click Element    accessibility_id=Get started

Safer Illinois home screen Your Care Team
    Sleep  5s
    Wait Until Page Contains Element  accessibility_id=Safer Illinois Home    timeout=None    error=None
    #${response}  Get Text  xpath = //android.view.View[contains(@content-desc,"Your Health"]
    # Tap on Your care team on Home screen
    Click Element At Coordinates    718    617
    sleep  5s
    Wait Until Page Contains Element  accessibility_id=Call 18336735669    timeout=None    error=None
    #accessibility_id=contains(@content-desc,'Your Health')]
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View [contains(@text,'Safer Illinois Home')]
    #${response}  Get Text  xpath = 	/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button[2] [contains(@text,'Your Care Team')]
    #Click Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button[2]
    Swipe    500     100     500    0  1000
    Swipe    500     100     500    0  1000
    Click Element At Coordinates    956    1416
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element At Coordinates    956    1640
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.view.View[4] [contains(@text,'Members of the OSF OnCall Connect care team')]
    Click Element    accessibility_id=Back

Safer Illinois home screen Wellness
    Sleep  5s
    Click Element  accessibility_id=COVID-19 Wellness Answer Center
    Sleep  5s
    Wait Until Page Contains Element  accessibility_id=COVID-19 Wellness Center    timeout=None    error=None
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View [contains(@text,'COVID-19 Wellness Center')]
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[1] [contains(@text,'COVID Wellness Answer Center for assistance.')]
    Click Element    accessibility_id=Back

Safer Illinois home Find test location
    Sleep  5s
    Click Element  accessibility_id=Find test locations
    Wait Until Page Contains Element  accessibility_id=Test Locations
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View/android.view.View [contains(@text,'Test Locations')]
    #Click Element  accessibility_id=County dropdown Champaign County
    #Click Element At Coordinates    980 293

    Click Element At Coordinates    971    511
    Sleep  5s
    Click Element  accessibility_id=All Providers
    Sleep  5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    #Sleep  5s
    #Wait Until Page Contains Element  accessibility_id=State Farm Center 1800 S. First St., Champaign, Il Short wait time
    Click Element    accessibility_id=Back

Safer Illinois home screen County Guidelines
    Sleep  5s
    #scroll down and tap on Next button
    Click Element At Coordinates    299    554
    Wait Until Page Contains Element  accessibility_id=Champaign, Illinois County
    #Click Element    accessibility_id=County Guidelines
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View [contains(@text,'Safer Illinois Home')]
    #County Guidelines
    #Click Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button[1]
    #Swipe    500     100     500    0  1000
    #${response}  Get Text  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View/android.view.View [contains(@text,'There are no specific guidelines for your status in this county.')]
    Click Element    accessibility_id=Back

Setting screen with NO NETID
    #Log to Console    ${NETID}
    #Log to Console    ${PWD}
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
#Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.webkit.WebView/android.view.View[2]/android.view.View[2]/android.view.View[3]/android.widget.Button


Failure Login credentials NETID

    #Log to Console    ${NETID}
    #Log to Console    ${PWD}
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
     #Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.webkit.WebView/android.view.View[2]/android.view.View[2]/android.view.View[3]/android.widget.Button
     #Click Element   id=submit_button

     #Sleep  5s
#Close the Keyboard

#Go back to Safer App
    Press Keycode    4
    Press Keycode    4
    Sleep  5s
# Swtich back to Native app
    Switch To Context     ${contexts}[0] 
    ${current}        Get Current Context
    Log To Console       ${current}  


Setting screen with NO NETID validating elements in setting screen

# Verify who are
    #Sleep     5s
    #Click Element  	accessibility_id=Settings
    Sleep     5s
    Click Element  	accessibility_id=Who you are
    Sleep     5s
    #${User_role}    Get Element Attribute  accessibility_id=checked, checkbox, University Student content-desc
    #Log To Console  ${User_role}
    Element Should Be Enabled    accessibility_id=checked, checkbox, University Student
    Click Element  	accessibility_id=Back
    Sleep    5s
    Page Should Contain Element    accessibility_id=Settings
    Sleep   5s

    #privacy screen
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep  5s
    Click Element  	accessibility_id=Privacy Statement
    Sleep  5s
    Page Should Contain Element    accessibility_id=Privacy Statement
    Sleep  10s
    Click Element  	accessibility_id=Back
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Click Element  	accessibility_id=Submit Feedback
    Sleep  5s
    Page Should Contain Element    accessibility_id=Provide Feedback
    Sleep  5s
    Click Element  	accessibility_id=Back



Close the Application
#    Capture Page Screenshot
    Close Application




*** Test Cases ***
Valid Open and Close Test location
    Open the Application
    Start the Application
    Proceed with NO Netid
    Covid onboarding screen
    #Safer Illinois home screen Your Care Team
    Safer Illinois home Find test location
    #Safer Illinois home screen Wellness
    #Safer Illinois home screen Your Care Team
    #Safer Illinois home screen County Guidelines
    Close the Application

Valid Wellness screen
     Open the Application
     Start the Application
     Proceed with NO Netid
     Covid onboarding screen
     #Safer Illinois home Find test location
     Safer Illinois home screen Wellness
     #Safer Illinois home screen Your Care Team
     #Safer Illinois home screen County Guidelines
     Close the Application

Valid Your Care Team
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       #Safer Illinois home Find test location
       #Safer Illinois home screen Wellness
       Safer Illinois home screen Your Care Team
       #Safer Illinois home screen County Guidelines
       Close the Application

Valid County Guidelines
       #Open the Browser
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       #Safer Illinois home Find test location
       #Safer Illinois home screen Wellness
       #Safer Illinois home screen Your Care Team
       Safer Illinois home screen County Guidelines
       #Setting screen with NO NETID
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
       Covid onboarding screen
       Failure Login credentials NETID
       Close the Application

Validating elements on setting screen
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       Setting screen with NO NETID validating elements in setting screen
       Close the Application

Demo Test case
       Open the Application
       Start the Application
       Proceed with NO Netid
       Covid onboarding screen
       Safer Illinois home screen Your Care Team
       Safer Illinois home screen Wellness
       Safer Illinois home Find test location
       Safer Illinois home screen County Guidelines
       Failure Login credentials NETID
       Setting screen with NO NETID validating elements in setting screen
       Close the Application

