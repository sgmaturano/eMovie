# eMovie

Una app que lista peliculas de la página https://www.themoviedb.org/

## Características

- Lista de próximas películas.
- Lista de recomendadas.
- Lista de películas de tendencia de la última semana.
- Información detallada de la película.
- Tráilers de películas de YouTube.
- Función offline implementada.

## Mejoras pendientes

- Filtros por años e idioma en la secion de sugeridos.
- Animación en la transicion del listado de película al detalle.
- Sincronización para actualizacion de datos de películas con DispatchGroup.
- Manejo de errores en las request.
- Crear un componente para el manejo de otros servicios de video aparte del de YouTube.

## FAQ

#### ¿En qué consiste el principio de responsabilidad única? ¿Cuál es su propósito?

El principio de responsabilidad única consiste en que cada componente (clase, módulo) tenga una funcionalidad clara y que la misma sea única. El manejo de una tarea deberia estar provisto por una clase y la misma deberia estar bien encapsulada.
El proposito es ayudar a diagramar una correcta arquetectura del software, paraa que sea simple de mantener, cambiar (crecer), y de interpretar.

#### ¿Qué características tiene, según su opinión, un “buen” código o código limpio?

Para que el código tenga la cualidad de ser limpio, deberia ser conciso y claro. La resoluciones deben estar diagramadas en clases que indiquen su funcionamiento y proposito, y la extension del mismo no deberia ser muy extensa para que sea facil de recorrer.
Debe estar separados en funciones que cumplan su proposito y que el mismo sea unico, para no prestar confusion.
Y lo mas importante, es que el código mantenga la filosofia del patron de diseño que se haya escogido para garantizarnos la correcta interpretacion por terceros.

#### ¿Como implementar los filtros?

Para el filtro, se deberia crear componente dentro de la celda MovieVerticalListViewCell, que contenga un collectionView para que liste los filtros de un array definido pero dando la posibilidad de escalabilidad. Tambien sumarle un protocolo para comunicar la accion del touch sobre el filtro, para aplicar la logica a la lista de películas.


## License

[MIT](https://choosealicense.com/licenses/mit/)

## Authors

- [@sgmaturano](https://www.github.com/sgmaturano)
