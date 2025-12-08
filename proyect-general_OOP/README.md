# 🎯 Proyecto Personal: Fundamentos de Programación Orientada a Objetos

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![OOP](https://img.shields.io/badge/OOP-Fundamentals-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-En%20Desarrollo-yellow?style=for-the-badge)

*"No aprendas a programar, aprende a pensar como la computadora."*

</div>

---

## 📋 Descripción del Proyecto

Este es un **proyecto personal de estudio** enfocado en comprender profundamente los fundamentos de la **Programación Orientada a Objetos (OOP)**. El objetivo no es solo memorizar conceptos, sino entender el **"por qué"** detrás de cada uno.

La mayoría de cursos y tutoriales enseñan **qué es** una clase o **qué es** herencia, pero rara vez explican **por qué funcionan así** o **qué problema resuelven**. Este proyecto documenta ese aprendizaje profundo.

---

## 🎯 Objetivos del Proyecto

### Objetivo Principal
Construir una base sólida de conocimiento en OOP que permita:
- Entender **qué pasa internamente** cuando se ejecuta código orientado a objetos
- Comprender **por qué** existen los conceptos, no solo **qué** son
- Aplicar estos fundamentos a **Python** y **futuros lenguajes**

### Objetivos Específicos

| # | Objetivo | Estado |
|---|----------|--------|
| 1 | Dominar los 4 pilares de OOP (Abstracción, Encapsulamiento, Herencia, Polimorfismo) | ✅ |
| 2 | Entender constructores, destructores y el ciclo de vida de objetos | ✅ |
| 3 | Comprender el funcionamiento de `self`, `cls` y los decoradores | ✅ |
| 4 | Conocer los métodos mágicos (dunder methods) y su propósito | ✅ |
| 5 | Aplicar principios SOLID en diseño de clases | ✅ |
| 6 | Implementar patrones de diseño básicos (Factory Method) | ✅ |
| 7 | Documentar el aprendizaje de forma clara y reutilizable | ✅ |

---

## 📚 Contenido del Proyecto

### Documentación Teórica

#### `OOP_DOCUMENTACION.md`
Documentación completa y teórica de OOP en Python. Cada tema incluye:
- **Definición** precisa del concepto
- **¿Por qué existe?** - El problema que resuelve
- **¿Por qué funciona así?** - La lógica detrás del diseño
- **Ejemplos de código** prácticos

**Temas cubiertos:**
- Paradigmas de Programación
- Clases, Objetos e Instanciación
- Atributos y Métodos
- El parámetro `self`
- Constructores y Destructores
- Encapsulamiento y Propiedades
- Herencia y `super()`
- Polimorfismo y Duck Typing
- Abstracción y Clases Abstractas
- Composición vs Agregación
- Métodos de Clase y Estáticos
- Herencia Múltiple y MRO
- Sobrecarga de Operadores
- Métodos Mágicos (Dunder Methods)

#### `resumen.md`
Guía práctica de conceptos POO aplicados a un sistema de inventario. Incluye:
- Ejemplos de código real con explicaciones línea por línea
- Principios SOLID aplicados (ISP, LSP)
- Patrón Factory Method
- Variables de clase vs instancia
- Uso de decoradores (`@property`, `@classmethod`, `@staticmethod`)

---

## 🧠 Filosofía de Aprendizaje

Este proyecto sigue una metodología de aprendizaje basada en **tres preguntas fundamentales**:

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   1. ¿QUÉ ES?        →  Definición del concepto            │
│                                                             │
│   2. ¿POR QUÉ EXISTE? →  Problema que resuelve             │
│                                                             │
│   3. ¿CÓMO FUNCIONA?  →  Mecanismo interno                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Ejemplo aplicado:**

| Pregunta | Respuesta para "Constructor" |
|----------|------------------------------|
| ¿Qué es? | Método especial que inicializa objetos |
| ¿Por qué existe? | Para garantizar que cada objeto inicie con un estado válido |
| ¿Cómo funciona? | Python separa creación (`__new__`) de inicialización (`__init__`) |

---

## 🗂️ Estructura del Proyecto

```
proyect-general_OOP/
│
├── README.md                 # Este archivo - Introducción al proyecto
├── OOP_DOCUMENTACION.md      # Documentación teórica completa (25 temas)
├── resumen.md                # Guía práctica con ejemplos de código
├── example.py                # Ejemplos básicos de clases en Python
└── note.md                   # Notas rápidas y observaciones
```

---

## 🔑 Conceptos Clave Documentados

### Los 4 Pilares de OOP

| Pilar | Descripción | Pregunta que responde |
|-------|-------------|----------------------|
| **Abstracción** | Ocultar complejidad, mostrar lo esencial | ¿Qué necesita saber el usuario? |
| **Encapsulamiento** | Proteger datos internos | ¿Cómo evito estados inválidos? |
| **Herencia** | Reutilizar código de clases padre | ¿Cómo evito duplicar código? |
| **Polimorfismo** | Mismo método, diferentes comportamientos | ¿Cómo hago código flexible? |

### Decoradores Esenciales

| Decorador | Recibe | Uso Principal |
|-----------|--------|---------------|
| `@property` | `self` | Crear getters/setters elegantes |
| `@classmethod` | `cls` | Acceder a datos de clase |
| `@staticmethod` | Nada | Funciones utilitarias en clase |
| `@abstractmethod` | `self` | Definir contratos obligatorios |

### Principios SOLID Aplicados

| Principio | Significado | Aplicación |
|-----------|-------------|------------|
| **S** - Single Responsibility | Una clase, una responsabilidad | Clases pequeñas y enfocadas |
| **O** - Open/Closed | Abierto a extensión, cerrado a modificación | Herencia y polimorfismo |
| **L** - Liskov Substitution | Hijos sustituyen padres sin romper | Mantener contratos |
| **I** - Interface Segregation | Interfaces pequeñas y específicas | No forzar métodos innecesarios |
| **D** - Dependency Inversion | Depender de abstracciones | Usar interfaces/clases abstractas |

---

## 🚀 Próximos Pasos

- [ ] Agregar ejemplos de OOP en otros lenguajes (comparativa)
- [ ] Documentar patrones de diseño adicionales
- [ ] Crear ejercicios prácticos con soluciones
- [ ] Agregar diagramas UML de los conceptos

---

## 💡 ¿Por qué este proyecto?

> *"La diferencia entre un programador promedio y uno excepcional no está en cuánta sintaxis conoce, sino en cuánto entiende por qué las cosas funcionan como funcionan."*

Este proyecto nace de la necesidad de ir más allá de tutoriales superficiales. En lugar de solo copiar código, busco entender:

- **¿Por qué Python usa `self` explícito?** → Filosofía "explícito mejor que implícito"
- **¿Por qué existe el Garbage Collector?** → Automatizar la gestión de memoria
- **¿Por qué herencia múltiple es controversial?** → Problema del diamante y complejidad

Este conocimiento profundo es transferible a cualquier lenguaje de programación.

---

## 📖 Cómo usar este repositorio

1. **Comienza con `OOP_DOCUMENTACION.md`** - Lee los conceptos teóricos
2. **Consulta `resumen.md`** - Ve los conceptos aplicados a código real
3. **Experimenta con `example.py`** - Modifica y ejecuta los ejemplos
4. **Toma notas en `note.md`** - Agrega tus propias observaciones

---

## 🤝 Contribuciones

Este es un proyecto personal de aprendizaje, pero si encuentras errores o tienes sugerencias, ¡son bienvenidas!

---

## 📄 Licencia

Este proyecto es de uso educativo y personal. Siéntete libre de usar el contenido para tu propio aprendizaje.

---

<div align="center">

**Proyecto de Nivelación - Holberton School**

*Aprender a programar es aprender a pensar.*

</div>
