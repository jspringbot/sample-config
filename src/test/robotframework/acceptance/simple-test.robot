*** Settings ***
Resource   ../config-resources.robot

*** Test Cases ***
Simple verify domain1 properties
    [Tags]  domain1     simple-domain1  simple
    Select Config Domain    ${DOMAIN1_NAME}
    ${string}=              Get Config String Property      stringProperty
    ${boolean}=             Get Config Boolean Property     booleanProperty
    ${integer}=             Get Config Integer Property     integerProperty
    ${double}=              Get Config Double Property      doubleProperty
    ${expectedBoolean}=     Convert To Boolean              true
    ${expectedInteger}=     Convert To Integer              100
    ${expectedDouble}=      Convert To Number               10.54
    Should Be Equal         ${string}   string property
    Should Be Equal         ${boolean}  ${expectedBoolean}
    Should Be Equal         ${integer}  ${expectedInteger}
    Should Be Equal         ${double}   ${expectedDouble}

Simple verify domain2 properties
    [Tags]  domain2     simple-domain2  simple
    Select Config Domain    ${DOMAIN2_NAME}
    ${string}=              Get Config String Property      stringProperty
    ${boolean}=             Get Config Boolean Property     booleanProperty
    ${integer}=             Get Config Integer Property     integerProperty
    ${double}=              Get Config Double Property      doubleProperty
    ${expectedBoolean}=     Convert To Boolean              false
    ${expectedInteger}=     Convert To Integer              200
    ${expectedDouble}=      Convert To Number               20.54
    Should Be Equal         ${string}   string property too
    Should Be Equal         ${boolean}  ${expectedBoolean}
    Should Be Equal         ${integer}  ${expectedInteger}
    Should Be Equal         ${double}   ${expectedDouble}

