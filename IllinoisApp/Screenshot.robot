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

*** Variables ***
${LOCAL_APPIUM_SERVER}    http://localhost:4723/wd/hub

*** Keywords ***
Open the Application
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity

Open the Application Noreset
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity
        ...    noReset=true    fullReset=false    desiredCapabilities=lastOpenedActivity
        ...    allowInvisibleElements=true    ignoreUnimportantViews=false



Start the Application
    Sleep  5s
    Capture Page Screenshot     filename=Splash.png

    #Wait Until Page Contains Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button
    Sleep  5s
    Click Element    accessibility_id=Continue
    Sleep    5s
    Capture Page Screenshot     filename=Continue.png
    Sleep    10s
    Click Element    xpath=//android.view.View[@content-desc="unchecked, checkbox, University student"]
    #Click Element    accessibility_id=unchecked, checkbox, University Student
    Sleep    5s
    Capture Page Screenshot     filename=Role.png
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep    5s
#    Swipe    500     1300     500    0  1000
#    Swipe    500     1300     500    0  1000
#    Swipe    500     1300     500    0  1000
#    Swipe    500     1300     500    0  1000
#    Sleep    5s
    Capture Page Screenshot     filename=Privacy.png
    Sleep   5s
    Click Element    accessibility_id=Begin
    Sleep    5s
    Capture Page Screenshot     filename=Location.png
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep   5s
    Capture Page Screenshot     filename=AppActivity.png
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep    5s
    Capture Page Screenshot     filename=Recommandation.png
    Sleep    5s
    Click Element    accessibility_id=Continue
    Sleep    5s
    Capture Page Screenshot     filename=FullAccess.png
    Sleep    10s
    #Click Element    accessibility_id=Save Privacy Level
	Click Element    xpath=//android.widget.Button[@content-desc="Save privacy level"]
    Sleep    5s

    Capture Page Screenshot     filename=login.png
    Sleep    5s
    Click Element    accessibility_id=Sign in with NetID
    Sleep    5s
    Proceed with Netid
    Sleep    5s



Screen Shot of Homescreen

    Sleep    5s
    Capture Page Screenshot     filename=Home1.png
    Sleep    5s
    Click Element    accessibility_id=Events
    Sleep   10s
    ${Value}    Run Keyword And Return Status    Text Should Be Visible    ALLOW
    Run Keyword If   ${Value}
    ...    Click Text   ALLOW
    #Click Element    id=com.android.packageinstaller:id/permission_allow_button
    sleep   5s
    #Click Element At Coordinates    790    1053
    Capture Page Screenshot     filename=Events1.png
    Sleep    5s
#    Swipe    500     1300     500    0  1000
#    Sleep    5s
#    Capture Page Screenshot     filename=Events2.png
#    Sleep    5s
    Click Element At Coordinates    480    786
    Sleep    5s
    Capture Page Screenshot     filename=EventsSpecific.png
    Sleep    5s
    Click Element    accessibility_id=Home, Home Page
    Sleep    5s
    Click Element    accessibility_id=Dining
    Sleep    5s
    Capture Page Screenshot     filename=Dining.png
    Sleep    5s
    Click Element At Coordinates    480    786
    Sleep    5s
    Capture Page Screenshot     filename=DiningSpecific.png
    Sleep    5s
    Click Element    accessibility_id=Home, Home Page
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep   5s
    Capture Page Screenshot     filename=Home2.png
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep   5s
    Capture Page Screenshot     filename=Home3.png
    Sleep   5s
    Swipe    500     1300     500    0  1000
    Sleep   5s
    Capture Page Screenshot     filename=Home4.png
    Sleep   5s

Saved screen
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Athletics
    Sleep   5s
    Capture Page Screenshot     filename=Athletics1.png
    Sleep   5s
    Swipe    500     600     500    0  1000
    Capture Page Screenshot     filename=Athletics2.png
    Sleep   5s
    Swipe    500     600     500    0  1000
    Capture Page Screenshot     filename=Athletics3.png
    Sleep   5s
    Swipe    500     600     500    0  1000
    Capture Page Screenshot     filename=Athletics4.png
    Sleep   5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s

    Click Element    accessibility_id=Saved
    Sleep    5s
    Capture Page Screenshot     filename=Saved.png
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Capture Page Screenshot     filename=Browse1.png
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep   5s
    Capture Page Screenshot     filename=Browse2.png
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Sleep   5s
    Capture Page Screenshot     filename=Browse3.png
    Sleep   5s
    Click Element    accessibility_id=Quick polls
    Sleep    5s
    Capture Page Screenshot     filename=Quick polls.png
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s

    Click Element    xpath=(//android.widget.Button[@content-desc="Settings"])[2]
    Sleep    5s
    Capture Page Screenshot     filename=Settings.png
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Privacy Center
    Sleep    5s
    Capture Page Screenshot     filename=Privacy Center.png
    Sleep   5s
    Click Element    accessibility_id=Manage and Understand Your Privacy
    Sleep    5s
    Capture Page Screenshot     filename=Manage and Understand Your Privacy.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Personal Information
    Sleep    5s
    Capture Page Screenshot     filename=Personal Information.png
    Sleep   5s
    Click Element At Coordinates    970    351
    Sleep    5s
    Capture Page Screenshot     filename=Personal.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep   5s
    #Click Element    accessibility_id=Personal Information Your name and contact info you’ve shared
    Click Element At Coordinates    983    565
    sleep   5s
    Capture Page Screenshot     filename=Who are you.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    #Click Element    accessibility_id=Who You Are Your status as a student, faculty, resident, etc.
    Click Element At Coordinates    973    762
    Sleep   5s
    Capture Page Screenshot     filename=Interest.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep   5s
    #Click Element    accessibility_id=Your Interests Categories, teams, and tags you follow
    Click Element At Coordinates    973    976
    Sleep   5s
    Capture Page Screenshot     filename=Food Filters.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Notification Preferences
    Sleep   5s
    Capture Page Screenshot     filename=Notification.png
    Sleep   5s
    Click Element    accessibility_id=Back
    Sleep   5s


Wellness screen
    Sleep   5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Wellness
    Sleep    5s
    Capture Page Screenshot     filename=Wellness.png
    Sleep    5s
    Click Element    accessibility_id=Physical
    Sleep    5s
    Capture Page Screenshot     filename=Physical.png
    Sleep    5s
    Click Element    accessibility_id=Back

    Sleep   5s
    Click Element    accessibility_id=Mental
    Sleep    5s
    Capture Page Screenshot     filename=Mental.png
    Sleep    5s
    Click Element    accessibility_id=Back

    Sleep   5s
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Click Element    accessibility_id=Environmental

    Sleep    5s
    Capture Page Screenshot     filename=Environmental.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Financial
    Sleep    5s
    Capture Page Screenshot     filename=Financial.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1000     500    600  1000

    Sleep    5s

    Click Element    accessibility_id=Spiritual
    Sleep    5s
    Capture Page Screenshot     filename=Spiritual.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Vocational
    Sleep    5s
    Capture Page Screenshot     filename=Vocational.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Emotional
    Capture Page Screenshot     filename=Emotional.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Social
    Sleep    5s
    Capture Page Screenshot     filename=Social.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Swipe    500     1000     500    600  1000
    Swipe    500     1000     500    600  1000
    Sleep   5s
    Capture Page Screenshot     filename=Interactive Activities.png
    Sleep   5s

Wallet screen
    Sleep    5s
    Click Element    accessibility_id=Wallet, Wallet Page
    Sleep    5s
    Capture Page Screenshot     filename=Wallet.png
    Sleep    5s
    Click Element    xpath=(//android.widget.ImageView[@content-desc="View"])[1]
    #Click Element At Coordinates    894    328
    Sleep    5s
    Capture Page Screenshot     filename=IlliniCash.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Add Illini Cash
    Sleep    5s
    Capture Page Screenshot     filename=AddIlliniCash.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    xpath=(//android.widget.ImageView[@content-desc="View"])[2]
    #Click Element At Coordinates    886    834
    Sleep   15s
    Capture Page Screenshot     filename=Mealplan.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Use bus pass
    Sleep    5s
    Capture Page Screenshot     filename=Buspass.png
    Sleep    5s
    Click Element    xpath=(//android.widget.Button[@content-desc="close"])[2]
    #Click Element At Coordinates    535    1689
    Sleep    5s
    Swipe    722     1316     526    1306  1000
    Sleep    5s
    Click Element    accessibility_id=Use ID
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Capture Page Screenshot     filename=IlliniID.png
    Sleep    5s
    Click Element    xpath=(//android.widget.Button[@content-desc="close"])[2]
    #Click Element At Coordinates    535    1680
    Sleep    5s
    Swipe    722     1316     526    1306  1000
    Swipe    722     1316     526    1306  1000
    Swipe    722     1316     526    1306  1000
    Sleep   5s
    Capture Page Screenshot     filename=Librarycard.png
    Sleep   5s
    Click Element    xpath=(//android.widget.Button[@content-desc="close"])[2]
    #Click Element At Coordinates    542    1704
    Sleep    5s


StudentGuide screen
    Sleep    10s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Student Guide
    Sleep    5s
    Capture Page Screenshot     filename=S1StudentGuide1.png
    Sleep    5s
    Click Element    accessibility_id=Books
    Sleep    5s
    Capture Page Screenshot     filename=S2Book1.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Excel academically
    Sleep    5s
    Capture Page Screenshot     filename=S3Excel academically.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=General support
    Sleep    5s
    Capture Page Screenshot     filename=S4General support.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=International education
    Sleep    5s
    Capture Page Screenshot     filename=S5IE.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Writing help
    Sleep    5s
    Capture Page Screenshot     filename=S6Writing.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
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
    Capture Page Screenshot     filename=S7JM.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Jobs
    Sleep    5s
    Capture Page Screenshot     filename=S8Jobs.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Cultural centers
    Sleep    5s
    Capture Page Screenshot     filename=S9CC.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=LGBTQ
    Sleep    5s
    Capture Page Screenshot     filename=S10LGBTQ.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Support services

    #Click Element    xpath=//android.widget.ImageView[@content-desc="Support centers"]
    Sleep    5s
    Capture Page Screenshot     filename=S11Support centers.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
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
    Sleep    5s

    Click Element    accessibility_id=Financial support

    Sleep    5s
    Capture Page Screenshot     filename=S13Financial Support.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Jobs
    Sleep    5s
    Capture Page Screenshot     filename=S14Jobs.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s



#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Exercise
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END

    Sleep   5s
    Click Element    accessibility_id=Legal support
    Sleep    5s
    Capture Page Screenshot     filename=S15Legal support.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Money management
    Sleep    5s
    Capture Page Screenshot     filename=S16Money management.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=COVID-19
    Sleep    5s
    Capture Page Screenshot     filename=S17COVID-19.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Exercise
    Sleep    5s
    Capture Page Screenshot     filename=S20Exercise.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s


###########
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
    Sleep    5s
    Click Element    accessibility_id=Mental & emotional health
    Sleep    5s
    Capture Page Screenshot     filename=S21Mental & emotional health.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s






    Sleep    5s
    Click Element    accessibility_id=Nutrition
    Sleep    5s
    Capture Page Screenshot     filename=S22Nutrition.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Physical health
    Sleep    5s
    Capture Page Screenshot     filename=S23Physical health.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s




    Click Element    accessibility_id=Community engagement
    Sleep    5s
    Capture Page Screenshot     filename=S24Community engagement.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Socializing
    Sleep    5s
    Capture Page Screenshot     filename=S25Socializing.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=General housing information
    Sleep    5s
    Capture Page Screenshot     filename=S25GHSocializing.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Off-campus housing
    Sleep    5s
    Capture Page Screenshot     filename=S25OFFCampus.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Private certified housing
    Sleep    5s
    Capture Page Screenshot     filename=S25PCH.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s


    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Physical health
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    5s

    Click Element    accessibility_id=University Housing
    Sleep    5s
    Capture Page Screenshot     filename=S25UH.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Books
    Sleep    5s
    Capture Page Screenshot     filename=S26Books.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s





    Click Element    accessibility_id=Digital tools and computers
    Sleep    5s
    Capture Page Screenshot     filename=S27DTC.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Financial support
    Sleep    5s
    Capture Page Screenshot     filename=S28FS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s


    Click Element    accessibility_id=General safety
    Sleep    5s
    Capture Page Screenshot     filename=S29GS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s



    Click Element    accessibility_id=Physical health
    Sleep    5s
    Capture Page Screenshot     filename=S31PH.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
#    Click Element    accessibility_id=Socializing
#    Sleep    5s
#    Capture Page Screenshot     filename=S32SC.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Quiet space
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END

    Sleep    5s
    Click Element    accessibility_id=Socializing
    Sleep    5s
    Capture Page Screenshot     filename=S32SC.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Technical support
    Sleep    5s
    Capture Page Screenshot     filename=S33TS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Technology resources
    Sleep    5s
    Capture Page Screenshot     filename=S34TR.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=University Housing
    Sleep    5s
    Capture Page Screenshot     filename=S35UHS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Getting home safely
    Sleep    5s
    Capture Page Screenshot     filename=S36GHS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element    accessibility_id=Quiet space
    Sleep    5s
    Capture Page Screenshot     filename=S37QS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Alternative modes of transportation
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END
    Sleep    5s
    Click Element    accessibility_id=Books
    Sleep    5s
    Capture Page Screenshot     filename=S38Books.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

#    Click Element    xpath=(//android.widget.Button[@content-desc="Digital tools and computers"])[1]
#    Sleep    5s
#    Capture Page Screenshot     filename=S39DTS.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    xpath=(//android.widget.Button[@content-desc="Digital tools and computers"])[2]
#    Sleep    5s
#    Capture Page Screenshot     filename=S40DTTS.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s

    Click Element    accessibility_id=Technical support
    Sleep    5s
    Capture Page Screenshot     filename=S41TS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Technology resources
    Sleep    5s
    Capture Page Screenshot     filename=S42TRS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Alternative modes of transportation
    Sleep    5s
    Capture Page Screenshot     filename=S43ATS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    FOR    ${i}    IN RANGE    20
       # value will return either true or false
        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Campus landmarks
        log to console   ${value}
        Sleep  5s
        Run Keyword If   ${value} == False
        ...    Swipe    500     600     500    0  1000
        ...    ELSE
        #...    Click Text    ${text}
        #Run Keyword If   ${value} == True
        ...    Exit For Loop
    END

    Click Element    accessibility_id=Getting home safely
    Sleep    5s
    Capture Page Screenshot     filename=S44GHS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Long distance travel
    Sleep    5s
    Capture Page Screenshot     filename=S45LDS.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s

    Click Element    accessibility_id=Travel by car
    Sleep    5s
    Capture Page Screenshot     filename=S46TC.png
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s






#
#Digital tools and computers
#
#    Sleep   5s
#    Click Element    xpath=(//android.widget.ImageView[@content-desc="Housing"])[1]
#    Sleep    5s
#    Capture Page Screenshot     filename=S27Housing.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Books
#    Sleep    5s
#    Capture Page Screenshot     filename=S28Books1.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    xpath=(//android.widget.ImageView[@content-desc="Dining"])[2]
#    Sleep    5s
#    Capture Page Screenshot     filename=S29Dining2.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#
#
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Physical health
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#
#    sleep   5s
#
#    Click Element    accessibility_id=Financial support
#    Sleep    5s
#    Capture Page Screenshot     filename=S30Financial support.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=General safety
#    Sleep    5s
#    Capture Page Screenshot     filename=S31General safety.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Housing
#    Sleep    5s
#    Capture Page Screenshot     filename=S32Housing.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#
#    Click Element    accessibility_id=Physical health
#    Sleep    5s
#    Capture Page Screenshot     filename=S33Physical health.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Socializing
#    Sleep    5s
#    Capture Page Screenshot     filename=S34Socializing.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Tech resources
#    Sleep    5s
#    Capture Page Screenshot     filename=S35Tech resources.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Tech support
#    Sleep    5s
#    Capture Page Screenshot     filename=S36Tech support.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Quiet space
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    Sleep     5s
#
#    Click Element    accessibility_id=Socializing
#    Sleep    5s
#    Capture Page Screenshot     filename=S37Socializing.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=General safety
#    Sleep    5s
#    Capture Page Screenshot     filename=S38General safety.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Getting home safely
#    Sleep    5s
#    Capture Page Screenshot     filename=S39Getting home safely.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Quiet space
#    Sleep    5s
#    Capture Page Screenshot     filename=S40Quiet space.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#
#
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    xpath=(//android.widget.ImageView[@content-desc="Digital tools and computers"])[2]
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#
#    Sleep    5s
#
#    Click Element    accessibility_id=Books
#    Sleep    5s
#    Capture Page Screenshot     filename=S41Books.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    xpath=(//android.widget.ImageView[@content-desc="Digital tools and computers"])[1]
#    Sleep    5s
#    Capture Page Screenshot     filename=S42DTC.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=(//android.widget.ImageView[@content-desc="Digital tools and computers"])[2]
#    Sleep    5s
#    Capture Page Screenshot     filename=S43DTC1.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Tech resources
#    Sleep    5s
#    Capture Page Screenshot     filename=S44Tech resources1.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Travel by car
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#
#    Sleep  5s
#
#    Click Element    accessibility_id=Tech support
#    Sleep    5s
#    Capture Page Screenshot     filename=S45Tech support1.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Alternative modes of transportation
#    Sleep    5s
#    Capture Page Screenshot     filename=S46Alternative modes of transportation.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Long distance travel
#    Sleep    5s
#    Capture Page Screenshot     filename=S47Long distance travel.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#    Click Element    accessibility_id=Travel by car
#    Sleep    5s
#    Capture Page Screenshot     filename=S48Travel by car.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#
#
#
#
#
##    Swipe    500     600     500    0  1000
##    Swipe    500     600     500    0  1000
##    Sleep    5s
#
#
#
#Scroll1 test
#    Click Element    accessibility_id=Browse, Browse Page
#    Sleep    5s
#    Swipe    500     1300     500    0  1000
#    Click Element    accessibility_id=Privacy Center
#    Sleep    5s
#    Click Element    accessibility_id=Manage and Understand Your Privacy
#    Sleep    5s
#    Page Should Contain Element    accessibility_id=Choose Your Privacy Level
#    #Page Should Contain Element    accessibility_id=Privacy Level: 5 Access all features, get connected to campus, and let the app suggest tailored experiences that you and your friends all enjoy.
#    Sleep    5s
#    Click Element    accessibility_id=Expand All
#    Sleep     5s
#
#    Page Should Contain Element    accessibility_id=Close All
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=LGBTQ
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Financial Support
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=COVID-19
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Socializing
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Physical health
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Quiet space
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    xpath=(//android.widget.ImageView[@content-desc="Digital tools and computers"])[2]
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#
#    FOR    ${i}    IN RANGE    20
#       # value will return either true or false
#        ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Travel by car
#        log to console   ${value}
#        Sleep  5s
#        Run Keyword If   ${value} == False
#        ...    Swipe    500     600     500    0  1000
#        ...    ELSE
#        #...    Click Text    ${text}
#        #Run Keyword If   ${value} == True
#        ...    Exit For Loop
#    END
#
#
#
#
#
#
#    Click Element    accessibility_id=Books
#    Sleep    5s
#    Capture Page Screenshot     filename=Book1.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#    Click Element    accessibility_id=Excel academically
#    Sleep    5s
#    Capture Page Screenshot     filename=Excel academically.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#    Click Element    accessibility_id=General support
#    Sleep    5s
#    Capture Page Screenshot     filename=General support.png
#    Sleep    5s
#    Click Element    accessibility_id=Back
#    Sleep    5s
#International education
#
#Writing help
#//Career
#Get ready for the job market
#Jobs
#//Diversity
#    Swipe    500     600     500    0  1000
#    Swipe    500     600     500    0  1000
#
#Cultural centers
#
#LGBTQ
#Resource centers
#
#Support services
#
#//Financial
#
#Financial Support
#
#Jobs
#
#Legal support
#
#Money management
#
#    Swipe    500     600     500    0  1000
#    Swipe    500     600     500    0  1000
#
# //health
#
#COVID-19
#Exercise
#Mental & emotional health
#
#Nutrition
#Physical health
#
#// involvemnet
#Community engagement
#
#Socializing
#    Swipe    500     600     500    0  1000
#    Swipe    500     600     500    0  1000
#
#//living
#(//android.widget.ImageView[@content-desc="Dining"])[1]
#
#(//android.widget.ImageView[@content-desc="Housing"])[1]
#
#//New student
#Books
#Digital tools and computers
#(//android.widget.ImageView[@content-desc="Dining"])[2]
#
#Financial support
#
#General safety
#
#Housing
#
#Physical health
#
#Socializing
#Tech resources
#Tech support
#
#
#//Safety
#
#General safety
#Getting home safely
#//Spirutual
#Quiet space
#
#//Supplies
#Books
#(//android.widget.ImageView[@content-desc="Digital tools and computers"])[1]
#
#//Tech
#
#(//android.widget.ImageView[@content-desc="Digital tools and computers"])[2]
#
#Tech resources
#
#Tech support
#
#//Transportation
#
#Alternative modes of transportation
#Long distance travel
#
#Travel by car







Athletics screen
    Sleep    5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Click Element    accessibility_id=Athletics
    Sleep   5s
    Capture Page Screenshot     filename=Athletics1.png
    Sleep   5s
    Swipe    500     600     500    0  1000
    Capture Page Screenshot     filename=Athletics2.png
    Sleep   5s
    Swipe    500     600     500    0  1000
    Capture Page Screenshot     filename=Athletics3.png
    Sleep   5s
    Swipe    500     600     500    0  1000
    Capture Page Screenshot     filename=Athletics4.png
    Sleep   5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s







#_____________________________________________________________


Validating Homescreen
    Click Element    accessibility_id=Log in with NetID
    Sleep    5s
    Proceed with Netid
    Sleep    5s
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


    ${value}    Run Keyword And Return Status    Page Should Contain Element    accessibility_id=Campus Resources

    Run Keyword If   ${value}   Validate blocks

    Sleep    5s
    Swipe    500     600     500    600  1000
    Sleep     5s

Validate blocks
    Page Should Contain Element    accessibility_id=Events
    Page Should Contain Element    accessibility_id=Dining
    Page Should Contain Element    accessibility_id=Athletics
    Page Should Contain Element    accessibility_id=Illini Cash
    Page Should Contain Element    accessibility_id=My Illini
    Sleep    5s
    Swipe    500     600     500    600  1000


Validating IlliniCash
    Click Element    accessibility_id=Log in with NetID
    Sleep    5s
    Proceed with Netid
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
#    Click Element    class=android.widget.EditText
#    #Input Text
#    Input Text    id=j_username    ${TEXT}
#    Sleep   5s
#    Click Element    class=android.widget.Button
#    #Close the keyboard
#    Press Keycode    4
#   #Tap on Login button
#    Press Keycode    66
#    Sleep   5s
#    Press Keycode    4



Validating Setting screen
    #validating external links Privacy Center links
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Center
    Sleep    5s
    Click Element    accessibility_id=Verify your Identity
    Sleep    5s
    Page Should Contain Element    accessibility_id=Verify your Identity
#
    Click Element    accessibility_id=Connect Your NetID
    Sleep    5s
    Click Element    accessibility_id=Log in with NetID
    Proceed with Netid
    Sleep   5s

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
    Click Element At Coordinates    790    342
    Sleep   5s

#Privacy Level: 3 You can personalize and customize the app. Wifi and Bluetooth location data is stored over time to make recommendations and improve your overall app experience.
    ${title}=  Get Element Attribute    class=android.widget.SeekBar  content-desc
    Log to Console    ${title}
    ${Value}    Run Keyword And Return Status    Should Contain    ${title}    4
    ###Scroll up untill the below element is visible####
    #Page Should Contain Element    accessibility_id=Privacy Level: 4 Let the app work for you. You can access your iCard, save credit cards to make future purchases easier, access health information, and get notifications based on your specific interests.
    Sleep    5s
    Click Element At Coordinates    968    342
    Sleep     5s
    Click Element    accessibility_id=Set my Privacy
    Sleep     5s
    Personal data

    #Click Element    accessibility_id=Back
    Sleep    5s

    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Statement
    Sleep   5s
    Wait Until Page Contains Element  accessibility_id=Privacy Statement    timeout=None    error=None
    #Click Element At Coordinates    1007    944
    Sleep   5s
    Capture Page Screenshot     filename=Privacy.png
    #${privacytext}  Get Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[5]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
    #Log To Console    ${privacytext}
    #Should Be Equal As Strings      ${privacytext}    ILLINOIS APPLICATION PRIVACY NOTICE
    Click Element    accessibility_id=Back
    Sleep   5s






    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    #external link MyIllini
#    Click Element    accessibility_id=My Illini
#    Sleep   5s
#    Click Element At Coordinates    1007    1551
#    Sleep   5s
#    Wait Until Page Contains Element  accessibility_id=My Illini    timeout=None    error=None
#    ${contexts}    Get Contexts
#    Log To Console    ${contexts}
#    ${illinitext}  Get Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.webkit.WebView/android.webkit.WebView/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[1]
#    Log To Console    ${illinitext}
#    Should Be Equal As Strings      ${illinitext}    Log In to myIllini
    Sleep    5s


Personal data

    Swipe    500     1300     500    0  1000
    Sleep    5s
    Click Element    accessibility_id=Personal Information
    Sleep   5s
    Page Should Contain Element    accessibility_id=Personal Information
    Sleep    5s
    Click Element At Coordinates    970    351
    #Click Element    accessibility_id=Personal Information Your name and contact info you’ve shared
    Sleep   5s
    #Page Should Contain Element    accessibility_id=Connect to Illinois
    #Sleep   5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element At Coordinates    983    565
    #Click Element    accessibility_id=Who You Are Your status as a student, faculty, resident, etc.
    Sleep    5s
    Page Should Contain Element    accessibility_id=checked, checkbox, University Student
    Sleep    5s
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element At Coordinates    973    762
    #Click Element    accessibility_id=Your Interests Categories, teams, and tags you follow
    Sleep    5s
    Click Element    accessibility_id=unchecked, checkbox, Academic
    Click Element    accessibility_id=unchecked, checkbox, Community
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element At Coordinates    973    762
    #Click Element    accessibility_id=Your Interests Categories, teams, and tags you follow
    Sleep    5s
#    Click Element    accessibility_id=unchecked, checkbox, Academic
#    Click Element    accessibility_id=unchecked, checkbox, Community
#    Click Element    accessibility_id=Back
    Sleep    5s
    Page Should Contain Element    accessibility_id=checked, checkbox, Academic
    Page Should Contain Element    accessibility_id=checked, checkbox, Community
    Click Element    accessibility_id=Back
    Sleep    5s
    Click Element At Coordinates    973    976
    #Click Element    accessibility_id=Food Filters Add or edit your food preferences
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
    Click Element At Coordinates    973    976
    #Click Element    accessibility_id=Food Filters Add or edit your food preferences
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

    Sleep    10s

    # get all the context displayed on the Shib screen
    ${contexts}    Get Contexts
    Sleep    5s
    #Get the current active context Native app
    ${current}    Get Current Context
    Sleep    10s
    # Displays Webview
    Switch To Context    ${contexts}[1]
    #Log To Console    ${contexts}[1]
    Sleep    10s
    ${current}    Get Current Context
    Sleep    10s
    Input Text    id=j_username    ${NETID}
    Sleep    5s
    Input Password  id=j_password   ${PWD}
    #Close the keyboard
    Press Keycode    4
    #Tap on Login button
    Press Keycode    66
    #Close the keyboard
    Sleep  10s
    # Swtich back to Native app
    Switch To Context  ${contexts}[0]
    Sleep  10s
    Capture Page Screenshot     filename=SaferApp05.png

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



Close the Application
    Capture Page Screenshot
    Close Application

*** Test Cases ***

Valid Screenshot test
    Open the Application
    #Open the Application Noreset
    Start the Application
    Screen Shot of Homescreen
    #Saved screen
    #Wellness screen
    #Wallet screen
    Close the Application

Valid SG test
    Open the Application Noreset
    #Open the Application
    #Start the Application
    #Screen Shot of Homescreen
    StudentGuide screen
    Close the Application

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


Valid Swipe links

    Open the Application
    Start the Application
    Validating Setting screen
    Close the Application


