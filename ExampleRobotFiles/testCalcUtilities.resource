*** Settings ***
Documentation  Utlity items for the testcalc demonstration

*** Keywords ***

# Keyword with a Variable 
Create ${custom} Screenshot
    Capture Page Screenshot     filename=${custom}.png

