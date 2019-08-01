Feature: Hello World
  Hello World feature test

  Scenario: Check App Title And Content
    Given I expect the "firstTabTitle" to be "Jeresy Cool!"
    Then I expect the "textField" to be "Hello, Jersey!"

  Scenario: Check App Title When Switch Page
    When I tap the "openBtn" button
    Then I expect the "secendTabTitle" to be "Jersey Second Tab"
    And I tap the "goBackBtn" button
    Then I expect the "firstTabTitle" to be "Jeresy Cool!"