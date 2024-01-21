
Feature: Scenario Outline Example

	@outline
  Scenario Outline: 
    When Login with "<username>" and "<password>"
    And Click on the login button
    Then Validate that "<username>" is displayed
    And We want to say Bye "<fullname>"

    Examples: 
      | username | password | fullname         |
      | Caglarr  | c1234    | Caglarr Akchinar |
      | Mesutt   | m1234    | Mesutt Errol     |
      | Yldirimm | Y1234    | Yldirimm Likosh  |
