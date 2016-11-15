Feature: Display Client Profile when selected

	As a counselor
	So that I can quickly look at a certain clients info
	I want to find the right client
	Then I want to see their intake form data and contact info

Background: clients have been added to database


	Given the following clients exist:
	| name	| counselor	| email 			|
	| Bob Smith			| Toni 		| bob@smith.net 	|
	| Joe Adams			| Yolanda 	| joe@adams.com		|
	| Mary Adams			| Yolanda 	| mary@adams.com 	|
	| Mary Williams			| Toni 		| mary@williams.nu	|

	And the following counselors exist:
	| name		| email						| password	|	phone_number		|	admin	|
	| Toni			|	toni@gmail.com		| toni		|	+15108295840	|	true	|
	Given I am on the login page
	And I login with email "toni@gmail.com" and password "toni"
	And I am on the clients page

Scenario: display a list of clients
    Given I am on the clients page
    Then I should see "bob@smith.net"
    And I should see "joe@adams.com"
    And I should see "mary@adams.com"
    And I should see "mary@williams.nu"

Scenario: I want to know if I have an upcoming appointment with client
	When I follow "Bob Smith"
	Then I should see "Intake Information for Bob Smith"
	And I should see no upcoming appointments

Scenario: I want to see all details from the intake form
	When I follow "Mary Adams"
	Then I should see "Intake Information for Mary Adams"
	And I should see the email is "mary@adams.com"
	And I should see the counselor is Yolanda
