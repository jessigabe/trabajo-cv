# Tarea 6 – Evolución de Hoja de Vida

**Universidad Politécnica Estatal del Carchi**  
**Carrera:** Computación  
**Asignatura:** Desarrollo de Aplicaciones Móviles  
**Docente:** PhD. Samuel Lascano Rivera  
**Estudiante:** Jessica Cuasquen  
**Fecha:** Octubre de 2026

## Descripción

Este repositorio contiene la evolución de una hoja de vida desde una aplicación móvil nativa hacia una solución web responsiva y su posterior integración dentro de Flutter mediante WebView.

La entrega se divide en dos fases:

1. **Web CV:** desarrollo con HTML5, CSS3 y JavaScript bajo un enfoque Mobile-First.
2. **Flutter Wrapper:** aplicación Flutter que carga el contenido web local desde `assets/web/` mediante `webview_flutter`.

## Estructura

```text
trabajo-cv/
├── web_cv/
│   ├── index.html
│   ├── styles.css
│   └── app.js
└── cv_flutter_wrapper/
    ├── lib/
    │   ├── main.dart
    │   └── screens/
    │       └── cv_webview_screen.dart
    ├── assets/
    │   └── web/
    │       ├── index.html
    │       ├── styles.css
    │       └── app.js
    └── pubspec.yaml
```

## Funcionalidades implementadas

### Web CV
- HTML5 semántico.
- Diseño Mobile-First.
- CSS Grid y Flexbox.
- Línea de tiempo para formación y proyectos.
- Filtrado interactivo de habilidades.
- Sección expandible con JavaScript.
- Formulario demostrativo con validación.

### Flutter
- Carga local mediante `loadFlutterAsset`.
- Barra inferior nativa con inicio, recarga y tema claro/oscuro.
- Indicador nativo de progreso.
- JavaScript habilitado.
- Código Flutter modularizado en una pantalla independiente.

## Comparación resumida

| Criterio | Desarrollo nativo | Web embebido |
|---|---|---|
| Rendimiento | Interfaz renderizada directamente por Flutter | Añade la capa WebView |
| Mantenibilidad | Cambios concentrados en Dart | HTML/CSS/JS reutilizable |
| UI/UX | Integración completamente nativa | Depende del diseño responsive |
| Reutilización | Menor entre plataformas | Alta reutilización del contenido web |

## Conclusiones

1. El enfoque web embebido permite reutilizar una misma interfaz en distintas plataformas.
2. La solución nativa mantiene ventajas de integración y rendimiento, mientras que WebView simplifica el mantenimiento de contenido informativo.
3. La combinación de Flutter con HTML, CSS y JavaScript permite construir una solución híbrida funcional, adaptable y mantenible.

**Estudiante:** Jessica Cuasquen
