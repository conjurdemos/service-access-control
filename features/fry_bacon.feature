Feature: Frying bacon

  Scenario: Anonymous users cannot fry bacon
    When I fry bacon
    Then I am not authenticated

  Scenario: Alice cannot fry bacon
    Given I am logged in as Alice
    When I fry bacon
    Then it is denied

  Scenario: Bob can fry bacon
    Given I am logged in as Bob
    When I fry bacon
    Then it is allowed
    And the response should be "Bacon fried!"
