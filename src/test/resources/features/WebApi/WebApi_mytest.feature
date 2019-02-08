@APIAutomation
Feature: WebAPI_Automation
  I want to use this template for my feature file to Automate a RestAPI

  Background: Datafile reading for the feature
    Given A workbook named "WebAPI_myTest" and sheet named "myTest" is read

  @postcall @addCar @XLdata
  Scenario Outline: Add car service
    Given BaseUri is available for "baseUrl"
    And Static "Headers" information are loaded for the WebApi
    And User provides correct headers for <DynamicHeaders>
    And User provides correct values for BasicAuthentication "BasicAuthentication"
    When User performs "Post" operation with <ListOfParameters> with correct values as par <BaseRequestJson>
    Then Verify the "statuscode" in for the Response
    And Verify the Expected Value for <ListofResponseFields> should match with response

    Examples: 
      | DynamicHeaders | BaseRequestJson    | ListOfParameters | ListofResponseFields |
      | abc            | WebApi_mytest.json | title~brand      | price~age            |

  @getcall @searchCar @XLdata
  Scenario Outline: Search car with id
    Given BaseUri is available for "baseUrl"
    And Static "Headers" information are loaded for the WebApi
    And User provides correct headers for <DynamicHeaders>
    And User provides correct values for BasicAuthentication "BasicAuthentication"
    When User performs "Get" operation with <ListOfParameters> with correct values as par <BaseRequestJson>
    Then Verify the "statuscode" in for the Response
    And Verify the Expected Value for <ListofResponseFields> should match with response

    Examples: 
      | DynamicHeaders | BaseRequestJson | ListOfParameters | ListofResponseFields |
      |                |                 |                  | _id                  |

  @Orchastrated @addCar @XLdata
  Scenario Outline: End to end car service validation
    Given BaseUri is available for "baseUrl"
    And Static "Headers" information are loaded for the WebApi
    And User provides correct headers for <DynamicHeaders>
    And User provides correct values for BasicAuthentication "BasicAuthentication"
    When User performs "Post" operation with <ListOfParameters> with correct values as par <BaseRequestJson>
    Then Verify the "statuscode" in for the Response
    And Verify the Expected Value for <ListofResponseFields> should match with response
    Given BaseUri is available for "baseUrlOrchastrated" with ID from last response
    And Static "Headers" information are loaded for the WebApi
    And User provides correct headers for <DynamicHeaders>
    And User provides correct values for BasicAuthentication "BasicAuthentication"
    When User performs "Get" operation with <ListOfParametersOrc> with correct values as par <BaseRequestJsonOrc>
    Then Verify the "statuscode" in for the Response
    And Verify the Expected Value for <ListofResponseFieldsOrc> should match with response

    Examples: 
      | DynamicHeaders | BaseRequestJson    | ListOfParameters | ListofResponseFields  | ListOfParametersOrc | BaseRequestJsonOrc | ListofResponseFieldsOrc |
      |                | WebApi_mytest.json | title~brand      | price~age~title~brand |                     |                    | price~age~title~brand   |
