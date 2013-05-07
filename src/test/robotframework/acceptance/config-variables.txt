*** Settings ***
Library     JSpringBotGlobal
Library     BuiltIn

*** Variables ***
${robotVariable}                     robotVariableValue

*** Test Cases ***
# When resource filtering is true, maven properties values are substituted in all the variable in the indicated folder.
Maven Property Can Be Used In Config Variables
    ${mavenVarValue}=           EL Evaluate             $[config:config-variables:test1]
    Should Be Equal As Strings  ${mavenVarValue}        mavenValue

Maven Property Supersedes EL Variable
    EL Add Variable             var6                    elValue
    EL Should Be Equal          $[config:config-variables:test6]   mavenValue

Maven Property Supersedes Robot Variable and EL Variable
    EL Add Variable             var9                    elValue
    EL Should Be Equal          $[config:config-variables:test9]   mavenValue

# Samples below will only work when resource filtering is turned off
# Maven Property Are Not Substituted In Config Variables
#    ${mavenVarValue}=           EL Evaluate             $[config:config-variables:test1]
#    Should Be Equal As Strings  ${mavenVarValue}        null
#
# EL Variable Is Used Instead Of Maven Property
#    EL Add Variable             var6                    elValue
#    EL Should Be Equal          $[config:config-variables:test6]   elValue
#
# EL Variable Is Used Instead Of Maven Property and EL Variable Supersedes Robot Variable
#    EL Add Variable             var9                    elValue
#    EL Should Be Equal          $[config:config-variables:test9]   elValue

# Robot VS EL Variables
Robot Variable Can Be Used In Config Variables
    ${robotVarValue}=           EL Evaluate             $[config:config-variables:test2]
    Should Be Equal As Strings  ${robotVarValue}        robotValue

Robot Variable Defined In Variables Group Can Be Used In Config Variables
    ${robotVariableValue}=      EL Evaluate             $[config:config-variables:test2b]
    Should Be Equal As Strings  ${robotVariableValue}   robotVariableValue

EL Variable Can Be Used In Config Variables
    EL Add Variable             elVar                   elValue
    ${elVarValue}=              EL Evaluate             $[config:config-variables:test3]
    Should Be Equal As Strings  ${elVarValue}           elValue

EL Global Variable Can Be Used In Config Variables
    EL Add Global Variable      elGlobalVar             elGlobalValue
    ${elGlobalVarValue}=        EL Evaluate             $[config:config-variables:test4]
    Should Be Equal As Strings  ${elGlobalVarValue}     elGlobalValue

EL Variable Format Can't Be Used In Config
    EL Add Variable             elVar                   elValue
    ${elVarValue}=              EL Evaluate             $[config:config-variables:test5]
    Should Be Equal As Strings  ${elVarValue}           $[elVar]

EL Variable Supersedes Robot Variable Scenario 1
    EL Add Variable             var7                    elValue
    EL Should Be Equal          $[config:config-variables:test7]   elValue

EL Variable Supersedes Robot Variable Scenario 2
    ${var8}=                    Set Variable            robotValue
    EL Add Variable             var8                    elValue
    EL Should Be Equal          $[config:config-variables:test8]   elValue

Config Variable Is Case Sensitive Scenario 1
    EL Add Variable             VAR10                   elValue
    EL Should Be Equal          $[config:config-variables:test10]  elValue

Config Variable Is Case Sensitive Scenario 2
    ${var11a}                   Set Variable            robotValue
    EL Add Variable             VAR11A                   elValue
    EL Should Be Equal          $[config:config-variables:test11a]  robotValue
    ${var11a}                   Set Variable            robotValue
    EL Add Variable             VAR11B                   elValue
    EL Should Be Equal          $[config:config-variables:test11b]  elValue