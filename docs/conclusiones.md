# Conclusiones - Automatización APIs

## Cobertura lograda
La suite Karate cubre autenticación, consulta, creación, actualización, búsqueda y casos negativos sobre DummyJSON. Se incorporan datos JSON para autenticación y payloads, además de CSV para consultas parametrizadas.

## Hallazgos
- La API pública permite validar códigos HTTP 200, 201, 400 y 404.
- Los contratos mínimos validan tipos de datos claves: `id`, `title`, `price`, `rating`, `email` y `username`.
- El diseño permite agregar más productos al CSV sin modificar la lógica del feature.

## Recomendaciones
- Integrar el reporte Karate en pipeline CI/CD.
- Agregar pruebas de esquema más estrictas con JSON Schema si el contrato queda formalizado.
- Separar ambientes con `karate.env` si se incorporan entornos QA/UAT privados.
