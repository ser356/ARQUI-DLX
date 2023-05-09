import numpy as np
import matplotlib.pyplot as plt

# Datos de ejemplo
y = [67, 127, 143, 159, 170]
x = [10, 15, 20, 25, 30]

# Ajustar una línea de tendencia de primer grado
coefficients = np.polyfit(x, y, 1)
p = np.poly1d(coefficients)

# Crear la gráfica de barras
plt.bar(x, y, align = 'center', width = 2 )

# Trazar la línea de tendencia
plt.plot(x, p(x), 'r--')

# Añadir etiquetas a los ejes
plt.ylabel('Numero ciclos de reloj')
plt.xlabel('Tamaño sucesion')

# Mostrar la gráfica
plt.show()
