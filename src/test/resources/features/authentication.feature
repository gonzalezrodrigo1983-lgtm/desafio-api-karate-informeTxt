Feature: Autenticación API DummyJSON
  Como QA Automation Engineer
  Quiero validar endpoints de autenticación con Karate Framework
  Para evidenciar validaciones positivas y negativas parametrizadas en JSON

  Background:
    * url baseUrl
    * def users = read('classpath:data/auth-users.json')

  @api @auth @positive
  Scenario: Login exitoso de usuario parametrizado en JSON
    * def user = users[0]
    Given path 'auth', 'login'
    And request { username: '#(user.username)', password: '#(user.password)' }
    When method post
    Then status user.expectedStatus
    And match response contains { username: '#string', email: '#string' }

  @api @auth @negative
  Scenario: Login fallido de usuario parametrizado en JSON
    * def user = users[1]
    Given path 'auth', 'login'
    And request { username: '#(user.username)', password: '#(user.password)' }
    When method post
    Then status user.expectedStatus
    And match response.message contains 'Invalid'
