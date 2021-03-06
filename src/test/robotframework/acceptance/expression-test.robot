*** Settings ***
Resource   ../config-resources.robot

*** Test Cases ***
Expression verify domain1 properties
    [Tags]  domain1     expression-domain1  expression
    ${domain1}=             Create Config Domain Object        ${DOMAIN1_NAME}
    Select Config Domain            ${DOMAIN1_NAME}
    EL Should Be Equal   $[config:stringProperty]    string property
    EL Should Be Equal   $[b:config:booleanProperty]   $[true]
    EL Should Be Equal   $[i:config:integerProperty]   $[i:100]
    EL Should Be Equal   $[d:config:doubleProperty]    $[10.54]

Expression verify domain2 properties
    [Tags]  domain1     expression-domain2  expression
    EL Should Be Equal   $[config:domain2:stringProperty]      string property too
    EL Should Be Equal   $[b:config:domain2:booleanProperty]   $[false]
    EL Should Be Equal   $[i:config:domain2:integerProperty]   $[i:200]
    EL Should Be Equal   $[d:config:domain2:doubleProperty]    $[20.54]

Expression verify with variables
    [Tags]  domain1     expression-variables  expression
    EL Add Variable     property    $[config:domain2:integerProperty]
    EL Should Be True   $[property eq 200]

Expression verify domain2 with replacement
    [Tags]  domain2     expression-replacement  expression
    ${var1}=             Set Variable   var1Value
    EL Should Be Equal   $[config:domain2:testProperty]      var1Value/a

