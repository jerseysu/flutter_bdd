Feature: Hello World
  Hello World feature test

  Scenario: Check App Title And Content
    Given I expect the "firstTabTitle" to be "Jeresy Cool!"
    Then I expect the "textField" to be "Hello, Jersey!"