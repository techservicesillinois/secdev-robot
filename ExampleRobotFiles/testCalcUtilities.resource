*** Settings ***
Documentation  Utility resouces for the testcalc demonstration

*** Keywords ***

# Keyword with a Variable 
Create ${custom} Screenshot
    Capture Page Screenshot     filename=${custom}.png

# Keyword with If Statement
If ${item} is ${value} then ${ifKeyword} else ${elseKeyword}
    Run Keyword If      ${item} == ${value}     ${ifKeyword}     ELSE    ${elseKeyword}

