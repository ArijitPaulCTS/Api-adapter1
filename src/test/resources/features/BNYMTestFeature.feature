Feature: Cucumber Test Scenarios 


Background: 
	Given A workbook named "BookTicket" and sheet named "Sheet1" is read 
	#change 1_2
Scenario: TS_04 
	When Browser is launched and navigate to specified url 
	
	 Scenario Outline: TS_01
    Then Book a bus ticket from "<location1>" to "<location2>"

    Examples: 
      | location1 | location2 |
      | from      | to        |
 #change 1_1     