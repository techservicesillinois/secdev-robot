*** Settings ***
Documentation  Utility resources for the search demonstration

*** Variables ***

# One Default App
# @{SEARCH_APPS}    Chrome

# One Missing App
# @{SEARCH_APPS}    Missing App

# Default App and a Missing App
@{SEARCH_APPS}    Chrome     Missing App

*** Keywords ***

# Scroll Up and Search for Text
Search Up for ${SearchText} ${MaxVal} Times
    Sleep   5s
    FOR    ${count}    IN RANGE    ${MaxVal}
        ${value}    Run Keyword And Return Status    Page Should Contain Text    ${SearchText}

        Run Keyword If      ${value} == False
        ...     Swipe    500     600     500    1600  1000

        Run Keyword If      ${value} == True
        ...     Log to Console  ****SUCCESS: ${SearchText} PRESENT!****

        Run Keyword If      ${count}+1 == ${MaxVal}
        ...     Log to Console  ****ERROR: ${SearchText} NOT PRESENT!****

        Run Keyword If      ${value} == True
        ...     Exit For Loop
    END

# Scroll Down and Search for Text
Search Down for ${SearchText} ${MaxVal} Times
    Sleep   5s
    FOR    ${count}    IN RANGE    ${MaxVal}
        ${value}    Run Keyword And Return Status    Page Should Contain Text    ${SearchText}
        Run Keyword If      ${value} == False
        ...     Swipe    500     1600    500    600   1000

        Run Keyword If    ${value} == True
        ...     Log to Console  ****SUCCESS: ${SearchText} PRESENT!****

        Run Keyword If      ${count}+1 == ${MaxVal}
        ...     Log to Console  ****ERROR: ${SearchText} NOT PRESENT!****

        Run Keyword If      ${value} == True
        ...     Exit For Loop
    END