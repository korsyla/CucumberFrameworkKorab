#Author: Korab Syla
Feature: Add Employee Feature
  I want to test the Add Employee Functionality

  Background: 
    Given user is logged in with valid credentials
    And user navigates to AddEmployee page

  @AddEmployee
  Scenario: Add Employee with first and last name
    When user enters employee first name and last name
    And user selects a location
    And user clicks on save button
    Then validate that employee is added successfully

  @task
  Scenario: Add Employee with parametrized first and last name
    When user enters employee first name "Cristiano" and last name "Ronaldo"
    And user selects a location
    And user clicks on save button
    Then validate that employee "Cristiano" is added successfully

  @third
  Scenario: Add Employee and create login Credentials
    When user enters employee first name "Emre" and last name "Can"
    And user selects a location
    And user clicks on Create Login Details
    And user provides credentials
    And user clicks on save button
    Then validate that employee "Emre" is added successfully
    
	#We can perform DDT using Scenario Outline: and Examples: keyword / PREFERRED
  @scenarioOutline
  Scenario Outline: Adding multiple employees with scenario outline
    When user enters employee "<FirstName>", "<MiddleName>" and "<LastName>"
    And user enters a location "<Location>"
    And user clicks on save button
    Then validate that "<FirstName>" is added successfully

    Examples: 
      | FirstName | MiddleName | LastName | Location                         |
      | Joe       | R          | Biden    | New York Sales Office            |
      | Donald    | J          | Trumph   | Chinese Development Center       |
      | Barack    | H          | Obama    | South African Development Center |

      
   #We can also perform DDT using DataTable / NOT PREFERRED
   @UsingDataTable
   Scenario: Adding multiple employees with Datatable
    When user enters employee details and clicks on save and validates it is added
      | FirstName | MiddleName | LastName |
      | Yilirim   | F          | Likos    |
      | Emre      | A          | Cinar    |
      | Emilija   | T          | Markovic |
   
   
	
		@excelDataTable
		Scenario: Add multiple employees from excel
			When user enters employee data from "Employee" excel sheet then save   
      
      
      
      
      
      
      
      