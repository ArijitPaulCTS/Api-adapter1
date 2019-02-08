@APIAutomation1
Feature: WebAPI_Automation
  I want to use this template for my feature file to Automate a RestAPI

  Background: Datafile reading for the feature
    Given A workbook named "WebAPI_myTest" and sheet named "myTest" is read

     
  @postcall @addCar
  Scenario: Add car service1
    Given BaseUri is "http://localhost:3000/api/cars"
    When User performs "Post" operation with
        |title|car1|
        |brand|brand1|
        |price|$2000|
        |age|5|
    Then Verify the "200" status code for the Response
    And response includes the following
        |title|car1|
        |brand|brand1|
        |price|$2000|
        |age|5|



      
