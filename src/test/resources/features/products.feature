Feature: Gestión y consulta de productos API DummyJSON
  Como QA Automation Engineer
  Quiero validar endpoints REST con Karate Framework
  Para confirmar contratos, códigos HTTP, casos positivos, negativos y datos parametrizados

  Background:
    * url baseUrl

  @api @products @positive @data-driven
  Scenario Outline: Consultar producto existente por identificador <caseId>
    Given path 'products', <productId>
    When method get
    Then status <expectedStatus>
    And match response contains { id: <productId>, title: '#string', price: '#number' }
    And match response.rating == '#number'

    Examples:
      | read('classpath:data/products.csv') |

  @api @products @create
  Scenario: Crear producto con payload parametrizado
    * def payload = read('classpath:data/new-product.json')
    Given path 'products', 'add'
    And request payload
    When method post
    Then status 201
    And match response.title == payload.title
    And match response.category == payload.category

  @api @products @update
  Scenario: Actualizar producto existente
    Given path 'products', 1
    And request { title: 'Producto actualizado QA Automation' }
    When method put
    Then status 200
    And match response.id == 1
    And match response.title == 'Producto actualizado QA Automation'

  @api @products @negative
  Scenario: Consultar producto inexistente
    Given path 'products', 999999
    When method get
    Then status 404
    And match response.message contains 'not found'

  @api @products @contract
  Scenario: Buscar productos por texto y validar contrato mínimo
    Given path 'products', 'search'
    And param q = 'phone'
    When method get
    Then status 200
    And match response.products == '#[]'
    And match each response.products contains { id: '#number', title: '#string', price: '#number' }
