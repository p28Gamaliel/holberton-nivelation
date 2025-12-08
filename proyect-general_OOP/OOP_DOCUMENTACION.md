# Programación Orientada a Objetos en Python

> **Filosofía de este documento**: Entender QUÉ es cada concepto y POR QUÉ funciona de esa manera.

---

## Índice

1. [Paradigma de Programación](#1-paradigma-de-programación)
2. [Programación Orientada a Objetos](#2-programación-orientada-a-objetos)
3. [Clase](#3-clase)
4. [Objeto](#4-objeto)
5. [Instanciación](#5-instanciación)
6. [Atributos](#6-atributos)
7. [Métodos](#7-métodos)
8. [El parámetro self](#8-el-parámetro-self)
9. [Constructor](#9-constructor)
10. [Destructor](#10-destructor)
11. [Encapsulamiento](#11-encapsulamiento)
12. [Herencia](#12-herencia)
13. [Polimorfismo](#13-polimorfismo)
14. [Abstracción](#14-abstracción)
15. [Composición](#15-composición)
16. [Agregación](#16-agregación)
17. [Método de Clase](#17-método-de-clase)
18. [Método Estático](#18-método-estático)
19. [Propiedades](#19-propiedades)
20. [Clases Abstractas](#20-clases-abstractas)
21. [Interfaces](#21-interfaces)
22. [Herencia Múltiple](#22-herencia-múltiple)
23. [Method Resolution Order (MRO)](#23-method-resolution-order-mro)
24. [Sobrecarga de Operadores](#24-sobrecarga-de-operadores)
25. [Métodos Mágicos (Dunder Methods)](#25-métodos-mágicos-dunder-methods)

---

## 1. Paradigma de Programación

### Definición

Un **paradigma de programación** es un enfoque fundamental o estilo para estructurar y organizar el código de un programa. Es una forma de pensar y modelar soluciones a problemas computacionales.

### ¿Por qué existen los paradigmas?

Los paradigmas existen porque diferentes problemas requieren diferentes formas de pensamiento. A medida que la programación evolucionó, surgieron nuevas formas de organizar el código para manejar la creciente complejidad del software.

### Tipos principales de paradigmas

- **Imperativo**: El programa es una secuencia de instrucciones que modifican el estado.
- **Declarativo**: El programa describe QUÉ resultado se desea, no CÓMO obtenerlo.
- **Funcional**: El programa se construye mediante composición de funciones puras.
- **Orientado a Objetos**: El programa se organiza en objetos que contienen datos y comportamiento.

### ¿Por qué Python soporta múltiples paradigmas?

Python fue diseñado como un lenguaje multi-paradigma porque su creador, Guido van Rossum, creía que diferentes problemas se resuelven mejor con diferentes enfoques. Esto da flexibilidad al programador.

```python
# Paradigma imperativo
total = 0
for i in range(10):
    total += i

# Paradigma funcional
from functools import reduce
total = reduce(lambda a, b: a + b, range(10))

# Paradigma orientado a objetos
class Sumador:
    def __init__(self):
        self.total = 0
    
    def agregar(self, valor):
        self.total += valor
```

---

## 2. Programación Orientada a Objetos

### Definición

La **Programación Orientada a Objetos (OOP)** es un paradigma de programación que organiza el software en unidades llamadas "objetos", los cuales combinan estado (datos) y comportamiento (funciones) en una sola entidad.

### ¿Por qué surgió OOP?

OOP surgió en los años 60-70 como respuesta a la "crisis del software". Los programas se volvían tan grandes y complejos que era difícil mantenerlos. La programación procedural (secuencias de funciones) no escalaba bien.

OOP propone modelar el software de manera similar a como percibimos el mundo real: como una colección de objetos que interactúan entre sí.

### Principio fundamental

El principio fundamental de OOP es la **encapsulación de datos y comportamiento**. En lugar de tener datos sueltos y funciones separadas que operan sobre esos datos, OOP los agrupa en una unidad cohesiva.

### ¿Por qué funciona este enfoque?

Funciona porque:
1. **Modularidad**: Cada objeto es una unidad independiente que puede desarrollarse y probarse por separado.
2. **Reutilización**: Los objetos pueden reutilizarse en diferentes partes del programa o en otros programas.
3. **Mantenibilidad**: Los cambios en un objeto tienen impacto limitado en el resto del sistema.
4. **Modelado natural**: Permite representar entidades del mundo real de forma intuitiva.

```python
# Sin OOP: datos y funciones separados
nombre = "Juan"
edad = 25

def cumplir_anos(edad_actual):
    return edad_actual + 1

edad = cumplir_anos(edad)

# Con OOP: datos y comportamiento unidos
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad
    
    def cumplir_anos(self):
        self.edad += 1

juan = Persona("Juan", 25)
juan.cumplir_anos()
```

---

## 3. Clase

### Definición

Una **clase** es una plantilla, molde o plano que define la estructura y el comportamiento que tendrán los objetos creados a partir de ella. Una clase especifica qué atributos (datos) y qué métodos (comportamiento) tendrán sus instancias.

### ¿Por qué existen las clases?

Las clases existen para definir tipos de datos personalizados. Python viene con tipos incorporados (int, str, list), pero las clases permiten crear tipos específicos para el dominio del problema que se está resolviendo.

### ¿Por qué una clase es una "plantilla"?

Se le llama plantilla porque la clase en sí misma no contiene datos concretos, sino que define la estructura que tendrán los datos. Es como el plano de una casa: el plano define dónde irán las habitaciones, pero no es una casa habitable.

### Naturaleza de las clases en Python

En Python, las clases son objetos de primera clase. Esto significa que una clase es también un objeto que puede asignarse a variables, pasarse como argumento, y manipularse en tiempo de ejecución. Python crea las clases usando una metaclase llamada `type`.

```python
class Vehiculo:
    ruedas = 4
    
    def __init__(self, marca):
        self.marca = marca
    
    def describir(self):
        return f"Vehículo {self.marca} con {self.ruedas} ruedas"

# La clase existe como objeto
print(type(Vehiculo))  # <class 'type'>
print(Vehiculo.ruedas)  # 4 - Acceso a atributo de clase
```

---

## 4. Objeto

### Definición

Un **objeto** es una instancia concreta de una clase. Es una entidad en memoria que posee estado (valores de sus atributos) e identidad (ubicación única en memoria). El objeto es la materialización de la plantilla definida por la clase.

### ¿Por qué distinguir entre clase y objeto?

La distinción existe porque una clase es una descripción abstracta, mientras que un objeto es una entidad concreta. Puedes tener una sola clase "Persona" pero millones de objetos persona, cada uno con sus propios datos.

### Identidad, Estado y Comportamiento

Todo objeto en Python tiene tres características:

1. **Identidad**: Un identificador único que lo distingue de otros objetos. En Python es la dirección de memoria, accesible mediante `id()`.

2. **Estado**: El conjunto de valores de sus atributos en un momento dado.

3. **Comportamiento**: Las acciones que puede realizar, definidas por sus métodos.

### ¿Por qué cada objeto tiene identidad única?

Porque cada objeto ocupa un espacio diferente en la memoria del computador. Aunque dos objetos tengan exactamente los mismos valores, son entidades distintas que existen en ubicaciones diferentes.

```python
class Punto:
    def __init__(self, x, y):
        self.x = x
        self.y = y

punto1 = Punto(3, 4)
punto2 = Punto(3, 4)

# Identidad: cada objeto tiene dirección única
print(id(punto1))  # Ej: 140234567890
print(id(punto2))  # Ej: 140234567900 (diferente)

# Estado: valores actuales
print(punto1.x, punto1.y)  # 3 4

# Comportamiento: métodos disponibles
print(dir(punto1))  # Lista de métodos y atributos
```

---

## 5. Instanciación

### Definición

La **instanciación** es el proceso de crear un objeto (instancia) a partir de una clase. Es el momento en que se reserva memoria para el objeto y se inicializan sus atributos.

### ¿Por qué se llama "instanciar"?

El término viene de "instancia" que significa "caso particular". Cuando instancias una clase, estás creando un caso particular o ejemplo concreto de esa clase.

### Proceso interno de instanciación en Python

Cuando escribes `objeto = Clase()`, Python ejecuta internamente dos pasos:

1. **`__new__`**: Crea el objeto y reserva memoria para él.
2. **`__init__`**: Inicializa el objeto con los valores proporcionados.

### ¿Por qué Python tiene dos pasos?

Separar creación de inicialización permite mayor control. `__new__` es necesario en casos avanzados como crear objetos inmutables, implementar patrones singleton, o controlar la asignación de memoria. Para uso normal, solo se define `__init__`.

```python
class Libro:
    def __new__(cls, *args, **kwargs):
        print("1. Creando objeto en memoria")
        instancia = super().__new__(cls)
        return instancia
    
    def __init__(self, titulo, autor):
        print("2. Inicializando atributos")
        self.titulo = titulo
        self.autor = autor

libro = Libro("El Quijote", "Cervantes")
# Salida:
# 1. Creando objeto en memoria
# 2. Inicializando atributos
```

---

## 6. Atributos

### Definición

Los **atributos** son variables que pertenecen a una clase o a un objeto. Representan el estado o las características de la entidad modelada. Los atributos almacenan los datos que definen a cada objeto.

### Tipos de atributos

Existen dos tipos fundamentales:

1. **Atributos de instancia**: Pertenecen a cada objeto individual. Cada instancia tiene su propia copia con valores independientes.

2. **Atributos de clase**: Pertenecen a la clase y son compartidos por todas las instancias.

### ¿Por qué existen dos tipos?

Los atributos de instancia existen porque cada objeto necesita mantener su propio estado independiente. Los atributos de clase existen para compartir datos comunes entre todas las instancias, evitando duplicación.

### ¿Por qué los atributos de instancia se definen en `__init__`?

Se definen en `__init__` porque es el método que se ejecuta cada vez que se crea un objeto. Así se garantiza que cada instancia tenga sus propios atributos correctamente inicializados.

```python
class Empleado:
    # Atributo de clase: compartido por todos
    empresa = "TechCorp"
    cantidad_empleados = 0
    
    def __init__(self, nombre, salario):
        # Atributos de instancia: únicos para cada objeto
        self.nombre = nombre
        self.salario = salario
        Empleado.cantidad_empleados += 1

emp1 = Empleado("Ana", 50000)
emp2 = Empleado("Luis", 45000)

print(emp1.nombre)  # Ana - atributo de instancia
print(emp2.nombre)  # Luis - diferente valor
print(emp1.empresa)  # TechCorp - atributo de clase
print(Empleado.cantidad_empleados)  # 2 - compartido
```

---

## 7. Métodos

### Definición

Los **métodos** son funciones definidas dentro de una clase que describen los comportamientos o acciones que los objetos de esa clase pueden realizar. Un método siempre tiene acceso al objeto sobre el cual opera.

### ¿Por qué los métodos están dentro de la clase?

Los métodos están dentro de la clase porque operan sobre los datos de los objetos de esa clase. Al estar encapsulados juntos, los datos y las operaciones que los manipulan forman una unidad coherente.

### Diferencia entre función y método

Una **función** es un bloque de código independiente. Un **método** es una función que está asociada a una clase y opera sobre instancias de esa clase. La diferencia fundamental es que el método recibe implícitamente una referencia al objeto.

### ¿Por qué un método necesita acceso al objeto?

Porque el método debe poder leer y modificar los atributos específicos del objeto sobre el cual fue invocado. Sin acceso al objeto, el método no sabría sobre qué datos operar.

```python
class Rectangulo:
    def __init__(self, ancho, alto):
        self.ancho = ancho
        self.alto = alto
    
    def calcular_area(self):
        return self.ancho * self.alto
    
    def calcular_perimetro(self):
        return 2 * (self.ancho + self.alto)
    
    def escalar(self, factor):
        self.ancho *= factor
        self.alto *= factor

rect = Rectangulo(5, 3)
print(rect.calcular_area())  # 15
rect.escalar(2)
print(rect.calcular_area())  # 60
```

---

## 8. El parámetro self

### Definición

**`self`** es una referencia al objeto actual sobre el cual se está invocando el método. Es el primer parámetro de todo método de instancia y permite acceder a los atributos y otros métodos del objeto.

### ¿Por qué existe self?

`self` existe porque Python necesita una forma de distinguir entre variables locales del método y atributos del objeto. Sin `self`, no habría manera de saber si `nombre` se refiere a un parámetro local o al atributo del objeto.

### ¿Por qué self es explícito en Python?

En otros lenguajes como Java o C++, la referencia al objeto actual (`this`) es implícita. Python eligió hacerla explícita siguiendo su filosofía "explícito es mejor que implícito" (Zen de Python). Esto hace el código más claro y predecible.

### ¿Qué es self realmente?

`self` es simplemente una variable que contiene la dirección de memoria del objeto. Cuando llamas `objeto.metodo()`, Python automáticamente pasa `objeto` como primer argumento al método.

### ¿Por qué se llama "self"?

Es una convención, no una palabra reservada. Podrías usar cualquier nombre, pero `self` es el estándar universal en Python. Usar otro nombre funcionaría pero violaría las convenciones y confundiría a otros programadores.

```python
class Contador:
    def __init__(self):
        self.valor = 0
    
    def incrementar(self):
        self.valor += 1
    
    def obtener(self):
        return self.valor

c = Contador()
c.incrementar()

# Lo que Python hace internamente:
Contador.incrementar(c)  # Pasa 'c' como 'self'

# Demostración de que self es el objeto
class Demo:
    def mostrar_self(self):
        print(f"self es: {self}")
        print(f"id de self: {id(self)}")

d = Demo()
print(f"id de d: {id(d)}")
d.mostrar_self()
# Ambos id son iguales: self ES el objeto d
```

---

## 9. Constructor

### Definición

El **constructor** es un método especial que se ejecuta automáticamente cuando se crea una nueva instancia de una clase. Su propósito es inicializar el estado del objeto, estableciendo los valores iniciales de sus atributos.

### ¿Por qué se llama constructor?

Se llama constructor porque "construye" o prepara el objeto para su uso. Aunque técnicamente en Python el constructor real es `__new__`, coloquialmente se llama constructor a `__init__` porque es donde se inicializa el objeto.

### Diferencia entre `__new__` y `__init__`

- **`__new__`**: Constructor real. Crea y retorna la instancia. Rara vez se sobrescribe.
- **`__init__`**: Inicializador. Recibe la instancia ya creada y la configura. Es el que usamos normalmente.

### ¿Por qué el constructor no retorna nada?

`__init__` no debe retornar nada (implícitamente retorna `None`) porque no es responsable de crear el objeto, solo de inicializarlo. El objeto ya existe cuando `__init__` se ejecuta, fue creado por `__new__`.

### ¿Por qué los atributos se asignan con self.atributo?

Porque necesitamos indicar que el atributo pertenece al objeto (self), no que es una variable local del método. `self.nombre = nombre` crea un atributo del objeto, mientras que solo `nombre = valor` crearía una variable local que se perdería al terminar el método.

```python
class CuentaBancaria:
    def __init__(self, titular, saldo_inicial=0):
        self.titular = titular
        self.saldo = saldo_inicial
        self.movimientos = []
        self.activa = True
        print(f"Cuenta creada para {titular}")
    
    def depositar(self, monto):
        self.saldo += monto
        self.movimientos.append(f"+{monto}")

# El constructor se ejecuta automáticamente
cuenta = CuentaBancaria("María", 1000)
# Salida: Cuenta creada para María
```

---

## 10. Destructor

### Definición

El **destructor** es un método especial que se ejecuta cuando un objeto está a punto de ser eliminado de la memoria. En Python se define con `__del__` y su propósito es realizar tareas de limpieza antes de que el objeto desaparezca.

### ¿Por qué existen los destructores?

Los destructores existen para liberar recursos que el objeto haya adquirido durante su vida: cerrar archivos abiertos, cerrar conexiones de red o base de datos, liberar memoria adicional, etc.

### ¿Por qué en Python el destructor es poco usado?

Porque Python tiene un **Garbage Collector** (recolector de basura) que automáticamente detecta objetos no utilizados y libera su memoria. Además, Python tiene mejores mecanismos como context managers (`with`) para manejo de recursos.

### Problema con `__del__`

El momento exacto en que se ejecuta `__del__` es impredecible. El Garbage Collector decide cuándo eliminar objetos, lo que puede ser inmediatamente o mucho después. Por esto no es confiable para tareas críticas de limpieza.

### ¿Cuándo se elimina un objeto?

Un objeto se elimina cuando no hay ninguna referencia apuntando a él. Python cuenta las referencias a cada objeto, y cuando el contador llega a cero, el objeto puede ser eliminado.

```python
class Archivo:
    def __init__(self, nombre):
        self.nombre = nombre
        print(f"Abriendo archivo: {nombre}")
    
    def __del__(self):
        print(f"Cerrando archivo: {self.nombre}")

# Crear objeto
archivo = Archivo("datos.txt")
# Salida: Abriendo archivo: datos.txt

# Eliminar referencia
del archivo
# Salida: Cerrando archivo: datos.txt

# Mejor práctica: usar context manager
class ArchivoMejorado:
    def __init__(self, nombre):
        self.nombre = nombre
    
    def __enter__(self):
        print(f"Abriendo: {self.nombre}")
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"Cerrando: {self.nombre}")

with ArchivoMejorado("datos.txt") as f:
    print("Usando archivo")
# Cierre garantizado al salir del 'with'
```

---

## 11. Encapsulamiento

### Definición

El **encapsulamiento** es el principio de OOP que consiste en ocultar los detalles internos de un objeto y exponer solo una interfaz pública controlada. Los datos internos se protegen del acceso directo externo.

### ¿Por qué existe el encapsulamiento?

El encapsulamiento existe para:
1. **Proteger la integridad de los datos**: Evitar que código externo ponga al objeto en un estado inválido.
2. **Ocultar la complejidad**: El usuario del objeto no necesita conocer cómo funciona internamente.
3. **Permitir cambios internos**: La implementación interna puede cambiar sin afectar al código que usa el objeto.

### Niveles de acceso en Python

Python no tiene modificadores de acceso reales como otros lenguajes. Usa convenciones:

- **Público** (`nombre`): Accesible desde cualquier lugar.
- **Protegido** (`_nombre`): Convención que indica "uso interno", pero sigue siendo accesible.
- **Privado** (`__nombre`): Python aplica "name mangling", renombrando el atributo para dificultar el acceso.

### ¿Por qué Python no tiene privacidad real?

Python sigue la filosofía "somos todos adultos responsables". Confía en que los programadores respetarán las convenciones. El name mangling existe solo para evitar colisiones accidentales en herencia, no como mecanismo de seguridad.

```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre       # Público
        self._documento = "12345"  # Protegido (convención)
        self.__salario = 50000     # Privado (name mangling)
    
    def obtener_salario(self):
        return self.__salario
    
    def establecer_salario(self, nuevo_salario):
        if nuevo_salario > 0:
            self.__salario = nuevo_salario

p = Persona("Juan", 30)

print(p.nombre)           # Funciona: público
print(p._documento)       # Funciona: protegido es solo convención
# print(p.__salario)      # Error: no existe __salario
print(p._Persona__salario)  # Funciona: name mangling
print(p.obtener_salario())  # Forma correcta de acceder
```

---

## 12. Herencia

### Definición

La **herencia** es un mecanismo que permite crear una nueva clase (clase hija o derivada) basada en una clase existente (clase padre o base). La clase hija hereda los atributos y métodos de la clase padre y puede añadir nuevos o modificar los existentes.

### ¿Por qué existe la herencia?

La herencia existe para:
1. **Reutilización de código**: No repetir código que ya existe en otra clase.
2. **Establecer jerarquías**: Modelar relaciones "es un" (un Perro ES UN Animal).
3. **Especialización**: Crear versiones más específicas de clases generales.
4. **Polimorfismo**: Permitir que objetos de diferentes clases se traten de manera uniforme.

### Relación "es un" (is-a)

La herencia modela la relación "es un". Si puedes decir "X es un Y", entonces X puede heredar de Y. Un Perro ES UN Animal, entonces Perro puede heredar de Animal. Si la relación no tiene sentido, no uses herencia.

### ¿Qué se hereda exactamente?

Se heredan todos los atributos y métodos de la clase padre. La clase hija puede:
- Usar los métodos heredados tal cual
- Sobrescribir métodos para cambiar su comportamiento
- Añadir nuevos métodos y atributos

### La función super()

`super()` retorna un objeto proxy que permite acceder a métodos de la clase padre. Es útil cuando sobrescribes un método pero aún necesitas la funcionalidad original.

```python
class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    
    def hablar(self):
        return "Sonido genérico"
    
    def describir(self):
        return f"Soy {self.nombre}"

class Perro(Animal):
    def __init__(self, nombre, raza):
        super().__init__(nombre)  # Llama al constructor padre
        self.raza = raza
    
    def hablar(self):  # Sobrescribe el método
        return "Guau!"
    
    def describir(self):  # Extiende el método
        descripcion_base = super().describir()
        return f"{descripcion_base}, un {self.raza}"

perro = Perro("Rex", "Pastor Alemán")
print(perro.nombre)      # Heredado de Animal
print(perro.raza)        # Propio de Perro
print(perro.hablar())    # "Guau!" - sobrescrito
print(perro.describir()) # "Soy Rex, un Pastor Alemán"
```

---

## 13. Polimorfismo

### Definición

El **polimorfismo** (del griego "muchas formas") es la capacidad de objetos de diferentes clases de responder al mismo mensaje (llamada a método) de maneras distintas. Permite escribir código que funciona con objetos de diferentes tipos sin conocer su tipo específico.

### ¿Por qué existe el polimorfismo?

El polimorfismo existe para:
1. **Flexibilidad**: Escribir código genérico que funcione con múltiples tipos.
2. **Extensibilidad**: Añadir nuevos tipos sin modificar el código existente.
3. **Simplicidad**: Tratar objetos diferentes de manera uniforme.

### Tipos de polimorfismo

1. **Polimorfismo de subtipo**: Objetos de clases derivadas pueden usarse donde se espera la clase base.
2. **Duck typing**: Si un objeto tiene el método requerido, puede usarse, sin importar su clase.

### Duck Typing en Python

Python usa "duck typing": "Si camina como pato y hace cuac como pato, entonces es un pato". No importa el tipo del objeto, sino qué métodos tiene. Esto hace a Python muy flexible.

### ¿Por qué Python usa duck typing?

Porque Python es un lenguaje dinámico. Los tipos se verifican en tiempo de ejecución, no de compilación. Esto permite mayor flexibilidad a costa de detectar errores de tipo más tarde.

```python
class Pato:
    def hacer_sonido(self):
        return "Cuac!"

class Perro:
    def hacer_sonido(self):
        return "Guau!"

class Gato:
    def hacer_sonido(self):
        return "Miau!"

# Función polimórfica: funciona con cualquier objeto que tenga hacer_sonido()
def concierto_de_animales(animales):
    for animal in animales:
        print(animal.hacer_sonido())

# Duck typing: no importa la clase, solo que tengan el método
animales = [Pato(), Perro(), Gato()]
concierto_de_animales(animales)
# Salida:
# Cuac!
# Guau!
# Miau!

# Incluso funciona con clases no relacionadas
class Trompeta:
    def hacer_sonido(self):
        return "Tu-tu-tuuu!"

animales.append(Trompeta())  # No es animal pero tiene hacer_sonido()
concierto_de_animales(animales)
```

---

## 14. Abstracción

### Definición

La **abstracción** es el proceso de ocultar los detalles de implementación complejos y exponer solo las características esenciales de un objeto. Es mostrar "qué hace" algo sin revelar "cómo lo hace".

### ¿Por qué existe la abstracción?

La abstracción existe para:
1. **Reducir complejidad**: El usuario no necesita entender los detalles internos.
2. **Definir interfaces claras**: Establecer un contrato de qué operaciones están disponibles.
3. **Facilitar el mantenimiento**: Los detalles internos pueden cambiar sin afectar a los usuarios.

### Diferencia entre abstracción y encapsulamiento

- **Encapsulamiento**: Oculta los datos (atributos privados).
- **Abstracción**: Oculta la complejidad de la implementación.

El encapsulamiento es el mecanismo; la abstracción es el concepto. El encapsulamiento ayuda a lograr la abstracción.

### Niveles de abstracción

Puedes tener múltiples niveles de abstracción. Un nivel alto muestra operaciones simples ("enviar email"), mientras niveles más bajos manejan detalles ("conectar al servidor SMTP, autenticar, enviar bytes...").

```python
class ReproductorMusica:
    def __init__(self):
        self._volumen = 50
        self._cancion_actual = None
        self._posicion = 0
    
    # Interfaz abstracta: simple y clara
    def reproducir(self, cancion):
        self._cancion_actual = cancion
        self._iniciar_reproduccion()
    
    def pausar(self):
        self._detener_audio()
    
    def subir_volumen(self):
        self._ajustar_volumen(self._volumen + 10)
    
    # Detalles de implementación: ocultos
    def _iniciar_reproduccion(self):
        # Lógica compleja de decodificación de audio
        # Manejo de buffers
        # Comunicación con hardware de sonido
        print(f"Reproduciendo: {self._cancion_actual}")
    
    def _detener_audio(self):
        # Lógica compleja de pausa
        print("Pausado")
    
    def _ajustar_volumen(self, nuevo_volumen):
        # Validaciones y ajustes de hardware
        self._volumen = max(0, min(100, nuevo_volumen))

# El usuario solo ve la interfaz simple
reproductor = ReproductorMusica()
reproductor.reproducir("Canción.mp3")
reproductor.subir_volumen()
```

---

## 15. Composición

### Definición

La **composición** es una relación entre clases donde una clase contiene instancias de otras clases como parte de su estado. Es una relación "tiene un" donde las partes no pueden existir independientemente del todo.

### ¿Por qué existe la composición?

La composición existe como alternativa a la herencia para reutilizar código. Mientras la herencia modela "es un", la composición modela "tiene un". Muchas veces la composición es más flexible y apropiada que la herencia.

### Composición vs Herencia

- **Herencia**: "Un Perro ES UN Animal" - relación de tipo.
- **Composición**: "Un Auto TIENE UN Motor" - relación de contenido.

La regla general es: "Favorece la composición sobre la herencia" porque la composición es más flexible y produce menos acoplamiento.

### ¿Por qué las partes no pueden existir sin el todo?

En composición pura, si el objeto contenedor se destruye, las partes también. Por ejemplo, si destruyes un Auto, su Motor específico también deja de existir como parte de ese auto.

```python
class Motor:
    def __init__(self, cilindrada):
        self.cilindrada = cilindrada
        self.encendido = False
    
    def arrancar(self):
        self.encendido = True
        return f"Motor de {self.cilindrada}cc arrancado"
    
    def apagar(self):
        self.encendido = False

class Rueda:
    def __init__(self, tamaño):
        self.tamaño = tamaño
        self.presion = 32

class Auto:
    def __init__(self, marca, cilindrada):
        self.marca = marca
        # Composición: Auto TIENE UN Motor y Ruedas
        self.motor = Motor(cilindrada)  # Creado dentro del Auto
        self.ruedas = [Rueda(17) for _ in range(4)]
    
    def arrancar(self):
        return self.motor.arrancar()
    
    def info_ruedas(self):
        return f"4 ruedas de {self.ruedas[0].tamaño} pulgadas"

auto = Auto("Toyota", 2000)
print(auto.arrancar())
print(auto.info_ruedas())
```

---

## 16. Agregación

### Definición

La **agregación** es una forma especial de composición donde la clase contenedora tiene referencias a objetos de otras clases, pero estos objetos pueden existir independientemente. Es una relación "tiene un" más débil.

### ¿Por qué distinguir agregación de composición?

La distinción importa para el diseño:
- **Composición**: Ciclo de vida compartido. Si el contenedor muere, las partes mueren.
- **Agregación**: Ciclos de vida independientes. Las partes pueden sobrevivir al contenedor.

### Ejemplo conceptual

- **Composición**: Un cuerpo humano y su corazón. Si el cuerpo muere, el corazón también.
- **Agregación**: Una universidad y sus profesores. Si la universidad cierra, los profesores siguen existiendo.

```python
class Profesor:
    def __init__(self, nombre, especialidad):
        self.nombre = nombre
        self.especialidad = especialidad

class Departamento:
    def __init__(self, nombre):
        self.nombre = nombre
        self.profesores = []  # Agregación: profesores existen independientemente
    
    def agregar_profesor(self, profesor):
        self.profesores.append(profesor)
    
    def listar_profesores(self):
        return [p.nombre for p in self.profesores]

# Los profesores existen antes del departamento
prof1 = Profesor("Dr. García", "Matemáticas")
prof2 = Profesor("Dra. López", "Física")

# El departamento los agrega, no los crea
depto = Departamento("Ciencias")
depto.agregar_profesor(prof1)
depto.agregar_profesor(prof2)

# Si eliminamos el departamento, los profesores siguen existiendo
del depto
print(prof1.nombre)  # "Dr. García" - sigue existiendo
```

---

## 17. Método de Clase

### Definición

Un **método de clase** es un método que está vinculado a la clase y no a una instancia particular. Recibe la clase como primer argumento (por convención llamado `cls`) en lugar de una instancia (`self`).

### ¿Por qué existen los métodos de clase?

Los métodos de clase existen para:
1. **Constructores alternativos**: Crear instancias de formas diferentes.
2. **Operaciones sobre la clase**: Acceder o modificar atributos de clase.
3. **Factory methods**: Métodos que crean y retornan instancias.

### ¿Por qué usar `@classmethod`?

El decorador `@classmethod` transforma un método normal en un método de clase. Le indica a Python que debe pasar la clase, no la instancia, como primer argumento.

### Diferencia con método de instancia

- **Método de instancia**: Opera sobre un objeto específico (`self`).
- **Método de clase**: Opera sobre la clase misma (`cls`).

```python
class Fecha:
    def __init__(self, dia, mes, año):
        self.dia = dia
        self.mes = mes
        self.año = año
    
    # Constructor alternativo desde string
    @classmethod
    def desde_string(cls, fecha_string):
        dia, mes, año = map(int, fecha_string.split('-'))
        return cls(dia, mes, año)  # cls es la clase Fecha
    
    # Constructor alternativo para hoy
    @classmethod
    def hoy(cls):
        from datetime import date
        hoy = date.today()
        return cls(hoy.day, hoy.month, hoy.year)
    
    def __str__(self):
        return f"{self.dia}/{self.mes}/{self.año}"

# Diferentes formas de crear una Fecha
fecha1 = Fecha(15, 6, 2023)           # Constructor normal
fecha2 = Fecha.desde_string("20-12-2023")  # Método de clase
fecha3 = Fecha.hoy()                   # Método de clase

print(fecha1)  # 15/6/2023
print(fecha2)  # 20/12/2023
```

---

## 18. Método Estático

### Definición

Un **método estático** es un método que pertenece a una clase pero no tiene acceso ni a la instancia (`self`) ni a la clase (`cls`). Es esencialmente una función normal que está dentro del namespace de la clase.

### ¿Por qué existen los métodos estáticos?

Los métodos estáticos existen para agrupar funciones relacionadas conceptualmente con una clase, aunque no necesiten acceder a datos de la clase o instancia. Proporcionan organización lógica del código.

### ¿Cuándo usar método estático vs función normal?

Usa método estático cuando la función:
1. Está conceptualmente relacionada con la clase.
2. No necesita acceder a `self` ni `cls`.
3. Tiene sentido llamarla a través de la clase.

Si no tiene relación con ninguna clase, usa una función normal.

### Diferencia entre los tres tipos de métodos

- **Instancia**: Accede a `self`, opera sobre objetos.
- **Clase**: Accede a `cls`, opera sobre la clase.
- **Estático**: No accede a nada, es una función agrupada en la clase.

```python
class Calculadora:
    # Método de instancia: usa self
    def __init__(self, valor_inicial):
        self.valor = valor_inicial
    
    def sumar_a_valor(self, n):
        self.valor += n
        return self.valor
    
    # Método de clase: usa cls
    @classmethod
    def crear_con_valor_cero(cls):
        return cls(0)
    
    # Método estático: no usa ni self ni cls
    @staticmethod
    def sumar(a, b):
        return a + b
    
    @staticmethod
    def es_par(numero):
        return numero % 2 == 0

# Uso de método estático: no necesita instancia
print(Calculadora.sumar(5, 3))     # 8
print(Calculadora.es_par(4))       # True

# También se puede llamar desde una instancia
calc = Calculadora(10)
print(calc.sumar(2, 2))  # 4
```

---

## 19. Propiedades

### Definición

Las **propiedades** son un mecanismo que permite definir métodos que se acceden como si fueran atributos. Permiten controlar cómo se obtienen, establecen y eliminan valores, manteniendo una sintaxis limpia.

### ¿Por qué existen las propiedades?

Las propiedades existen para:
1. **Encapsulamiento con sintaxis limpia**: Acceder a datos controlados sin usar `get_` y `set_`.
2. **Validación**: Verificar valores antes de asignarlos.
3. **Computación bajo demanda**: Calcular valores al momento de accederlos.
4. **Compatibilidad**: Convertir atributos públicos en controlados sin cambiar la interfaz.

### Decoradores de propiedades

- **`@property`**: Define el getter (obtener valor).
- **`@nombre.setter`**: Define el setter (establecer valor).
- **`@nombre.deleter`**: Define el deleter (eliminar valor).

### ¿Por qué usar propiedades en lugar de métodos get/set?

En Python, se prefieren propiedades porque mantienen la sintaxis de acceso a atributos (`objeto.atributo`) mientras permiten control interno. Es más "pythónico" que `objeto.get_atributo()`.

```python
class Temperatura:
    def __init__(self, celsius):
        self._celsius = celsius
    
    @property
    def celsius(self):
        """Getter: obtiene el valor en Celsius"""
        return self._celsius
    
    @celsius.setter
    def celsius(self, valor):
        """Setter: establece el valor con validación"""
        if valor < -273.15:
            raise ValueError("Temperatura bajo cero absoluto")
        self._celsius = valor
    
    @property
    def fahrenheit(self):
        """Propiedad calculada: convierte a Fahrenheit"""
        return self._celsius * 9/5 + 32
    
    @fahrenheit.setter
    def fahrenheit(self, valor):
        """Permite establecer en Fahrenheit"""
        self._celsius = (valor - 32) * 5/9

temp = Temperatura(25)
print(temp.celsius)     # 25 - usa getter
print(temp.fahrenheit)  # 77.0 - propiedad calculada

temp.celsius = 30       # usa setter con validación
temp.fahrenheit = 68    # convierte automáticamente

# temp.celsius = -300   # ValueError: bajo cero absoluto
```

---

## 20. Clases Abstractas

### Definición

Una **clase abstracta** es una clase que no puede ser instanciada directamente y que puede contener métodos abstractos (métodos declarados pero no implementados). Sirve como plantilla que las clases derivadas deben completar.

### ¿Por qué existen las clases abstractas?

Las clases abstractas existen para:
1. **Definir contratos**: Especificar qué métodos deben implementar las subclases.
2. **Evitar instanciación de clases incompletas**: Prevenir la creación de objetos de clases que no tienen sentido por sí solas.
3. **Proporcionar implementación parcial**: Definir comportamiento común mientras se obliga a definir comportamiento específico.

### El módulo ABC

Python proporciona el módulo `abc` (Abstract Base Classes) para crear clases abstractas. Sin este módulo, Python no tiene soporte nativo para clases abstractas.

### Métodos abstractos

Un **método abstracto** es un método que se declara en la clase abstracta pero no se implementa. Las subclases están obligadas a implementarlo.

```python
from abc import ABC, abstractmethod

class Figura(ABC):
    def __init__(self, nombre):
        self.nombre = nombre
    
    @abstractmethod
    def area(self):
        """Las subclases DEBEN implementar este método"""
        pass
    
    @abstractmethod
    def perimetro(self):
        """Las subclases DEBEN implementar este método"""
        pass
    
    # Método concreto: implementación compartida
    def describir(self):
        return f"{self.nombre}: área={self.area()}, perímetro={self.perimetro()}"

class Rectangulo(Figura):
    def __init__(self, ancho, alto):
        super().__init__("Rectángulo")
        self.ancho = ancho
        self.alto = alto
    
    def area(self):  # Implementación obligatoria
        return self.ancho * self.alto
    
    def perimetro(self):  # Implementación obligatoria
        return 2 * (self.ancho + self.alto)

class Circulo(Figura):
    def __init__(self, radio):
        super().__init__("Círculo")
        self.radio = radio
    
    def area(self):
        import math
        return math.pi * self.radio ** 2
    
    def perimetro(self):
        import math
        return 2 * math.pi * self.radio

# figura = Figura("test")  # Error: no se puede instanciar clase abstracta
rect = Rectangulo(5, 3)
print(rect.describir())  # Rectángulo: área=15, perímetro=16
```

---

## 21. Interfaces

### Definición

Una **interfaz** es un contrato que especifica qué métodos debe tener una clase, sin proporcionar ninguna implementación. Define el "qué" sin el "cómo".

### ¿Por qué existen las interfaces?

Las interfaces existen para:
1. **Garantizar compatibilidad**: Asegurar que diferentes clases tengan los mismos métodos.
2. **Desacoplamiento**: El código depende de la interfaz, no de implementaciones concretas.
3. **Polimorfismo**: Tratar objetos de diferentes clases de manera uniforme.

### Interfaces en Python

Python no tiene una palabra clave `interface` como Java. En Python, las interfaces se implementan de dos formas:
1. **Duck typing**: Si tiene los métodos, funciona (implícito).
2. **Clases abstractas**: Usando ABC con solo métodos abstractos (explícito).

### Diferencia entre clase abstracta e interfaz

- **Interfaz**: Solo define métodos sin implementación.
- **Clase abstracta**: Puede tener métodos implementados además de abstractos.

En Python, esta distinción es menos rígida que en otros lenguajes.

```python
from abc import ABC, abstractmethod

# Interfaz: solo métodos abstractos, sin implementación
class Almacenable(ABC):
    @abstractmethod
    def guardar(self, datos):
        pass
    
    @abstractmethod
    def cargar(self):
        pass
    
    @abstractmethod
    def eliminar(self):
        pass

class AlmacenamientoArchivo(Almacenable):
    def __init__(self, archivo):
        self.archivo = archivo
    
    def guardar(self, datos):
        print(f"Guardando en archivo: {self.archivo}")
    
    def cargar(self):
        print(f"Cargando desde archivo: {self.archivo}")
    
    def eliminar(self):
        print(f"Eliminando archivo: {self.archivo}")

class AlmacenamientoBD(Almacenable):
    def __init__(self, conexion):
        self.conexion = conexion
    
    def guardar(self, datos):
        print(f"Insertando en base de datos")
    
    def cargar(self):
        print(f"Consultando base de datos")
    
    def eliminar(self):
        print(f"Eliminando de base de datos")

# Función que trabaja con la interfaz, no con implementaciones
def respaldar(almacenamiento: Almacenable):
    datos = almacenamiento.cargar()
    almacenamiento.guardar(datos)
```

---

## 22. Herencia Múltiple

### Definición

La **herencia múltiple** es la capacidad de una clase de heredar de más de una clase padre simultáneamente. La clase hija adquiere atributos y métodos de todas las clases padre.

### ¿Por qué existe la herencia múltiple?

La herencia múltiple existe para casos donde un objeto tiene características de múltiples categorías. Por ejemplo, un MurciélagoRobot podría heredar de Animal y de Máquina.

### El problema del diamante

Cuando una clase hereda de dos clases que a su vez heredan de una clase común, se forma una estructura de "diamante". Esto crea ambigüedad sobre qué versión de los métodos usar.

### ¿Por qué muchos lenguajes no permiten herencia múltiple?

Por la complejidad y ambigüedad que introduce. Java, por ejemplo, solo permite herencia simple de clases (pero múltiple de interfaces). Python la permite pero requiere entender MRO.

```python
class A:
    def metodo(self):
        return "A"

class B(A):
    def metodo(self):
        return "B"

class C(A):
    def metodo(self):
        return "C"

class D(B, C):  # Herencia múltiple
    pass

d = D()
print(d.metodo())  # "B" - ¿Por qué B y no C?

# Problema del diamante:
#       A
#      / \
#     B   C
#      \ /
#       D
# ¿Qué versión de 'metodo' usa D?
# Python lo resuelve con MRO (siguiente sección)
```

---

## 23. Method Resolution Order (MRO)

### Definición

El **Method Resolution Order (MRO)** es el orden en que Python busca métodos y atributos en la jerarquía de clases cuando hay herencia. Define exactamente dónde Python buscará cuando llames a un método.

### ¿Por qué existe el MRO?

El MRO existe para resolver la ambigüedad de la herencia múltiple de manera predecible y consistente. Sin un orden definido, Python no sabría qué método usar cuando múltiples clases padre tienen el mismo método.

### Algoritmo C3 Linearization

Python 3 usa el algoritmo C3 que garantiza:
1. Las subclases aparecen antes que sus clases padre.
2. Se preserva el orden en que las clases padre fueron listadas.
3. Es consistente y predecible.

### ¿Cómo ver el MRO?

Puedes ver el MRO de cualquier clase usando el atributo `__mro__` o el método `mro()`.

```python
class A:
    def metodo(self):
        return "A"

class B(A):
    def metodo(self):
        return "B"

class C(A):
    def metodo(self):
        return "C"

class D(B, C):
    pass

# Ver el MRO
print(D.__mro__)
# (<class 'D'>, <class 'B'>, <class 'C'>, <class 'A'>, <class 'object'>)

# Orden de búsqueda: D -> B -> C -> A -> object
d = D()
print(d.metodo())  # "B" porque B viene antes que C en el MRO

# Ejemplo con super() siguiendo el MRO
class X:
    def metodo(self):
        print("X")

class Y(X):
    def metodo(self):
        print("Y")
        super().metodo()  # Llama al siguiente en MRO

class Z(X):
    def metodo(self):
        print("Z")
        super().metodo()

class W(Y, Z):
    def metodo(self):
        print("W")
        super().metodo()

w = W()
w.metodo()
# W -> Y -> Z -> X (siguiendo el MRO)
```

---

## 24. Sobrecarga de Operadores

### Definición

La **sobrecarga de operadores** es la capacidad de redefinir el comportamiento de operadores como `+`, `-`, `*`, `==`, etc., para tipos personalizados. Permite que los operadores funcionen con objetos de clases definidas por el usuario.

### ¿Por qué existe la sobrecarga de operadores?

La sobrecarga existe para que las clases personalizadas se comporten de manera natural e intuitiva. Es más natural escribir `vector1 + vector2` que `vector1.sumar(vector2)`.

### Métodos especiales para operadores

Cada operador tiene un método especial asociado:
- `+` → `__add__`
- `-` → `__sub__`
- `*` → `__mul__`
- `==` → `__eq__`
- `<` → `__lt__`
- `[]` → `__getitem__`

### ¿Por qué usar doble guión bajo?

El doble guión bajo indica que son métodos "mágicos" o "dunder" (double underscore). Python los llama automáticamente en ciertas situaciones, no están diseñados para llamarse directamente.

```python
class Vector:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def __add__(self, otro):
        """Sobrecarga de +"""
        return Vector(self.x + otro.x, self.y + otro.y)
    
    def __sub__(self, otro):
        """Sobrecarga de -"""
        return Vector(self.x - otro.x, self.y - otro.y)
    
    def __mul__(self, escalar):
        """Sobrecarga de * (por escalar)"""
        return Vector(self.x * escalar, self.y * escalar)
    
    def __eq__(self, otro):
        """Sobrecarga de =="""
        return self.x == otro.x and self.y == otro.y
    
    def __str__(self):
        """Representación como string"""
        return f"Vector({self.x}, {self.y})"

v1 = Vector(3, 4)
v2 = Vector(1, 2)

v3 = v1 + v2      # Llama a __add__
print(v3)         # Vector(4, 6)

v4 = v1 * 2       # Llama a __mul__
print(v4)         # Vector(6, 8)

print(v1 == v2)   # False - llama a __eq__
```

---

## 25. Métodos Mágicos (Dunder Methods)

### Definición

Los **métodos mágicos** o **dunder methods** (double underscore) son métodos especiales en Python que tienen nombres rodeados por doble guión bajo. Python los llama automáticamente en situaciones específicas.

### ¿Por qué existen los métodos mágicos?

Los métodos mágicos existen para:
1. **Integración con el lenguaje**: Permiten que objetos personalizados funcionen con características del lenguaje (for, with, print, etc.).
2. **Comportamiento personalizado**: Definen cómo se comporta el objeto en diferentes contextos.
3. **Consistencia**: Proporcionan una interfaz estándar para operaciones comunes.

### Categorías principales de métodos mágicos

1. **Creación/Destrucción**: `__new__`, `__init__`, `__del__`
2. **Representación**: `__str__`, `__repr__`
3. **Comparación**: `__eq__`, `__lt__`, `__gt__`, `__le__`, `__ge__`
4. **Operadores**: `__add__`, `__sub__`, `__mul__`, `__truediv__`
5. **Contenedores**: `__len__`, `__getitem__`, `__setitem__`, `__iter__`
6. **Contexto**: `__enter__`, `__exit__`
7. **Llamada**: `__call__`

### ¿Por qué no llamarlos directamente?

Aunque puedes llamar `obj.__str__()`, la forma correcta es `str(obj)`. Python proporciona funciones y sintaxis que internamente llaman a estos métodos, haciendo el código más legible.

```python
class ListaPersonalizada:
    def __init__(self, elementos):
        self._datos = list(elementos)
    
    # Representación
    def __str__(self):
        return f"Lista: {self._datos}"
    
    def __repr__(self):
        return f"ListaPersonalizada({self._datos})"
    
    # Contenedor
    def __len__(self):
        return len(self._datos)
    
    def __getitem__(self, indice):
        return self._datos[indice]
    
    def __setitem__(self, indice, valor):
        self._datos[indice] = valor
    
    def __iter__(self):
        return iter(self._datos)
    
    def __contains__(self, elemento):
        return elemento in self._datos
    
    # Llamable
    def __call__(self, *args):
        print(f"Lista llamada con: {args}")

lista = ListaPersonalizada([1, 2, 3, 4, 5])

print(str(lista))        # Lista: [1, 2, 3, 4, 5]
print(len(lista))        # 5 - usa __len__
print(lista[2])          # 3 - usa __getitem__
lista[0] = 10            # usa __setitem__
print(3 in lista)        # True - usa __contains__

for elemento in lista:   # usa __iter__
    print(elemento)

lista("argumento")       # Lista llamada con: ('argumento',)
```

---

## Conclusión

La Programación Orientada a Objetos es un paradigma que modela el software como una colección de objetos que encapsulan datos y comportamiento. Cada concepto existe para resolver un problema específico de la ingeniería de software:

- **Clases y Objetos**: Organizar código en unidades cohesivas.
- **Encapsulamiento**: Proteger datos y ocultar complejidad.
- **Herencia**: Reutilizar código y establecer jerarquías.
- **Polimorfismo**: Escribir código flexible y extensible.
- **Abstracción**: Simplificar interfaces complejas.

Entender el "por qué" de cada concepto te permite tomar mejores decisiones de diseño y escribir código más mantenible.

---

> "Aprender a programar no es memorizar sintaxis, es entender por qué las cosas funcionan como funcionan."
