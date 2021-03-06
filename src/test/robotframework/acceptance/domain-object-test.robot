*** Settings ***
Resource   ../config-resources.robot

*** Test Cases ***
Domain Object verify domain1 properties
    [Tags]  domain1     object-domain1  object
    ${domain1}=             Create Config Domain Object        ${DOMAIN1_NAME}
    ${expectedBoolean}=     Convert To Boolean                  true
    ${expectedInteger}=     Convert To Integer                  100
    ${expectedDouble}=      Convert To Number                   10.54
    Should Be Equal         ${domain1.getDomain()}              domain1
    Should Be Equal         ${domain1.get('stringProperty')}            string property
    Should Be Equal         ${domain1.getBoolean('booleanProperty')}    ${expectedBoolean}
    Should Be Equal         ${domain1.getInteger('integerProperty')}    ${expectedInteger}
    Should Be Equal         ${domain1.getDouble('doubleProperty')}      ${expectedDouble}

Domain Object verify domain2 properties
    [Tags]  domain2     object-domain2  object
    ${domain2}=             Create Config Domain Object        ${DOMAIN2_NAME}
    ${expectedBoolean}=     Convert To Boolean                  false
    ${expectedInteger}=     Convert To Integer                  200
    ${expectedDouble}=      Convert To Number                   20.54
    Should Be Equal         ${domain2.getDomain()}              domain2
    Should Be Equal         ${domain2.get('stringProperty')}            string property too
    Should Be Equal         ${domain2.getBoolean('booleanProperty')}    ${expectedBoolean}
    Should Be Equal         ${domain2.getInteger('integerProperty')}    ${expectedInteger}
    Should Be Equal         ${domain2.getDouble('doubleProperty')}      ${expectedDouble}

