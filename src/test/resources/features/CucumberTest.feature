Feature: Cucumber Test Scenarios

  Background: 
    Given A workbook named "BookTicket" and sheet named "Sheet1" is read

  Scenario: TS_04
    When Browser is launched and navigate to specified url

  Scenario Outline: TS_05
    Then Book a bus ticket from "<location1>" to "<location2>"
	#change 1_2
    Examples: 
      | location1 | location2 |
      | from      | to        |
# change 1_1