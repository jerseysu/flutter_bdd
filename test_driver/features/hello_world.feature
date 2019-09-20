Feature: Hello World
  Hello World feature test

  Scenario: Check App Title And Content
    Given I expect the "firstTabTitle" to be "Jeresy Cool!"
    Then I expect the "textField" to be "Hello, Jersey!"

  Scenario: Check App Title When Switch Page
    Given I go to second page
    Then I expect second page title to be "Jersey Second Tab"
    When I go to landing page
    Then I expect landing page title to be "Jeresy Cool!"