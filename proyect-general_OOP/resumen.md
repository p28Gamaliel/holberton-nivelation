# 📚 GUÍA COMPLETA DE CONCEPTOS DE POO

## 1. ABSTRACCIÓN

### ¿Qué es?
La abstracción es el proceso de **ocultar la complejidad** y mostrar solo lo esencial. Es como un control remoto: no necesitas saber cómo funciona internamente, solo qué botones presionar.

### ¿Dónde está en el código?

```97:109:inventario.py
class Auditable(ABC):
    """
    Interfaz (Contrato). 
    Contexto (ISP): No todos los productos pasan por control de calidad (ej. un cable).
    Solo los productos delicados (comida, medicinas) deben implementar esta interfaz.
    Esto evita obligar a productos simples a tener métodos que no necesitan.
    """
    
    @abstractmethod
    def realizar_auditoria(self):
        # TODO: Define este método como abstracto (usa pass). 
        # Esto obliga a quien herede de aquí a escribir el código de la auditoría.
        pass
```

### ¿Por qué funciona así?

La abstracción existe porque **el cerebro humano no puede manejar toda la complejidad al mismo tiempo**. Python implementa esto mediante:

1. **`ABC` (Abstract Base Class)**: Una clase que NO puede instanciarse directamente
2. **`@abstractmethod`**: Un método que OBLIGA a las clases hijas a implementarlo

**¿Por qué no puedes instanciar una clase abstracta?**
Porque sería como tener un "contrato sin firmar". La clase abstracta es un **contrato** que dice "quien herede de mí, DEBE implementar estos métodos". Si pudieras crear una instancia directa, tendrías un objeto con métodos vacíos = programa roto.

### Ejemplo práctico para evaluación:

```python
from abc import ABC, abstractmethod

# ESTO FALLA - No puedes crear instancia de clase abstracta
class Animal(ABC):
    @abstractmethod
    def hacer_sonido(self):
        pass

# a = Animal()  # ❌ TypeError: Can't instantiate abstract class

# ESTO FUNCIONA - La clase hija implementa el método
class Perro(Animal):
    def hacer_sonido(self):
        return "Guau!"

p = Perro()  # ✅ Funciona porque implementó hacer_sonido
```

---

## 2. ENCAPSULAMIENTO

### ¿Qué es?
Es el mecanismo de **proteger los datos internos** de un objeto, controlando cómo se accede y modifica.

### ¿Dónde está en el código?

```22:39:inventario.py
        # TAREA 1: Encapsulamiento
        # Contexto: Protegemos el stock para que nadie pueda poner valores locos (como -50) directamente.
        # TODO: Define el atributo protegido _stock (usa guión bajo) asignándole stock_inicial.
        self._stock = stock_inicial

    # TAREA 1: Getter y Setter
    @property
    def stock(self):
        return self._stock

    @stock.setter
    def stock(self, cantidad):
        # Contexto: Aquí validamos la regla de negocio antes de guardar el dato.
        # TODO: Si 'cantidad' es menor a 0, lanza un ValueError("Stock no puede ser negativo").
        # De lo contrario, actualiza self._stock.
        if cantidad < 0:
            raise ValueError("El Stock no debe ser negativo")
        self._stock = cantidad
```

### ¿Por qué funciona así?

En Python existen **convenciones de acceso**:

| Notación | Significado | Ejemplo |
|----------|-------------|---------|
| `nombre` | Público (acceso libre) | `self.nombre` |
| `_nombre` | Protegido (convención: "no toques esto directamente") | `self._stock` |
| `__nombre` | Privado (Python hace name mangling) | `self.__secreto` |

**¿Por qué usar `@property` en lugar de acceso directo?**

1. **Validación**: Puedes verificar reglas antes de asignar valores
2. **Consistencia**: El código externo usa `producto.stock`, sin saber que internamente es `_stock`
3. **Flexibilidad futura**: Puedes cambiar la implementación interna sin afectar el código que usa tu clase

### El "truco" de @property:

```python
# SIN property (acceso directo - PELIGROSO)
producto._stock = -50  # ¡Nadie valida! Bug introducido

# CON property (acceso controlado - SEGURO)
producto.stock = -50  # Pasa por el setter → ValueError
```

**¿Por qué Python no tiene verdaderos atributos privados como Java?**
Porque sigue la filosofía "somos todos adultos responsables". El `_` es una **señal social** que dice "no deberías tocar esto", pero no te lo impide físicamente. Esto permite flexibilidad para testing y debugging.

---

## 3. HERENCIA

### ¿Qué es?
Es el mecanismo donde una clase **hija adquiere características** (atributos y métodos) de una clase **padre**.

### ¿Dónde está en el código?

```74:91:inventario.py
class ProductoConGarantia(Producto):
    """
    Clase Hija. Es un Producto normal, pero con una propiedad extra: garantía.
    Hereda todo lo de 'Producto' (nombre, precio, stock) automáticamente.
    """
    def __init__(self, nombre, precio, stock_inicial, anios_garantia):
        # TAREA 2: Herencia y super()
        # Contexto: No repitas código. Deja que la clase Padre inicialice lo común.
        # TODO: Usa super().__init__(...) para pasar nombre, precio y stock.
        # TODO: Luego, inicializa tu atributo nuevo: self.anios_garantia.
        super().__init__(nombre, precio, stock_inicial)
        self.anios_garantia = anios_garantia

    def __str__(self):
        # TAREA 3: Polimorfismo (Especialización)
        # Contexto: Queremos aprovechar el string del padre y agregarle el dato de la garantía.
        # TODO: Llama a super().__str__() para obtener el texto base y concatenale: " | Garantia: [anios] anios".
        return super().__str__() + f" | Garantia: {self.anios_garantia} anios"
```

### ¿Por qué funciona así?

**El problema que resuelve**: Sin herencia, tendrías que **copiar y pegar** código idéntico en cada clase similar. Esto viola el principio **DRY (Don't Repeat Yourself)**.

**¿Qué hace `super().__init__()`?**

`super()` devuelve un **objeto proxy** que te permite llamar métodos de la clase padre. Es como decir: "Padre, haz tu trabajo primero, yo solo añadiré lo mío".

```python
# Sin super() - CÓDIGO DUPLICADO (MAL)
class ProductoConGarantia:
    def __init__(self, nombre, precio, stock_inicial, anios_garantia):
        self.nombre = nombre           # Repetido
        self.precio = precio           # Repetido
        self._stock = stock_inicial    # Repetido
        self.anios_garantia = anios_garantia

# Con super() - REUTILIZACIÓN (BIEN)
class ProductoConGarantia(Producto):
    def __init__(self, nombre, precio, stock_inicial, anios_garantia):
        super().__init__(nombre, precio, stock_inicial)  # Padre hace esto
        self.anios_garantia = anios_garantia             # Solo lo nuevo
```

### Herencia Múltiple:

```112:121:inventario.py
class ProductoPerecedero(Producto, Auditable):
    """
    Un producto que hereda de dos clases: 
    1. Es un Producto (tiene precio, stock).
    2. Es Auditable (debe pasar control de calidad por fecha de caducidad).
    """
    def __init__(self, nombre, precio, stock_inicial, fecha_caducidad):
        # Inicializamos solo el Padre Producto, Auditable es solo una interfaz/mix-in
        super().__init__(nombre, precio, stock_inicial)
        self.fecha_caducidad = fecha_caducidad
```

**¿Por qué Python permite herencia múltiple?**
Porque usa el **MRO (Method Resolution Order)** - un algoritmo que determina en qué orden buscar métodos. Puedes verlo con `ProductoPerecedero.__mro__`.

---

## 4. POLIMORFISMO

### ¿Qué es?
Es la capacidad de objetos de **diferentes clases** de responder al **mismo mensaje** (método) de forma diferente.

### ¿Dónde está en el código?

```60:64:inventario.py
    def __str__(self):
        # TAREA 3: Polimorfismo (Identidad del objeto)
        # Contexto: Cuando hagamos print(producto), queremos ver info útil, no la dirección de memoria.
        # TODO: Retorna un f-string: "Producto: [nombre] | Precio: $[precio] | Stock: [stock]"
         return f"Producto: {self.nombre} | Precio: ${self.precio} | Stock: {self.stock}"
```

Y su versión **polimórfica** en la clase hija:

```87:91:inventario.py
    def __str__(self):
        # TAREA 3: Polimorfismo (Especialización)
        # Contexto: Queremos aprovechar el string del padre y agregarle el dato de la garantía.
        # TODO: Llama a super().__str__() para obtener el texto base y concatenale: " | Garantia: [anios] anios".
        return super().__str__() + f" | Garantia: {self.anios_garantia} anios"
```

### ¿Por qué funciona así?

**El verdadero poder del polimorfismo**:

```python
productos = [
    Producto("Mouse", 20, 10),
    ProductoConGarantia("Laptop", 1000, 5, 2),
    ProductoPerecedero("Leche", 2, 20, "2024-12-31")
]

# ¡El mismo código funciona para TODOS!
for p in productos:
    print(p)  # Python llama al __str__ correcto de cada uno
```

**¿Por qué esto es poderoso?**

1. **No necesitas conocer el tipo exacto** del objeto
2. **El código es extensible**: puedes añadir nuevos tipos de productos sin modificar el bucle
3. **Late binding**: Python decide EN TIEMPO DE EJECUCIÓN qué método llamar

**¿Cómo sabe Python qué `__str__` usar?**

Python usa un mecanismo llamado **dynamic dispatch** (despacho dinámico):
1. Mira la clase del objeto REAL (no la variable)
2. Busca el método en esa clase
3. Si no lo encuentra, sube por la cadena de herencia (MRO)

### Ejemplo para evaluación:

```python
class Vehiculo:
    def mover(self):
        return "El vehículo se mueve"

class Carro(Vehiculo):
    def mover(self):
        return "El carro rueda por la carretera"

class Avion(Vehiculo):
    def mover(self):
        return "El avión vuela por el cielo"

# Polimorfismo en acción
vehiculos = [Carro(), Avion()]
for v in vehiculos:
    print(v.mover())  # Cada uno responde diferente al mismo mensaje
```

---

## 5. DUNDER METHODS (Métodos Mágicos)

### ¿Qué son?
Métodos especiales con doble guión bajo que Python llama **automáticamente** en ciertas situaciones.

### ¿Dónde están en el código?

| Método | Cuándo se llama | Línea |
|--------|-----------------|-------|
| `__init__` | Al crear objeto con `Clase()` | 18 |
| `__str__` | Al hacer `print(objeto)` o `str(objeto)` | 60 |

### ¿Por qué funcionan así?

Son parte del **protocolo de objetos de Python**. Cuando escribes:

```python
print(producto)
```

Python internamente hace:

```python
print(producto.__str__())
```

**¿Por qué existen?**
Permiten que tus objetos se **comporten como objetos nativos** de Python. Puedes definir:
- `__add__`: para que `objeto1 + objeto2` funcione
- `__len__`: para que `len(objeto)` funcione
- `__eq__`: para que `objeto1 == objeto2` funcione

---

## 6. DECORADORES

### ¿Qué son?
Funciones que **modifican el comportamiento** de otras funciones o métodos.

### ¿Dónde están en el código?

```28:31:inventario.py
    # TAREA 1: Getter y Setter
    @property
    def stock(self):
        return self._stock
```

```67:71:inventario.py
    # TAREA 4: Método de Clase
    @classmethod
    def obtener_reporte_ventas(cls):
        # Contexto: Un método para preguntar a la CLASE (no al objeto) cuánto se vendió en total.
        # TODO: Retorna el valor de total_ventas_acumuladas.
        return cls.total_ventas_acumuladas
```

```145:146:inventario.py
    @staticmethod
    def crear_producto(tipo, **kwargs):
```

### Diferencias clave:

| Decorador | Recibe | Uso | Ejemplo |
|-----------|--------|-----|---------|
| `@property` | `self` | Convertir método en atributo | `producto.stock` (sin paréntesis) |
| `@classmethod` | `cls` (la clase) | Acceder a variables de clase | `Producto.obtener_reporte_ventas()` |
| `@staticmethod` | Nada | Función utilitaria dentro de clase | `InventarioFactory.crear_producto()` |

### ¿Por qué usar cada uno?

**@property**: Cuando quieres **validar o calcular** al acceder a un dato
```python
# Parece un atributo, pero ejecuta código
print(producto.stock)  # Llama a la función internamente
```

**@classmethod**: Cuando necesitas acceder a **datos compartidos** por todas las instancias
```python
# No necesitas crear un objeto para llamarlo
Producto.obtener_reporte_ventas()
```

**@staticmethod**: Cuando la función está **relacionada con la clase** pero no necesita `self` ni `cls`
```python
# Es básicamente una función normal "organizada" dentro de la clase
InventarioFactory.crear_producto("simple", nombre="A", precio=10)
```

---

## 7. VARIABLES DE CLASE vs VARIABLES DE INSTANCIA

### ¿Dónde está en el código?

```13:16:inventario.py
    # TAREA 4: Variables de Clase (Datos Compartidos)
    # Contexto: Queremos saber cuánto ha vendido la tienda en TOTAL, no solo este producto.
    # TODO: Define una variable estática 'total_ventas_acumuladas' iniciada en 0.
    total_ventas_acomuladas = 0
```

### ¿Por qué funcionan diferente?

```python
class Producto:
    total_ventas = 0  # VARIABLE DE CLASE - Una sola copia para TODAS las instancias
    
    def __init__(self, nombre):
        self.nombre = nombre  # VARIABLE DE INSTANCIA - Cada objeto tiene la suya
```

**Visualización**:
```
                    Clase Producto
                    ┌─────────────────┐
                    │ total_ventas = 0│ ← Una sola copia
                    └────────┬────────┘
           ┌─────────────────┼─────────────────┐
           ▼                 ▼                 ▼
    ┌──────────┐      ┌──────────┐      ┌──────────┐
    │ Mouse    │      │ Laptop   │      │ Leche    │
    │ nombre   │      │ nombre   │      │ nombre   │
    └──────────┘      └──────────┘      └──────────┘
    Cada uno tiene su propio "nombre"
```

---

## 8. PRINCIPIOS SOLID

### ISP (Interface Segregation Principle)

**¿Dónde está?**

```97:109:inventario.py
class Auditable(ABC):
    """
    Interfaz (Contrato). 
    Contexto (ISP): No todos los productos pasan por control de calidad (ej. un cable).
    Solo los productos delicados (comida, medicinas) deben implementar esta interfaz.
    Esto evita obligar a productos simples a tener métodos que no necesitan.
    """
```

**¿Qué dice ISP?**
"Ninguna clase debe ser forzada a implementar métodos que no usa"

**¿Por qué?**
Un `Producto` simple como un cable NO necesita `realizar_auditoria()`. Si obligáramos a TODOS los productos a tenerlo, tendríamos métodos vacíos o con `pass` por todo el código = código muerto.

### LSP (Liskov Substitution Principle)

**¿Dónde está?**

```123:126:inventario.py
    # TAREA 5: Liskov Substitution (LSP)
    # Nota Teórica: Aunque este producto caduca, debe poder usarse en cualquier lugar
    # donde se use un 'Producto' normal sin romper el programa. 
    # Por eso hereda de Producto y mantiene sus comportamientos base.
```

**¿Qué dice LSP?**
"Los objetos de una clase hija deben poder sustituir a objetos de la clase padre sin romper el programa"

**Ejemplo violando LSP (MAL)**:
```python
class Cuadrado(Rectangulo):
    def set_ancho(self, valor):
        self._ancho = valor
        self._alto = valor  # ¡Rompe el contrato! Un rectángulo no hace esto
```

---

## 9. PATRÓN FACTORY METHOD

### ¿Dónde está?

```139:170:inventario.py
class InventarioFactory:
    """
    Fábrica de Objetos.
    Contexto: Centraliza la creación. En lugar de tener 'ifs' por todo el código
    para saber qué clase instanciar, se lo pedimos a esta fábrica.
    """
    @staticmethod
    def crear_producto(tipo, **kwargs):
        """
        TAREA 7: Factory Method
        :param tipo: 'simple', 'garantia' o 'perecedero'
        :param kwargs: Diccionario con los argumentos variables (nombre, precio, etc.)
        """
        # TODO: Implementa la lógica de creación.
        # Pista: kwargs es un diccionario. Puedes pasarlo desempaquetado a los constructores.
        # Ejemplo: Producto(**kwargs) es igual a Producto(nombre="A", precio=10...)
        
        # Logica requerida:
        # Si tipo == 'simple'      -> Retorna instancia de Producto
        # Si tipo == 'garantia'    -> Retorna instancia de ProductoConGarantia
        # Si tipo == 'perecedero'  -> Retorna instancia de ProductoPerecedero
        if tipo == "simple":
            return Producto(**kwargs)

        elif tipo == "garantia":
            return ProductoConGarantia(**kwargs)

        elif tipo == "perecedero":
            return ProductoPerecedero(**kwargs)

        else:
            raise ValueError("Este tipo de producto es desconocido")
```

### ¿Por qué usar una Factory?

**Sin Factory (código esparcido)**:
```python
# En archivo ventas.py
if tipo == "simple":
    p = Producto(...)
elif tipo == "garantia":
    p = ProductoConGarantia(...)

# En archivo reportes.py (código DUPLICADO)
if tipo == "simple":
    p = Producto(...)
elif tipo == "garantia":
    p = ProductoConGarantia(...)
```

**Con Factory (centralizado)**:
```python
# En cualquier archivo
p = InventarioFactory.crear_producto("garantia", nombre="TV", precio=300)
```

**Beneficios**:
1. **Un solo lugar** para cambiar la lógica de creación
2. **Desacoplamiento**: el código que usa productos no necesita conocer todas las clases
3. **Fácil extensión**: añadir nuevo tipo = modificar solo la fábrica

---

## 10. **KWARGS (Keyword Arguments)

### ¿Dónde está?

```154:161:inventario.py
        # Pista: kwargs es un diccionario. Puedes pasarlo desempaquetado a los constructores.
        # Ejemplo: Producto(**kwargs) es igual a Producto(nombre="A", precio=10...)
        
        # Logica requerida:
        # Si tipo == 'simple'      -> Retorna instancia de Producto
        # Si tipo == 'garantia'    -> Retorna instancia de ProductoConGarantia
        # Si tipo == 'perecedero'  -> Retorna instancia de ProductoPerecedero
        if tipo == "simple":
            return Producto(**kwargs)
```

### ¿Por qué funciona así?

`**kwargs` es un **diccionario** de argumentos nombrados. El `**` lo **desempaqueta**:

```python
datos = {"nombre": "Laptop", "precio": 1000, "stock_inicial": 5}

# Esto:
Producto(**datos)

# Es equivalente a:
Producto(nombre="Laptop", precio=1000, stock_inicial=5)
```

---

## 📋 RESUMEN DE ESTUDIO

| Concepto | Una línea | Clave para recordar |
|----------|-----------|---------------------|
| **Abstracción** | Ocultar complejidad, mostrar lo esencial | `ABC` + `@abstractmethod` |
| **Encapsulamiento** | Proteger datos con getters/setters | `_atributo` + `@property` |
| **Herencia** | Reutilizar código del padre | `class Hija(Padre)` + `super()` |
| **Polimorfismo** | Mismo método, diferente comportamiento | Sobrescribir métodos en hijas |
| **@classmethod** | Método que accede a la clase | Recibe `cls`, no `self` |
| **@staticmethod** | Función utilitaria en clase | No recibe nada automático |
| **Factory** | Centralizar creación de objetos | Un método decide qué clase instanciar |
| **ISP** | No forzar métodos innecesarios | Interfaces pequeñas y específicas |
| **LSP** | Hijos sustituyen padres sin romper | Mantener contratos del padre |