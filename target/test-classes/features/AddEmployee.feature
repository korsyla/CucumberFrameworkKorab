@addEmployee
Feature: Add Employee

	@smoke
	Scenario: Add Employee with first and last name
	Given User is logged in with valid credentials
	When User navigates to Add Employee page
	And User enters their first and last name
	When User selects their location
	And User clicks on the save button
	Then Personal details page is displayed
	
	
	@regression
	Scenario: Add Employee without employee id (delete employee id before saving)
	Given User is logged in with valid credentials
	When User navigates to Add Employee page
	And User enters their first and last name
	And User selects their location
	When User erases their Employee ID
	And User clicks on the save button
	Then Personal details page is displayed with blank Employee ID
	
	@integration
	Scenario: Add Employee and create login Credentials
	Given User is logged in with valid credentials
	When User navigates to Add Employee page
	And User enters their first and last name
	When User selects their location
	And User clicks Create Login Details button
	When User enters their login information
	And User clicks on the save button
	Then Personal details page is displayed
	
	
	
	
	