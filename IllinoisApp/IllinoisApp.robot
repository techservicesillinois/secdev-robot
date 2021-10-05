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
Variables    input.yaml
Library     DateTime
Library     String
Library     Process

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub
@{SEARCH_APPS}    47    31    36    43    43    40

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=11.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity

Open the Application Noreset
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=11.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity
        ...    noReset=true    fullReset=false    desiredCapabilities=lastOpenedActivity
        ...    allowInvisibleElements=true    ignoreUnimportantViews=false


Start the Application

    Sleep  20s
    #Click Element    accessibility_id=Continue
    Click Element    xpath=//android.widget.Button[@content-desc="Continue"]
    Sleep    5s
    Click Element    xpath=//android.view.View[@content-desc="unchecked, checkbox, University student"]
    #Click Element    accessibility_id=unchecked, checkbox, University Student
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep    5s
    Click Element    accessibility_id=Begin
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep   5s
    Click Element    accessibility_id=Continue
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep    10s
    #Click Element    accessibility_id=Save Privacy Level
	Click Element    xpath=//android.widget.Button[@content-desc="Save privacy level"]
    Sleep    5s
    Click Element    accessibility_id=Sign in with NetID
    Sleep    5s
    Proceed with Netid
#    Sleep    5s

User already loggedin
    Sleep    5s
    Click Element    accessibility_id=Log in with NetID
    Sleep    10s
    ${Value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Campus Resources
    Sleep     5s
    Run Keyword If   ${Value}
    ...    Validating Homescreen
    ...    ELSE
    ...    Proceed with Netid

Validating Homescreen
#    Click Element    accessibility_id=Log in with NetID
#    Sleep    5s
#    Proceed with Netid
    Sleep    5s
    Click Element    accessibility_id=Settings
    Sleep    5s
    Page Should Contain Element    accessibility_id=Privacy Center
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Campus Resources
    Run Keyword If   ${value}   Validate blocks
    Sleep    5s
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    xpath=//android.view.View[@content-desc="Events for you"]
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END

    Sleep     5s


    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Student Guide Highlights
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    sleep    5s
    Click Element    accessibility_id=View all events, Tap to view all events
    sleep    5s
    Run Keyword If   ${value} == True
    ...    Click Text    While using the app
    Sleep   15s
    Page Should Contain Element    accessibility_id=Explore
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=Create a poll
    Sleep    5s
    Page Should Contain Element    accessibility_id=Create a Quick Poll
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element At Coordinates    657    1320
    Sleep    5s
    Page Should Contain Element    accessibility_id=Home, Home Page

Saved Event

    Sleep    5s
    Swipe    500     600     500    0  1000
    Swipe    500     600     500    0  1000
    Swipe    500     600     500    0  1000
    sleep    5s
    Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@index,3)]
    sleep    5s
    ${Value}    Set Variable    //*[@class = 'android.view.View' and contains(@index,3)]
    sleep    5s
    ${CDValue}=  Get Element Attribute    xpath=//*[@class = 'android.view.View' and contains(@index,3)]  content-desc
    sleep    5s
    Log To Console    ${CDValue}
    Click Element    xpath=//*[@class = 'android.view.View' and contains(@index,3)]
    Sleep    5s
    ${CDValue1}=  Get Element Attribute    xpath=//*[@class = 'android.view.View' and contains(@index,2)]  content-desc
    Log To Console    ${CDValue1}
    Sleep    5s
    ${TextValue}    Run Keyword And Return Status    Should Contain    ${CDValue}    ${CDValue1}

    Sleep    5s

    Click Element    accessibility_id=Add To Favorites
    Sleep     5s
    Click Element    accessibility_id=View
    Sleep     5s
    Page Should Contain Element    accessibility_id=Saved
    Sleep    5s
    #${Savedvalue}=  Get Element Attribute    class=android.widget.Button  content-desc
    Page Should Contain Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'${CDValue1}')]
###    Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'Ikenberry')]

    Sleep    5s
#    ${SValue}    Run Keyword And Return Status    Should Contain    ${CDValue}    ${Savedvalue}
#    Sleep    5s

Validate poll
    sleep    5s
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Create a poll
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    sleep    5s
    Click Element    accessibility_id=Create a poll
    sleep    5s
    Page Should Contain Element    accessibility_id=Create a Quick Poll
    sleep    5s
    Click Element    xpath=//*[@class = 'android.widget.EditText' and contains(@text,QUESTION)]
    Sleep    10s
    ${entitySearch_Value}    Set Variable    'Asagdsadg'
    Input Text    xpath=//*[@class = 'android.widget.EditText' and contains(@text,QUESTION)]     ${entitySearch_Value}
    #Input Text    xpath=//*[@class = 'android.widget.EditText' and contains(@text,QUESTION)]    fsfsfj
    Sleep    5s
#    Input Password  xpath=${pwval}   ${PWD}
##    ${Question}
##    ${OPtion1}
##    ${OPtion2}
#    ${Qval}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.widget.EditText[1]
#    ${OP1val}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.widget.EditText[2]
#    ${OP2val}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.ScrollView/android.widget.EditText[3]
#    ${TextVal}    Set Variable    A
##    ${value}    Run Keyword And Return Status    Page Should Contain Element    xpath=${Lgval}
##    Input Text    xpath=${idval}    ${NETID}
##    Sleep    5s
##    Input Password  xpath=${pwval}   ${PWD}
##    Click element    xpath=${SCval}
##    Press Keycode    47
##    Sleep     15s
##    Click Element    accessibility_id=Search, Search
##    log to console   ${value}
#    Sleep    5s
#    Click element    xpath=${Qval}
#    Sleep    5s
#
#    Input Text    xpath=${Qval}    ${TextVal}
#    Sleep    20s
#    Click element    xpath=${OP1val}
#    Sleep    10s
#    Input Password  xpath=${OP1val}   ${OPTION1}
#    Sleep  5s
#    Input Text    xpath=${OP2val}    ${OPTION2}
#    Sleep    5s
#    Swipe    500     600     500    0  1000
#    Swipe    500     600     500    0  1000
#    Swipe    500     600     500    0  1000
#    Sleep    5s
#    Click Element    accessibility_id=Start poll!
#    Sleep    5s
#    Click Element    accessibility_id=A, Double tab to select this option
#    Sleep    5s
#    Click Element    accessibility_id=Done Voting
#    Sleep    5s
#    Click Element    accessibility_id=Browse, Browse Page
#    Sleep    5s
#    Click Element    accessibility_id=Quick polls
#    Sleep    5s
#    Page Should Contain Element    accessibility_id=My Polls
#    Sleep    5s
#    Click Element    accessibility_id=End Poll
#    Sleep    5s




Validate blocks
    Page Should Contain Element    accessibility_id=Events
    Page Should Contain Element    accessibility_id=Dining
    Page Should Contain Element    accessibility_id=Athletics
    Page Should Contain Element    accessibility_id=Illini Cash
    Page Should Contain Element    accessibility_id=My Illini
    Sleep    5s


Validating Events
    Sleep    5s
    Page Should Contain Element    accessibility_id=Home, Home Page
    Sleep    5s
    Click Element    accessibility_id=Events
    Sleep    5s
    ${value}    Run Keyword And Return Status    Page Should Contain Text    While using the app
    log to console   ${value}
    Sleep  5s
    Run Keyword If   ${value} == True
    ...    Click Text    While using the app
    Sleep   15s
    Page Should Contain Element    xpath=//android.widget.Button[@content-desc="All Categories, Filter by category"]
    Sleep    5s
    Click Element    xpath=//android.widget.Button[@content-desc="All Categories, Filter by category"]
    Sleep    15s
    Click Element    xpath=//android.widget.Button[@content-desc="Academic"]
    Sleep    5s
    Swipe    500     600     500    0  1000
    Swipe    500     600     500    0  1000
    Sleep    5s
    Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@index,2)]
    sleep    5s
    #${Value}    Set Variable    //*[@class = 'android.view.View' and contains(@index,1)]
    #sleep    5s
    ${CDValue}=  Get Element Attribute    xpath=//*[@class = 'android.view.View' and contains(@index,2)]  content-desc
    sleep    5s
    Log To Console    ${CDValue}
    Sleep    5s
    Click Element    xpath=//*[@class = 'android.view.View' and contains(@index,2)]
    Sleep    5s
    ${CDValue1}=  Get Element Attribute    xpath=//*[@class = 'android.view.View' and contains(@index,2)]  content-desc
    Log To Console    ${CDValue1}
    Sleep    5s
    ${TextValue}    Run Keyword And Return Status    Should Contain    ${CDValue}    ${CDValue1}

    Sleep    5s

    Click Element    accessibility_id=Back

Search Event
    Sleep    15s
    Click Element    accessibility_id=Events
    Sleep    5s
    ${value}    Run Keyword And Return Status    Page Should Contain Text    While using the app
    log to console   ${value}
    Sleep  5s
    Run Keyword If   ${value} == True
    ...    Click Text    While using the app
    Sleep   15s
    Click Element    accessibility_id=Search
    Sleep     5s
    Page Should Contain Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText
    sleep    5s
    Typing word

    Sleep    5s

    Click Element    accessibility_id=Search, Search

    Sleep    25s

Typing word

    FOR	${SearchText}	IN	@{SEARCH_APPS}
        Log to Console  ${\n}Searching for ${SearchText}
        #Open the Application
        Press Keycode    ${SearchText}

    END


Validating Dining
    sleep    5s
    Click Element    accessibility_id=Home, Home Page
    Sleep    5s
    Click Element    accessibility_id=Dining
    Sleep     5s
    ${value}    Run Keyword And Return Status    Page Should Contain Text    While using the app
    log to console   ${value}
    Sleep  5s
    Run Keyword If   ${value} == True
    ...    Click Text    While using the app
    Sleep   15s
    Page Should Contain Element    accessibility_id=All Payment Types, Filter by available payment types
    Sleep     5s
    #Swipe    500     1300     500    0  1000
    Sleep     5s

    #//android.view.View[@index='1']
    #${title}=  Get value     xpath=//android.view.View[@index='5']  content-desc
    #${title}=  Get Element Attribute    xpath=//android.view.View[@index='5']  content-desc
    Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'Ikenberry')]
    Sleep     5s
    Click Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'Ikenberry')]
    Sleep     5s
    Page Should Contain Element    accessibility_id=Ikenberry Dining Center at Ikenberry Commons
    Sleep     5s
    Click Element At Coordinates    987    1166
    #Click Element    accessibility_id=Serving lunch until 2:30PM, activate to show more details
    Sleep     15s
    #Page Should Contain Element    accessibility_id=Accepted payments: ClassicMeal DiningDollars IlliniCash CreditCard GooglePay ApplePay

    Click Element At Coordinates    990    1328
    #Click Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'Accepted payments')]
    #Click Element    accessibility_id=Accepted payments: ClassicMeal DiningDollars IlliniCash CreditCard GooglePay ApplePay
    Sleep    5s
    Swipe    500     1930     500    1190  1000
    Sleep    5s
    #Page Should Contain Element    xpath=//android.view.View[@content-desc="Accepted payments: ClassicMeal DiningDollars IlliniCash CreditCard GooglePay ApplePay "]

    ${date}     Get Current Date
    ${future}      Convert Date      ${date}      result_format=%B %d,%Y %H:%M %p
#    ${MD}      Convert Date      ${date}      result_format=%d
    ${MD}      Convert Date      ${date}          %A, %b %d
    Sleep    5s
    Log To Console    ${MD}
    Sleep    5s
    ${dayValue}=  Get Element Attribute    accessibility_id=${MD}    content-desc
    Log To Console    ${dayValue}
    Sleep    5s
    ${Value}    Run Keyword And Return Status    Should Contain    ${dayValue}    ${MD}
    Sleep    5s
    Click Element    accessibility_id=Breakfast
    Sleep    5s
    Page Should Contain Element    accessibility_id=7:00 AM - 10:00 AM
    Sleep    5s
    Click Element    accessibility_id=Lunch
    Sleep    5s
    Page Should Contain Element    accessibility_id=10:30 AM - 2:30 PM
    Sleep    5s
    Click Element    accessibility_id=Dinner
    Sleep    5s
    Page Should Contain Element    accessibility_id=4:30 PM - 8:30 PM
    Sleep    5s

Validating Groups

    Sleep    30s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Groups
    Sleep    5s
    Click Element    accessibility_id=Search
#    Sleep    5s
    ${EXAMPLE}    Set Variable    sdfsfsfs
#    sleep    5s
#    ${newtestValue}    Convert To Boolean    ${SCvalInput}
#    sleep    5s
#    #Press Keycode    61
#    log to console    ${newtestValue}
#    sleep    5s
#    log to console    ${SCvalInput}
    sleep    5s
    Run Process    java -Dname\=value Example    shell=True    cwd=${EXAMPLE}

    #adb shell input text     "your string"
    #Input Text    xpath=//*[@class = 'android.widget.EditText' and contains(@text,'Search')]    ${newtestValue}
    #android.widget.EditText
    #Page Should Contain Element    xpath=(//android.view.View[@content-desc="University Housing Meal Plan"])[1]
#    Page Should Contain Element    accessibility_id=Create a group
#    Sleep    5s
#    Press Keycode    61
#    sleep    5s
#    Press Keycode    61
#    sleep    5s
#    Press Keycode    61
#    sleep    5s
#    Press Keycode    61
#    sleep    5s
#    Press Keycode    124
#    Sleep    5s
#    #Page Should Contain Element    //*[@class = 'android.widget.EditText' and contains(@text,'NAME FIELD')]
##    @{ROBOTS}    Create List    school    test    test1
##   # @{ROBOTS}=        Bender    Johnny5    Terminator    Robocop
##    FOR    ${robot}    IN    @{ROBOTS}
##        #log to console    ${robot}
##        Input Text    xpath=//*[@class = 'android.widget.EditText' and contains(@text,'Search')]    ${robot}
##        #Press Keycode    ${robot}
##    END
#    #Press Keycode    [45,44,43]
##Press Keycode [45,44,43]
#    #Press Keycode    4
#    sleep    5s
#    #driver.getKeyboard().sendKeys("y");
#    #android:imeOptions="actionDone"
#    #Click Text    Search
#    #Page Should Contain Element    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText
#    #//*[@class = 'android.widget.EditText' and contains(@text,'Search')]
#    #${idval}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText
#    #Input Text    xpath=//hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.EditText    tyrtyrtyfgf
##Click Text    Search
##    Sleep    5s
#    ${value}    Run Keyword And Return Status    Page Should Contain Element    xpath=${idval}
#    log to console   ${value}
#    Sleep    5s
#    Input Text    xpath=${idval}    ${SRCH}fgf
    #xpath=//*[@class = 'android.widget.EditText' and contains(@text,'Search')].
#    Press Keycode    47
#    Press Keycode    46
#    sleep    5s
#    Press Keycode    66
#    #Click Element    xpath=//android.widget.Button[@content-desc="Search"]
##    ${SCvalInput}    Set Variable    school
##    #xpath=//*[@class = 'android.widget.EditText' and contains(@text,'Search')]
##    Input Text    xpath=//*[@class = 'android.widget.EditText' and contains(@text,'Search')]    ${SCvalInput}
#    Sleep    10s

Validating Athletics
    Sleep    5s
    Page Should Contain Element    accessibility_id=Home, Home Page
    Sleep    5s
    Click Element    accessibility_id=Athletics
    Sleep    5s
    Page Should Contain Element    accessibility_id=Athletics
    Sleep    5s
	Click Element    accessibility_id=Teams
    Sleep    5s
    Click Element At Coordinates    965    578
#    Sleep    5s
#	Click Element    accessibility_id=unchecked, checkbox, Football
	Sleep    5s
	Click Element    accessibility_id=Back
	Sleep    5s
    Page Should Contain Element    accessibility_id=FOOTBALL
	Sleep    15s
	Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'Football')]
    #Page Should Contain Element    xpath=//*[@class='android.view.View' and contains(@content-desc,'Because of your interest in: Football')]
    Sleep    5s
	Click Element    accessibility_id=Add To Favorites
    Sleep    5s
    ${value}    Run Keyword And Return Status        Page Should Contain Element    accessibility_id=This starred item has been added to your saved list
    log to console   ${value}
    Sleep    5s
    Run Keyword If   ${value} == True
    ...    Click Element    accessibility_id=Close
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Page Should Contain Element    accessibility_id=Explore Athletics
    Sleep    5s
    Click Element    accessibility_id=View upcoming eventsunchecked, checkbox, Upcoming Events
    Sleep    5s
    ${value}    Run Keyword And Return Status    Page Should Contain Text    While using the app
    log to console   ${value}
    Sleep  5s
    Run Keyword If   ${value} == True
    ...    Click Text    While using the app
    Sleep   15s
    Page Should Contain Element    accessibility_id=Explore
    Sleep    5s
    Page Should Contain Element    accessibility_id=Athletics, Filter by category
    sleep    5s
    Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'Athletics')]
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=View newsunchecked, checkbox, News
    Sleep    5s
    Page Should Contain Element    accessibility_id=Athletics News
    Sleep    5s
    Click Element    accessibility_id=All Athletics News
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep    15s
    Click Element    accessibility_id=Women's Tennis
    Sleep     5s
    Page Should Contain Element    accessibility_id=Women's Tennis
    Sleep     5s
    Page Should Contain Element    xpath=//*[@class = 'android.widget.ImageView' and contains(@content-desc,'TENNIS')]
    ##Page Should Contain Element    xpath=//*[@class = 'android.widget.ImageView' and contains(@content-desc,'WOMEN'S TENNIS')]
    Sleep     5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=View ticketsunchecked, checkbox, Tickets
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=View the Game Day Guideunchecked, checkbox, Game Day Guide
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s






Validating Wallet screen
    Sleep    5s

    Click Element    accessibility_id=Wallet, Wallet Page
    sleep     5s

    Click Element    xpath=(//android.widget.ImageView[@content-desc="View"])[1]
    Sleep   5s

    Page Should Contain Element    accessibility_id=Illini Cash
    sleep    5s
    Click Element    accessibility_id=Add Illini Cash
    Sleep   5s
    Page Should Contain Element    accessibility_id=Add Illini Cash
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=View History
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    xpath=(//android.widget.ImageView[@content-desc="View"])[2]
    Sleep    5s
    Page Should Contain Element    xpath=(//android.view.View[@content-desc="University Housing Meal Plan"])[1]
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=View History
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
#Bus pass
    Click Element    accessibility_id=Use bus pass
    Sleep   5s
    Page Should Contain Element    accessibility_id=MTD Bus Pass
    Sleep    5s

    Click Element    xpath=(//android.widget.Button[@content-desc="close"])[2]
    sleep    5s
    Swipe    722     1316     526    1306  1000
    Sleep    5s
    Click Element    accessibility_id=Use ID
    Sleep     5s
    Page Should Contain Element    accessibility_id=Illini ID
    Sleep     5s
    Page Should Contain Element    accessibility_id=MERIT, MAYA TESTER
    Sleep    5s
    Click Element    xpath=(//android.widget.Button[@content-desc="close"])[2]
#    Swipe    722     1316     526    1306  1000
    Sleep    5s
#    Page Should Contain Element    accessibility_id=Library Card 20111524320117
#    Sleep   5s
#    Click Element    xpath=(//android.widget.Button[@content-desc="close"])[2]
#    Sleep    5s





Validating Illini meal parking feedback
#    Click Element    accessibility_id=Log in with NetID
#    Sleep    5s
#    Proceed with Netid
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=My Illini
    Sleep    20s
    Page Should Contain Element    accessibility_id=My Illini
    Sleep    20s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Illini Cash
    Sleep    5s
    Page Should Contain Element    accessibility_id=Illini Cash
    sleep    5s
    Click Element    accessibility_id=Add Illini Cash
    Sleep   5s
    Page Should Contain Element    accessibility_id=Add Illini Cash
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=View History
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Meal Plan
    Sleep    5s
    Page Should Contain Element    xpath=(//android.view.View[@content-desc="University Housing Meal Plan"])[1]
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=View History
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=State Farm Event Parking
    Sleep    5s
    Page Should Contain Element    accessibility_id=Events
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Provide Feedback
    Sleep   5s
    Page Should Contain Element    accessibility_id=Provide Feedback
    Sleep   5s

Validating Setting
    sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep     5s
    Click Element    accessibility_id=Settings
    sleep    5s
    Page Should Contain Element    accessibility_id=Illinois NetID
	Sleep    5s
    Click Element    accessibility_id=Disconnect your NetID
    # Tapping NO flow
#    sleep    5s
#    Click Element    accessibility_id=No
    #Tapping Yes
    sleep    5s
    Click Element    accessibility_id=Yes
    sleep    5s
    Page Should Contain Element    accessibility_id=Connect your NetID
    sleep    10s
    Click Element    accessibility_id=Connect your NetID
    sleep    10s
    Personal data and Notification





Validating Privacy center
    #validating external links Privacy Center links
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Center
    Sleep    5s
#    Click Element    accessibility_id=Verify your Identity
#    Sleep    5s
#    Page Should Contain Element    accessibility_id=Verify your Identity
##
#    Click Element    accessibility_id=Connect Your NetID
#    Sleep    5s
#    Click Element    accessibility_id=Log in with NetID
#    Proceed with Netid
#    Sleep   5s

    Click Element    accessibility_id=Manage and Understand Your Privacy
    Sleep    5s
    Page Should Contain Element    accessibility_id=Choose Your Privacy Level
    Sleep    5s
    ${title}=  Get Element Attribute    class=android.widget.SeekBar  content-desc
    Log to Console    ${title}
    ${Value}    Run Keyword And Return Status    Should Contain    ${title}    5

    Sleep    5s

    Click Element    accessibility_id=Expand All
    Sleep     5s

    Page Should Contain Element    accessibility_id=Close All
    Sleep   5s
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Student and Community Involvement, Double tap to Hide information
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END

    log to console     new loop
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Close All
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500    600    500    1000    1000
        ...    ELSE
        ...    Exit For Loop
    END
    log to console     loop ended
    Sleep   5s
    Click Element At Coordinates    790    463
    Sleep   5s

#Privacy Level: 4 You can personalize and customize the app. Wifi and Bluetooth location data is stored over time to make recommendations and improve your overall app experience.
    ${title}=  Get Element Attribute    class=android.widget.SeekBar  content-desc
    Log to Console    ${title}
    ${Value}    Run Keyword And Return Status    Should Contain    ${title}    4
    ###Scroll up untill the below element is visible####
    #Page Should Contain Element    accessibility_id=Privacy Level: 4 Let the app work for you. You can access your iCard, save credit cards to make future purchases easier, access health information, and get notifications based on your specific interests.
    Sleep    5s
    Click Element At Coordinates    968    463
    Sleep     5s
    Click Element    accessibility_id=Set my Privacy
    #Sleep     5s
    Personal data and Notification

    #Click Element    accessibility_id=Back
    Sleep    5s

    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Statement
    Sleep   5s
    Wait Until Page Contains Element  accessibility_id=Privacy Statement    timeout=None    error=None
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s




Personal data and Notification
    sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep     5s
    Click Element    accessibility_id=Settings
    sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=Personal Information
    Sleep   5s
    Page Should Contain Element    accessibility_id=Personal Information
    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#    Swipe    527     740     520    1518  1000
#    Sleep    5s
    Page Should Contain Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Personal Information')]
    sleep    5s
    Click Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Personal Information')]

    Sleep   5s
    Page Should Contain Element    accessibility_id=mmerit

    Click Element    accessibility_id=Back
    Sleep    5s
    Page Should Contain Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Who You Are')]
    sleep    5s
    Click Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Who You Are')]

    Sleep    5s
    Page Should Contain Element    xpath=//*[@class = 'android.view.View' and contains(@content-desc,'University Student')]
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Your Interests')]

    Sleep    5s
    Click Element    accessibility_id=unchecked, checkbox, Academic
    Sleep    5s
    Click Element    accessibility_id=unchecked, checkbox, Community
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Your Interests')]

    Sleep    5s
    Page Should Contain Element    accessibility_id=checked, checkbox, Academic
    Page Should Contain Element    accessibility_id=checked, checkbox, Community
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Food Filters')]

    Sleep    5s
    Click Element    accessibility_id=unchecked, checkbox, Vegan

    Click Element    accessibility_id=unchecked, checkbox, Vegetarian
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep   5s
    Click Element    accessibility_id=unchecked, checkbox, Peanuts
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    xpath=//*[@class = 'android.widget.Button' and contains(@content-desc,'Food Filters')]

    Sleep    5s
    Page Should Contain Element    accessibility_id=checked, checkbox, Vegan
    Page Should Contain Element    accessibility_id=checked, checkbox, Vegetarian
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Page Should Contain Element    accessibility_id=checked, checkbox, Peanuts
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Delete my personal data
    Sleep    5s
    Click Element    accessibility_id=unchecked, checkbox, Your interests
    Click Element    accessibility_id=unchecked, checkbox, Food filters

    Sleep    5s
    Click Element    accessibility_id=Delete My Data
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
#    Notification preference
    Click Element    accessibility_id=Notification Preferences
    Sleep    5s
    Page Should Contain Element    accessibility_id=checked, checkbox, Event reminders
    Sleep    5s
    Page Should Contain Element    accessibility_id=checked, checkbox, Athletics updates
    Sleep   5s
    Page Should Contain Element    accessibility_id=checked, checkbox, Dining specials
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Forget all of my information, This will delete all of your personal information that was shared and stored within the app.
    Sleep    5s
    Click Element    accessibility_id=Forget My Information
    Sleep    5s
    Swipe    527     740     520    1518  1000
    Sleep    5s
    Page Should Contain Element    accessibility_id=Privacy Center
    Sleep   5s

Scroll test
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Center
    Sleep    5s
    Click Element    accessibility_id=Manage and Understand Your Privacy
    Sleep    5s
    Page Should Contain Element    accessibility_id=Choose Your Privacy Level
    #Page Should Contain Element    accessibility_id=Privacy Level: 5 Access all features, get connected to campus, and let the app suggest tailored experiences that you and your friends all enjoy.
    Sleep    5s
    Click Element    accessibility_id=Expand All
    Sleep     5s

    Page Should Contain Element    accessibility_id=Close All
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Student and Community Involvement, Double tap to Hide information
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END


Proceed with Netid

    Sleep    15s

    # get all the context displayed on the Shib screen
    ${contexts}    Get Contexts
    Sleep    5s
    #Get the current active context Native app
    ${current}    Get Current Context
    Sleep    10s
    # Displays Webview
#    Switch To Context    ${contexts}[1]
#    #Log To Console    ${contexts}[1]
#    Sleep    10s
#    ${current}    Get Current Context
#    Sleep    15s

    ${idval}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[2]/android.view.View[2]/android.widget.EditText[1]
    ${pwval}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[2]/android.view.View[2]/android.widget.EditText[2]
    ${Lgval}    Set Variable    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View[2]/android.view.View[2]/android.view.View[3]/android.widget.Button

    ${value}    Run Keyword And Return Status    Page Should Contain Element    xpath=${Lgval}
    log to console   ${value}
    Sleep  5s
    Input Text    xpath=${idval}    ${NETID}
    Sleep    5s
    Input Password  xpath=${pwval}   ${PWD}


    #Tap on Login button
    Click Element    xpath=${Lgval}
    #Press Keycode    66
    #Close the keyboard
    Sleep  10s
    # Swtich back to Native app
    #Switch To Context  ${contexts}[0]
    Sleep  15s
    Capture Page Screenshot     filename=SaferApp05.png







StudentGuide screen
    Sleep    10s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Student Guide
    Sleep    5s
    Page Should Contain Element    accessibility_id=Student Guide
    Sleep    5s
###Academic Support

    Click Element    accessibility_id=Books
    Sleep    5s
    Page Should Contain Element    accessibility_id=Books, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Distance learning
    Sleep    5s
    Page Should Contain Element    accessibility_id=Distance learning, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=International education
    Sleep    5s
    Page Should Contain Element    accessibility_id=International education, Heading
    Sleep    5s
    Click Element    accessibility_id=Back

    Sleep    5s
    Click Element    accessibility_id=New student programs
    Sleep    5s
    Page Should Contain Element    accessibility_id=New student programs, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Writing help
    Sleep    5s
    Page Should Contain Element    accessibility_id=Writing help, Heading
    Sleep    5s
    Click Element    accessibility_id=Back

#### Camous Rules and protocol
    Click Element    accessibility_id=COVID-19
    Sleep    5s
    Page Should Contain Element    accessibility_id=COVID-19, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Code of conduct
    Sleep    5s
    Page Should Contain Element    accessibility_id=Code of conduct, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

####Career #####
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Get ready for the job market
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    Sleep    10s
#    Click Element    accessibility_id=Get ready for the job market
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s

###Career & Diversity & inclusion ####

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Support services
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    10s
    Click Element    accessibility_id=Get ready for the job market
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Cultural centers
    Sleep    5s
    Page Should Contain Element    accessibility_id=Cultural centers, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=LGBTQ
    Sleep    5s
	Page Should Contain Element    accessibility_id=LGBTQ, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Support services
    #Click Element    xpath=//android.widget.ImageView[@content-desc="Support centers"]
    Sleep    5s
	Page Should Contain Element    accessibility_id=Support services, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
###Finance & Legal####

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Exercise
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    10s



    Click Element    accessibility_id=Financial support
    Sleep    5s
	Page Should Contain Element    accessibility_id=Financial support, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
#    Click Element    accessibility_id=Jobs
#    Sleep    5s
#    Click Element    accessibility_id=Back

    Click Element    accessibility_id=Legal support
    Sleep    5s
	Page Should Contain Element    accessibility_id=Legal support, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Money management
    Sleep    5s
	Page Should Contain Element    accessibility_id=Money management, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

#####Health and Wellness

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Tips
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    10s

    Click Element    accessibility_id=Exercise
    Sleep    5s
	Page Should Contain Element    accessibility_id=Exercise, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Mental & emotional health
    Sleep    5s
	Page Should Contain Element    accessibility_id=Mental & emotional health, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Nutrition
    Sleep    5s
	Page Should Contain Element    accessibility_id=Nutrition, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Physical health
    Sleep    5s
	Page Should Contain Element    accessibility_id=Physical health, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Tips
    Sleep    5s
	Page Should Contain Element    accessibility_id=Tips, Heading
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

######Involvement############

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Private certified housing
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    10s

    Click Element    accessibility_id=Community engagement
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Socializing
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

#######Living Spaces##########
    Click Element    accessibility_id=General housing information
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Off-campus housing
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Private certified housing
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=University housing
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Religious practice
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
#    Sleep    10s
#    Click Element    accessibility_id=University Housing
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
##########Maps#########

    Sleep    5s
    Click Element    accessibility_id=Campus maps
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

###Religious and Spirituality ###

    Sleep    5s
    Click Element    accessibility_id=Mindful habits
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Quiet space
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Religious organizations
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Religious practice
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s




##### Safety ####

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Travel by car
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    10s

    Sleep    5s
    Click Element    accessibility_id=General safety
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Getting home safely
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s



####Technology ####
    Sleep    5s
    Click Element    accessibility_id=Digital tools and computers
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Technical support
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s


#### Transportation ####

    Sleep    5s
    Click Element    accessibility_id=Campus transportation
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Sleep    5s
    Click Element    accessibility_id=Long distance travel
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Sleep    5s
    Click Element    accessibility_id=Travel by car
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s


Validating Wellness link
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Click Element    accessibility_id=Physical
    Sleep    5s
    Swipe    820     1100     800    980  1000
    Click Element    accessibility_id=UPACE
    Sleep    15s
    Capture Page Screenshot     filename=UPACE.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep    15s
    Capture Page Screenshot     filename=WellnessR.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    820     1100     800    980  1000
    Sleep    5s
    Click Element    accessibility_id=Wellness Pledge
    Sleep    15s
    Capture Page Screenshot     filename=WellnessP.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=Personal Training, This link takes you to a website outside of the Illinois app
    Sleep    15s
    Capture Page Screenshot     filename=Campus Recreation.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Group Fitness, This link takes you to a website outside of the Illinois app
    Sleep    15s
    Capture Page Screenshot     filename=Group Fitness.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Aquatics, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Aquatics.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Food & Nutrition, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Food.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=MyMcKinley, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=MyMcKinley.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Appointments at McKinley, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=AppointmentsMyMcKinley.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Immunization, Allergy, and Travel Clinic, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=TravelClinic.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Womens Health, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=WomensH.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Fitness, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Fitness.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Nutrition, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Nutrition.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Sexual Health, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=SHealth.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=LGBTQ Health, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=LGBTQ.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=Lab, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Lab.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Radiology, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Radiology.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Pharmacy, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Pharmacy.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=1st Time Visitors, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Vistior.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Primary Care, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=PrimaryC.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Schedule Appointment, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=SAppt.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Dial-a-Nurse, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Dial.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Health Resource Centers, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Health.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Exercise, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Exercise.png
    Sleep   5s

    Click Element    accessibility_id=Back

    Sleep   5s
    Click Element    accessibility_id=Eat Well, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Eat.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Sexual Health, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=HealthS.png
    Sleep   5s
    Click Element    accessibility_id=Back


Validating Mental links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Click Element    accessibility_id=Mental
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=Kognito At Risk (Counseling Center)
    Sleep   15s
    Capture Page Screenshot     filename=Kognito.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Mood Meter
    Sleep   15s
    Capture Page Screenshot     filename=Meter.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Memory Mixup
    Sleep   15s
    Capture Page Screenshot     filename=MemoryMix.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   15s
    Capture Page Screenshot     filename=WR.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   15s
    Capture Page Screenshot     filename=WP.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=Counseling, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=MCounceling.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Outreach and Prevention, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Outreach.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=ACE IT, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=ACE.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Mental Health Services, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Mental Health Services.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Stress Management, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Stress.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Relaxation Techniques, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Relaxation.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=Mental Health, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=MentalHealth.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Manage Stress, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Manage Stress.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Get Sleep, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Sleep.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s

Validating Env links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Environmental
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   15s
    Capture Page Screenshot     filename=WRE.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   15s
    Capture Page Screenshot     filename=WPE.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Arboretum, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Arboretum.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Campus Bike Center, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Bike.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Transportation Safety, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=TSafety.png
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Late Night Studying, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=NightS.png
    Sleep   5s

Validating Financial links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Financial
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Financial Wellness Program, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Financial.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Your Legal Health, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Legal.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Student Money Management, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Money.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Budgets & Finance, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Budgets.png
    Sleep   5s
    Click Element    accessibility_id=Back


Validating Spiritual links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Spiritual
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   15s
    Capture Page Screenshot     filename=SWR.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   15s
    Capture Page Screenshot     filename=SWP.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Reflection Rooms, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=RR.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Open Prayer, Relaxation, and Meditation Space, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Relax.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Programs, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Programs.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Interfaith, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Interfaith.png
    Sleep   5s
    Click Element    accessibility_id=Back
     Sleep    5s
     Click Element    accessibility_id=BNAACC, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=BNAACC.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep    5s
     Click Element    accessibility_id=AACC, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=AACC.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep    5s
     Click Element    accessibility_id=La Casa, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=La Casa.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep    5s
     Click Element    accessibility_id=Native American House, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Native.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Swipe    500     1000     500    600  1000
     Swipe    500     1000     500    600  1000
     Sleep   5s
     Click Element    accessibility_id=Religious Worker’s Association, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Religious.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Click Element    accessibility_id=Relaxation Techniques, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=RelaxationT.png
     Sleep   5s
     Click Element    accessibility_id=Back


Validating Vocational links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Vocational
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   15s
    Capture Page Screenshot     filename=VWR.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   15s
    Capture Page Screenshot     filename=VWP.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Career Center, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Career.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Student Job Board, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=StudentJob.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Top Scholars, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Scholars.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=i-Programs @ The Leadership Center, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Programs.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
     Sleep    5s
     Click Element    accessibility_id=Networking, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Networking.png
     Sleep   5s
     Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Student Assistance Center, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=SAssistance.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Academic Advisement, This link takes you to a website outside of the Illinois app
    Sleep   15s
    Capture Page Screenshot     filename=Academic Advisement.png
    Sleep   5s
    Click Element    accessibility_id=Back
     Sleep    5s
     Click Element    accessibility_id=FAQs, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=FAQs.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Swipe    500     1000     500    600  1000
     Swipe    500     1000     500    600  1000
     Sleep   5s
     Click Element    accessibility_id=Study Tips, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Tips.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep   5s
     Click Element    accessibility_id=What is Compass?, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Compass.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep   5s
     Click Element    accessibility_id=Tutoring, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Tutoring.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep   5s
     Click Element    accessibility_id=Getting Involved, This link takes you to a website outside of the Illinois app
     Sleep   15s
     Capture Page Screenshot     filename=Involved.png
     Sleep   5s
     Click Element    accessibility_id=Back
     Sleep   5s


Validating Emotional links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Emotional
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Mood Meter
    Sleep   20s
    Capture Page Screenshot     filename=Mood Meter.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   20s
    Capture Page Screenshot     filename=MWR.png
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep    10s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   30s
    Capture Page Screenshot     filename=MWP.png
    Sleep   10s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Sleep    10s
    Click Element    accessibility_id=Community of Care, This link takes you to a website outside of the Illinois app
    Sleep   30s
    Capture Page Screenshot     filename=Community.png
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep    10s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Click Element    accessibility_id=Programs, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=Programs.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Women’s Center, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=Women’s Center.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=LGBT Resource Center, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=LGBT.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000

    Sleep    5s
    Click Element    accessibility_id=Kognito At Risk (Counseling Center), This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=Kognito.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=ACE IT, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=ACE IT.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Stress Management, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=Stress Management.png
    Sleep   5s
    Click Element    accessibility_id=Back
     Sleep    5s
     Click Element    accessibility_id=Mental Health, This link takes you to a website outside of the Illinois app
     Sleep   40s
     Capture Page Screenshot     filename=Mental Health.png
     Sleep   5s
    Click Element    accessibility_id=Back



Validating Social links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Social
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Mood Meter
    Sleep   20s
    Capture Page Screenshot     filename=Mood Meter.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   20s
    Capture Page Screenshot     filename=MWR.png
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep    10s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   30s
    Capture Page Screenshot     filename=MWP.png
    Sleep   10s
    Click Element    accessibility_id=Back

    Sleep    10s
    Click Element    accessibility_id=Engage, This link takes you to a website outside of the Illinois app
    Sleep   30s
    Capture Page Screenshot     filename=Engage.png
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep    10s
    Click Element    accessibility_id=Intramural Sports, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=Intramural Sports.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=RSO, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=RSO.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Master Calendar, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=Master Calendar.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=BNAACC, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=BNAACC.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=AACC, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=AACC.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=La Casa, This link takes you to a website outside of the Illinois app
    Sleep   40s
    Capture Page Screenshot     filename=La Casa.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Native American House, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=Native American House.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Women’s Center, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=Women’s Center.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=LGBT Resource Center, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=LGBT Resource Center.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=International Education, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=International Education.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Getting Involved, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=Getting Involved.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Going Out, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=Going Out.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Peer Pressure, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=Peer Pressure.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Roommates, This link takes you to a website outside of the Illinois app
    Sleep   10s
    Capture Page Screenshot     filename=Roommates.png
    Sleep   5s
    Click Element    accessibility_id=Back

Validating IA links
    Sleep   15s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep    5s
    Click Element    accessibility_id=Interactive Mood Meter
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Memory Mix Up
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=UPACE
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Wellness Reflection
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Wellness Pledge
    Sleep   10s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Kognito At Risk
    Sleep   5s

Close the Application
    Capture Page Screenshot
    Close Application

*** Test Cases ***
Valid MyIllini screen
    Open the Application
    Start the Application
    Validating IlliniCash
    Close the Application

Valid Home screen
    Open the Application
    Start the Application
    Validating Homescreen
    Close the Application

Validating Poll
    Open the Application
    Start the Application
    Validate poll
    Close the Application

Validating Events
    Open the Application
    Start the Application
    #Start the Application with already login user
    Validating Events
    Close the Application

Validating Search Events
    Open the Application
    Start the Application
    #Start the Application with already login user
    Search Event
    Close the Application


Validating Dining
    Open the Application
    Start the Application
    #Start the Application with already login user
    Validating Dining
    Close the Application

Valid test Athletics
    Open the Application
    Start the Application
    #Start the Application with already login user
    Validating Athletics
    Close the Application

Valid SaveEvent
    Open the Application
    Start the Application
    Saved Event
    Close the Application

Valid Groupssdfsf
    Open the Application
    Start the Application
    Validating Groups
    Close the Application

Valid Groups
    Open the Application Noreset
    Validating Groups
    Close the Application

Valid Wallet screen
    Open the Application
    Start the Application
    Validating Wallet screen
    Close the Application

Valid Setting screen
    Open the Application
    Start the Application
    Validating Setting
    #Personal data and Notification
    Close the Application

Valid Privacy center

    Open the Application
    Start the Application
    Validating Privacy center
    Close the Application


Valid Meal parking feedback screen
    Open the Application
    Start the Application
    Validating Illini meal parking feedback
    Close the Application

Valid StudentGuide screen
    Open the Application
    Start the Application
    StudentGuide screen
    Close the Application



Valid Wellness Physical links
    Open the Application
    Start the Application
    Validating Wellness link
    Close the Application



Valid Wellness Mental links
    Open the Application Noreset
    Validating Mental links
    Close the Application


Valid Wellness Env links
    Open the Application Noreset
    Validating Env links
    Close the Application

Valid Wellness Spiritual links
    Open the Application Noreset
    Validating Spiritual links
    Close the Application

Valid Wellness Vocational links
    Open the Application Noreset
    Validating Vocational links
    Close the Application

Valid Wellness Emotional links
    Open the Application Noreset
    Validating Emotional links
    Close the Application

Valid Wellness Social links
    Open the Application Noreset
    Validating Social links
    Close the Application

Valid IA links
    Open the Application Noreset
    Validating IA links
    Close the Application




Valid Swipe links

    Open the Application
    Start the Application
    Validating Setting screen
    Close the Application


