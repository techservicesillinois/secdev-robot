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
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity

Open the Application Noreset
    Open Application    ${LOCAL_APPIUM_SERVER}    platformName=android    platformVersion=9.0
        ...    deviceName=emulator-5554    automationName=uiautomator2
        ...    appPackage=edu.illinois.rokwire    appActivity=edu.illinois.rokwire.MainActivity
        ...    noReset=true    fullReset=false    desiredCapabilities=lastOpenedActivity
        ...    allowInvisibleElements=true    ignoreUnimportantViews=false


Start the Application
    Sleep  15s
    #Wait Until Page Contains Element  xpath = /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button
    Click Element    accessibility_id=Get Started
    Sleep  5s
    Click Element    accessibility_id=Continue
    Sleep  5s
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Swipe    500     1300     500    0  1000
    Sleep  5s
    Click Element    accessibility_id=Set my Privacy, Set my privacy
    Sleep  5s
    Click Element    accessibility_id=Receive Notifications
    Sleep  5s
    Click Element    accessibility_id=Share my Location
    Sleep  5s
    Click Element At Coordinates    794    1045
    Sleep  5s
    Click Element    accessibility_id=unchecked, checkbox, University Student
    Sleep  5s
    Click Element    accessibility_id=Continue
    Sleep  5s
    #Login without netid
    Click Element At Coordinates    560    1705
    Sleep    5s

Validating Setting screen
    #validating external links Privacy Center links
    Click Element    accessibility_id=Browse, Browse Page
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Center
    Sleep    5s
    Swipe    500     1300     500    0  1000
    Click Element    accessibility_id=Privacy Statement
    Sleep   5s
    Wait Until Page Contains Element  accessibility_id=Privacy Statement    timeout=None    error=None
    Click Element At Coordinates    1007    944
    Sleep   5s
    ${privacytext}  Get Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View[5]/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]
    Log To Console    ${privacytext}
    Should Be Equal As Strings      ${privacytext}    ILLINOIS APPLICATION PRIVACY NOTICE
    Click Element    accessibility_id=Back
    Sleep   5s
    Click Element    accessibility_id=Browse, Browse Page
    Sleep   5s
    #external link MyIllini
    Click Element    accessibility_id=My Illini
    Sleep   5s
    Click Element At Coordinates    1007    1551
    Sleep   5s
    Wait Until Page Contains Element  accessibility_id=My Illini    timeout=None    error=None
    ${contexts}    Get Contexts
    Log To Console    ${contexts}
    ${illinitext}  Get Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.webkit.WebView/android.webkit.WebView/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[1]
    Log To Console    ${illinitext}
    Should Be Equal As Strings      ${illinitext}    Log In to myIllini
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


Close the Application
    Capture Page Screenshot
    Close Application

*** Test Cases ***
Valid Open and Close
    Open the Application
    Start the Application
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




