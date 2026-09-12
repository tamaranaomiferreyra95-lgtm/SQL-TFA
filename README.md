# TamaraFerreyra data analytics
Pre entrega 6

Ciudad / Email sin datos
En la tabla de clientes se detectaron registros con valores nulos en los campos ciudad y email.
El valor nulo de ciudad se reemplazó por “Sin dato” para conservar el registro del cliente, ya que la ausencia de esta información no impide identificarlo ni realizar el análisis de sus compras.
En el caso del email, el valor nulo se conserva como dato faltante, ya que no existe información confiable que permita completar este campo sin introducir datos arbitrarios.
Se decidió mantener el registro del cliente en lugar de eliminarlo, ya que eliminarlo podría generar ventas sin un cliente asociado al relacionar la tabla de clientes con la tabla de ventas. De esta manera, el cliente permanece disponible para el análisis de sus compras, aunque no se cuente con información de contacto o ubicación geográfica.

Categoría nula
El producto con categoría nula se asigna al valor “Sin Categoría” porque no existe información confiable en el dataset que permita determinar a qué categoría existente pertenece.
Se evita asignarlo arbitrariamente a una categoría, ya que esto podría generar una clasificación incorrecta y afectar el análisis por categoría. Mantener el producto identificado como “Sin Categoría” permite conservar el registro y realizar el análisis sin perder información ni introducir datos no respaldados por la fuente de origen.

Precio nulo
El precio nulo del producto 109 se conserva como dato faltante porque el precio es un campo monetario crítico para el análisis de ingresos y no existe información confiable en el dataset para imputar un valor.
Se evita asignar un precio arbitrario y también eliminar el producto, ya que este posee transacciones registradas en la tabla de ventas. El dato deberá ser validado posteriormente con la fuente de origen.
