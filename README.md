# Desafío Técnico - Automatización de APIs con Karate Framework

## Objetivo
Automatizar validaciones de API sobre una URL pública de práctica QA:

- URL base: `https://dummyjson.com`
- Autenticación: `POST /auth/login`
- Productos: `GET /products/{id}`, `POST /products/add`, `PUT /products/{id}`, `GET /products/search`, `GET /products/999999`

## Stack técnico
- Java 17, compatible con JDK 11/17.
- Maven 3.9.1 compatible.
- Karate Framework 1.5.x.
- JUnit 5.
- Datos parametrizados en JSON y CSV.
- Reporte Cucumber/HTML generado por Karate.

## Estructura relevante
```text
src/test/resources/features/authentication.feature
src/test/resources/features/products.feature
src/test/resources/data/auth-users.json
src/test/resources/data/products.csv
src/test/resources/data/new-product.json
src/test/resources/karate-config.js
docs/conclusiones.md
docs/INFORME_CIERRE_DESAFIO.txt
docs/analisis-reportes.md
```


## Informe de cierre TXT
Se agrega el archivo `docs/INFORME_CIERRE_DESAFIO.txt` como informe de cierre del desafio, incluyendo objetivo, alcance cubierto, refactorizacion aplicada, evidencias, resultado del cierre, observaciones y conclusion final.

## Ejecutar pruebas
```bash
mvn clean test
```

Cambiar URL base:
```bash
mvn clean test -DbaseUrl=https://dummyjson.com
```

Ejecutar por tag:
```bash
mvn clean test -Dkarate.options="--tags @products"
```

## Reportes generados
- Karate HTML: `target/karate-reports/karate-summary.html`
- Cucumber JSON: `target/karate-reports/*.json`

El repositorio incluye un reporte físico de referencia en `target/karate-reports/`. Al ejecutar localmente se regenera con resultados reales.

## Cobertura API
| Caso | Endpoint | Tipo | Estado |
|---|---|---|---|
| Login exitoso | POST `/auth/login` | Positivo | Cubierto |
| Login inválido | POST `/auth/login` | Negativo | Cubierto |
| Consultar productos por CSV | GET `/products/{id}` | Positivo data-driven | Cubierto |
| Crear producto | POST `/products/add` | Positivo | Cubierto |
| Actualizar producto | PUT `/products/{id}` | Positivo | Cubierto |
| Producto inexistente | GET `/products/999999` | Negativo | Cubierto |
| Búsqueda y contrato | GET `/products/search?q=phone` | Contrato | Cubierto |
# desafio-api-karate-informeTxt
