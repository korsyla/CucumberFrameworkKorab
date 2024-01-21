@background
Feature: Background Example

  Background: 
    Given Precondition1
    And Precondition2

  Scenario: Example1
    When Test nr1 first name is "Emre" and lastName is "Can"
    And Test nr2
    And Test nr3
    Then Validate nr1
    And Validate nr2

  Scenario: Example2
    When Test nr4
    And Test nr5
    And Test nr6
    Then Validate nr3
    And Validate nr4
