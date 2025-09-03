# Programa de planetas!

Este es un programa de planetas hecho en Flutter como prueba tecnica.

# Librerias

Hago uso de:

- Riverpod para el manejo de estados. Con el creé un fetchPlanetsProvider para traer los planetas de la API y mantener su estado. Un filteredPlanetsProvider para filtrar la busqueda de planetas junto a un searchQueryProvider para manejar el estado del input de busqueda.
- Go_route para las rutas
- Http para las requests a la API
- Google Fonts para usa una font en especifico (Nano Sans)

## Arquitectura

Me basé en la arquitectura limpia para estructurar el proyecto de la siguiente manera:

- Carpeta Presentation: Aquí tengo todas las vistas y providers auxiliares que ayudan a modificar la vista.
- Carpeta Domain: Donde tengo los modelos de como deberia recibir las respuesta de la API.
- Carpeta Data: Donde tengo el repositorio donde manejo las llamadas a la API.

## TO DO

- Mejorar la interfaz. La interfaz actualmente es funcional, pero me gustaria pulirla para que se vea mejor. No pude pulirla lo suficiente antes de la entrega, pero igual deseo hacer después de entregarlo.
