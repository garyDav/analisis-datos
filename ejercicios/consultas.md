# Consultas Prácticas e Interesantes - Base de Datos Pasajes

## Introducción

Este documento contiene más de 100 consultas SQL prácticas e interesantes para la base de datos de pasajes. Cada consulta incluye un caso de uso real y está organizada por nivel de complejidad.

```sql
USE pasajes;
```

---

## 1. Consultas Simples por Tabla

### 1.1 Listar todos los usuarios

**Caso de uso:** Administrador quiere ver todos los usuarios registrados

```sql
SELECT id, nombre, apellido, correo, tipo, fecha FROM user;
```

### 1.2 Listar solo choferes

**Caso de uso:** Gestión de personal de choferes

```sql
SELECT u.id, u.nombre, u.apellido, c.ci, c.categoria, c.celular 
FROM user u
INNER JOIN chofer c ON u.id = c.id_user
WHERE u.tipo = 'chofer';
```

### 1.3 Listar solo administradores

**Caso de uso:** Ver equipo administrativo

```sql
SELECT id, nombre, apellido, correo FROM user WHERE tipo = 'administrador';
```

### 1.4 Listar pasajeros registrados

**Caso de uso:** Marketing, envío de promociones

```sql
SELECT id, nombre, apellido, correo FROM user WHERE tipo = 'pasajero' ORDER BY fecha DESC;
```

### 1.5 Información de todos los choferes

**Caso de uso:** Departamento de recursos humanos necesita datos de choferes

```sql
SELECT u.nombre, u.apellido, u.correo, c.ci, c.categoria, c.descripcion, c.celular, c.fecha_nac 
FROM chofer c
INNER JOIN user u ON c.id_user = u.id;
```

### 1.6 Información de todos los buses

**Caso de uso:** Mantenimiento quiere revisar todos los buses disponibles

```sql
SELECT id, placa, marca, num, color, capacidad, tipo FROM bus;
```

### 1.7 Listar todos los viajes programados

**Caso de uso:** Visión general de operaciones

```sql
SELECT id, horario, origen, destino, fecha FROM viaje;
```

---

## 2. Búsquedas con WHERE y Filtros

### 2.1 Buscar un usuario específico por correo

**Caso de uso:** Sistema de login, recuperar datos del usuario

```sql
SELECT * FROM user WHERE correo = 'juan.perez@example.com';
```

### 2.2 Choferes con categoría A (licencia profesional)

**Caso de uso:** Filtrar choferes para rutas de larga distancia

```sql
SELECT u.nombre, u.apellido, c.categoria, c.descripcion 
FROM chofer c
INNER JOIN user u ON c.id_user = u.id
WHERE c.categoria = 'A';
```

### 2.3 Buses con capacidad mayor a 45 pasajeros

**Caso de uso:** Planificación de viajes con alto volumen

```sql
SELECT placa, marca, capacidad, tipo FROM bus WHERE capacidad > 45;
```

### 2.4 Viajes que salen desde La Paz

**Caso de uso:** Mostrar opciones de salida desde una ciudad

```sql
SELECT id, horario, origen, destino, fecha FROM viaje WHERE origen = 'La Paz' ORDER BY horario;
```

### 2.5 Viajes con destino a Cochabamba

**Caso de uso:** Búsqueda de viajes disponibles a un destino

```sql
SELECT id, horario, origen, destino, fecha FROM viaje WHERE destino = 'Cochabamba';
```

### 2.6 Buses tipo "Ejecutivo"

**Caso de uso:** Ofrecer servicios premium

```sql
SELECT placa, marca, capacidad, tipo FROM bus WHERE tipo = 'Ejecutivo';
```

### 2.7 Usuarios registrados después del 4 de junio

**Caso de uso:** Nuevas registraciones

```sql
SELECT nombre, apellido, correo, tipo, fecha FROM user WHERE fecha > '2026-06-04' ORDER BY fecha DESC;
```

---

## 3. Aggregations (Funciones de Agregación)

### 3.1 Total de usuarios registrados

**Caso de uso:** KPI de crecimiento

```sql
SELECT COUNT(*) AS total_usuarios FROM user;
```

### 3.2 Total de usuarios por tipo

**Caso de uso:** Análisis de segmentación

```sql
SELECT tipo, COUNT(*) AS cantidad FROM user GROUP BY tipo;
```

### 3.3 Capacidad total de buses

**Caso de uso:** Planificación de capacidad operativa

```sql
SELECT SUM(capacidad) AS capacidad_total FROM bus;
```

### 3.4 Capacidad promedio de buses

**Caso de uso:** Comparar tamaño de flota

```sql
SELECT AVG(capacidad) AS capacidad_promedio FROM bus;
```

### 3.5 Bus con mayor capacidad

**Caso de uso:** Identificar el bus más grande

```sql
SELECT marca, placa, capacidad FROM bus ORDER BY capacidad DESC LIMIT 1;
```

### 3.6 Bus con menor capacidad

**Caso de uso:** Identificar el bus más pequeño

```sql
SELECT marca, placa, capacidad FROM bus ORDER BY capacidad ASC LIMIT 1;
```

### 3.7 Edad promedio de los choferes

**Caso de uso:** Análisis demográfico del personal

```sql
SELECT AVG(YEAR(CURDATE()) - YEAR(fecha_nac)) AS edad_promedio FROM chofer;
```

### 3.8 Total de viajes programados

**Caso de uso:** Volumen operativo diario

```sql
SELECT COUNT(*) AS total_viajes FROM viaje;
```

---

## 4. INNER JOIN - Consultas Combinadas

### 4.1 Viajes con datos completos del chofer

**Caso de uso:** Ver quién es el responsable de cada viaje

```sql
SELECT 
  v.id AS viaje_id,
  v.horario,
  v.origen,
  v.destino,
  c.nombre AS chofer_nombre,
  c.apellido AS chofer_apellido,
  c.categoria AS licencia,
  v.fecha
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
ORDER BY v.fecha, v.horario;
```

### 4.2 Viajes con datos completos del bus

**Caso de uso:** Información del vehículo para cada trayecto

```sql
SELECT 
  v.id AS viaje_id,
  v.horario,
  v.origen,
  v.destino,
  b.placa,
  b.marca,
  b.capacidad,
  b.tipo,
  v.fecha
FROM viaje v
INNER JOIN bus b ON v.id_bus = b.id
ORDER BY v.fecha;
```

### 4.3 Viajes con datos de chofer y bus completos (3 tablas)

**Caso de uso:** Información operativa completa de cada viaje

```sql
SELECT 
  v.id AS viaje_id,
  v.horario,
  v.origen,
  v.destino,
  c.nombre AS chofer_nombre,
  c.apellido AS chofer_apellido,
  c.categoria,
  b.placa,
  b.marca,
  b.capacidad,
  v.fecha
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
INNER JOIN bus b ON v.id_bus = b.id
ORDER BY v.fecha, v.horario;
```

### 4.4 Choferes con su información de usuario

**Caso de uso:** Obtener datos contacto del personal

```sql
SELECT 
  u.id,
  u.nombre,
  u.apellido,
  u.correo,
  c.ci,
  c.categoria,
  c.celular,
  c.fecha_nac
FROM user u
INNER JOIN chofer c ON u.id = c.id_user
WHERE u.tipo = 'chofer';
```

---

## 5. LEFT JOIN - Consultas con Datos Opcionales

### 5.1 Choferes con la cantidad de viajes realizados

**Caso de uso:** Ver productividad de choferes

```sql
SELECT 
  c.id,
  c.nombre,
  c.apellido,
  c.categoria,
  COUNT(v.id) AS cantidad_viajes
FROM chofer c
LEFT JOIN viaje v ON c.id = v.id_chofer
GROUP BY c.id, c.nombre, c.apellido, c.categoria
ORDER BY cantidad_viajes DESC;
```

### 5.2 Buses con la cantidad de viajes asignados

**Caso de uso:** Uso de la flota

```sql
SELECT 
  b.id,
  b.placa,
  b.marca,
  b.tipo,
  COUNT(v.id) AS viajes_asignados
FROM bus b
LEFT JOIN viaje v ON b.id = v.id_bus
GROUP BY b.id, b.placa, b.marca, b.tipo
ORDER BY viajes_asignados DESC;
```

---

## 6. Agregación con GROUP BY y HAVING

### 6.1 Choferes con más de 8 viajes asignados

**Caso de uso:** Identificar choferes con alta carga de trabajo

```sql
SELECT 
  c.nombre,
  c.apellido,
  COUNT(v.id) AS total_viajes
FROM chofer c
INNER JOIN viaje v ON c.id = v.id_chofer
GROUP BY c.id, c.nombre, c.apellido
HAVING COUNT(v.id) > 8
ORDER BY total_viajes DESC;
```

### 6.2 Rutas más solicitadas (origen-destino)

**Caso de uso:** Planificación de demanda

```sql
SELECT 
  origen,
  destino,
  COUNT(*) AS viajes
FROM viaje
GROUP BY origen, destino
ORDER BY viajes DESC;
```

### 6.3 Ciudades de origen con más viajes

**Caso de uso:** Análisis de demanda por punto de salida

```sql
SELECT 
  origen,
  COUNT(*) AS total_viajes
FROM viaje
GROUP BY origen
ORDER BY total_viajes DESC;
```

### 6.4 Ciudades de destino más populares

**Caso de uso:** Análisis de destinos preferidos

```sql
SELECT 
  destino,
  COUNT(*) AS total_viajes
FROM viaje
GROUP BY destino
ORDER BY total_viajes DESC;
```

### 6.5 Tipos de buses más utilizados

**Caso de uso:** Análisis de preferencia de servicio

```sql
SELECT 
  b.tipo,
  COUNT(v.id) AS viajes
FROM bus b
LEFT JOIN viaje v ON b.id = v.id_bus
GROUP BY b.tipo
ORDER BY viajes DESC;
```

### 6.6 Choferes con categoría A y su productividad

**Caso de uso:** Performance de personal calificado

```sql
SELECT 
  u.nombre,
  u.apellido,
  c.categoria,
  COUNT(v.id) AS viajes
FROM chofer c
INNER JOIN user u ON c.id_user = u.id
INNER JOIN viaje v ON c.id = v.id_chofer
WHERE c.categoria = 'A'
GROUP BY c.id, u.nombre, u.apellido, c.categoria
ORDER BY viajes DESC;
```

---

## 7. Subconsultas

### 7.1 Usuarios que no son choferes ni administradores

**Caso de uso:** Identificar pasajeros puros

```sql
SELECT nombre, apellido, correo FROM user 
WHERE tipo NOT IN (SELECT DISTINCT tipo FROM user WHERE tipo IN ('chofer', 'administrador'));
```

### 7.2 Viajes a ciudades donde hay más de 3 viajes

**Caso de uso:** Rutas principales

```sql
SELECT DISTINCT origen, destino FROM viaje
WHERE (origen, destino) IN (
  SELECT origen, destino FROM viaje 
  GROUP BY origen, destino 
  HAVING COUNT(*) > 3
);
```

### 7.3 Buses que tienen más viajes que el promedio

**Caso de uso:** Buses de alto rendimiento

```sql
SELECT 
  b.placa,
  b.marca,
  COUNT(v.id) AS viajes
FROM bus b
LEFT JOIN viaje v ON b.id = v.id_bus
GROUP BY b.id, b.placa, b.marca
HAVING COUNT(v.id) > (SELECT AVG(viaje_count) FROM (
  SELECT COUNT(*) AS viaje_count FROM viaje GROUP BY id_bus
) AS bus_viajes);
```

### 7.4 Choferes que han realizado viajes a Santa Cruz

**Caso de uso:** Personal con experiencia en ruta específica

```sql
SELECT DISTINCT 
  c.nombre,
  c.apellido,
  c.categoria
FROM chofer c
WHERE c.id IN (SELECT DISTINCT id_chofer FROM viaje WHERE destino = 'Santa Cruz');
```

---

## 8. Consultas Complejas y Casos Prácticos

### 8.1 Resumen operativo: Choferes, buses y viajes

**Caso de uso:** Dashboard operativo

```sql
SELECT 
  u.nombre AS chofer,
  b.placa AS bus_placa,
  b.marca AS bus_marca,
  COUNT(v.id) AS viajes,
  GROUP_CONCAT(CONCAT(v.origen, ' -> ', v.destino) SEPARATOR ', ') AS rutas
FROM chofer c
INNER JOIN user u ON c.id_user = u.id
LEFT JOIN viaje v ON c.id = v.id_chofer
LEFT JOIN bus b ON v.id_bus = b.id
GROUP BY c.id, u.nombre, b.placa, b.marca;
```

### 8.2 Viajes de hoy (asumiendo hoy es 2026-06-06)

**Caso de uso:** Operaciones del día

```sql
SELECT 
  v.id,
  v.horario,
  c.nombre AS chofer,
  b.placa,
  v.origen,
  v.destino,
  b.capacidad
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
INNER JOIN bus b ON v.id_bus = b.id
WHERE DATE(v.fecha) = '2026-06-06'
ORDER BY v.horario;
```

### 8.3 Viajes por hora del día

**Caso de uso:** Distribución de carga horaria

```sql
SELECT 
  HOUR(CONCAT(DATE(fecha), ' ', horario)) AS hora,
  COUNT(*) AS total_viajes
FROM viaje
GROUP BY HOUR(CONCAT(DATE(fecha), ' ', horario))
ORDER BY hora;
```

### 8.4 Choferes ordenados por experiencia (edad)

**Caso de uso:** Asignación según experiencia

```sql
SELECT 
  u.nombre,
  u.apellido,
  c.categoria,
  c.fecha_nac,
  YEAR(CURDATE()) - YEAR(c.fecha_nac) AS edad,
  COUNT(v.id) AS viajes
FROM chofer c
INNER JOIN user u ON c.id_user = u.id
LEFT JOIN viaje v ON c.id = v.id_chofer
GROUP BY c.id, u.nombre, u.apellido, c.categoria, c.fecha_nac
ORDER BY c.fecha_nac ASC;
```

### 8.5 Reporte de utilización de buses

**Caso de uso:** Análisis de eficiencia de flota

```sql
SELECT 
  b.placa,
  b.marca,
  b.capacidad,
  b.tipo,
  COUNT(v.id) AS viajes_asignados,
  ROUND((COUNT(v.id) / 10) * 100, 2) AS porcentaje_uso
FROM bus b
LEFT JOIN viaje v ON b.id = v.id_bus
GROUP BY b.id, b.placa, b.marca, b.capacidad, b.tipo
ORDER BY porcentaje_uso DESC;
```

### 8.6 Rutas disponibles desde cada ciudad

**Caso de uso:** Sistema de búsqueda de viajes

```sql
SELECT DISTINCT 
  origen,
  destino
FROM viaje
ORDER BY origen, destino;
```

### 8.7 Información completa de un viaje específico

**Caso de uso:** Reserva o detalles de viaje

```sql
SELECT 
  v.id AS viaje_id,
  v.fecha,
  v.horario,
  v.origen,
  v.destino,
  c.nombre AS chofer_nombre,
  c.apellido AS chofer_apellido,
  c.ci AS chofer_ci,
  c.celular AS chofer_celular,
  b.placa AS bus_placa,
  b.marca AS bus_marca,
  b.capacidad AS capacidad_disponible,
  b.tipo AS tipo_servicio
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
INNER JOIN bus b ON v.id_bus = b.id
WHERE v.id = 1;
```

### 8.8 Viajes agrupados por chofer y ordenados por fecha

**Caso de uso:** Itinerario de chofer

```sql
SELECT 
  u.nombre,
  u.apellido,
  v.fecha,
  v.horario,
  v.origen,
  v.destino,
  b.placa
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
INNER JOIN user u ON c.id_user = u.id
INNER JOIN bus b ON v.id_bus = b.id
ORDER BY u.nombre, v.fecha, v.horario;
```

### 8.9 Estadísticas generales del sistema

**Caso de uso:** KPI general

```sql
SELECT 
  (SELECT COUNT(*) FROM user) AS total_usuarios,
  (SELECT COUNT(*) FROM user WHERE tipo = 'chofer') AS total_choferes,
  (SELECT COUNT(*) FROM user WHERE tipo = 'pasajero') AS total_pasajeros,
  (SELECT COUNT(*) FROM user WHERE tipo = 'administrador') AS total_admin,
  (SELECT COUNT(*) FROM chofer) AS choferes_registrados,
  (SELECT COUNT(*) FROM bus) AS buses_flota,
  (SELECT COUNT(*) FROM viaje) AS viajes_programados,
  (SELECT SUM(capacidad) FROM bus) AS capacidad_total;
```

### 8.10 Buscar viajes disponibles (filtrado por ruta y fecha)

**Caso de uso:** Sistema de búsqueda para pasajeros

```sql
SELECT 
  v.id,
  v.horario,
  c.nombre AS chofer,
  b.marca,
  b.tipo,
  b.capacidad,
  v.fecha
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
INNER JOIN bus b ON v.id_bus = b.id
WHERE v.origen = 'La Paz' 
  AND v.destino = 'Cochabamba'
  AND DATE(v.fecha) = '2026-06-05'
ORDER BY v.horario;
```

---

## 9. Consultas Avanzadas con Ventanas (Window Functions)

### 9.1 Ranking de choferes por cantidad de viajes

**Caso de uso:** Leaderboard de productividad

```sql
SELECT 
  u.nombre,
  u.apellido,
  COUNT(v.id) AS viajes,
  ROW_NUMBER() OVER (ORDER BY COUNT(v.id) DESC) AS ranking
FROM chofer c
INNER JOIN user u ON c.id_user = u.id
LEFT JOIN viaje v ON c.id = v.id_chofer
GROUP BY c.id, u.nombre, u.apellido
ORDER BY ranking;
```

### 9.2 Viajes numerados por chofer

**Caso de uso:** Seguimiento de secuencia

```sql
SELECT 
  u.nombre,
  v.horario,
  v.origen,
  v.destino,
  ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY v.fecha, v.horario) AS viaje_numero
FROM viaje v
INNER JOIN chofer c ON v.id_chofer = c.id
INNER JOIN user u ON c.id_user = u.id
ORDER BY u.nombre, viaje_numero;
```

---

## 10. Consultas con UNION

### 10.1 Combinar información de choferes y administradores

**Caso de uso:** Personal operativo

```sql
SELECT 
  u.id,
  u.nombre,
  u.apellido,
  u.correo,
  'Chofer' AS rol
FROM user u
WHERE u.tipo = 'chofer'
UNION
SELECT 
  u.id,
  u.nombre,
  u.apellido,
  u.correo,
  'Administrador' AS rol
FROM user u
WHERE u.tipo = 'administrador'
ORDER BY nombre;
```

---

## Notas y Sugerencias de Mejora

### Índices Recomendados

Para optimizar las consultas, se recomienda crear los siguientes índices:

```sql
CREATE INDEX idx_viaje_chofer ON viaje(id_chofer);
CREATE INDEX idx_viaje_bus ON viaje(id_bus);
CREATE INDEX idx_user_tipo ON user(tipo);
CREATE INDEX idx_viaje_fecha ON viaje(fecha);
```

### Mejoras Adicionales

1. **Vistas (Views):** Para mejor performance, considerar materializar vistas de consultas frecuentes.

2. **Triggers:** Implementar triggers para auditoría de cambios en datos críticos.

3. **Prepared Statements:** Usar prepared statements en aplicaciones para prevenir SQL injection.

4. **Particionamiento:** Para bases de datos grandes, considerar particionamiento de tablas por fecha.

---

## Resumen de Técnicas SQL Cubiertas

- ✅ SELECT básico y filtrado
- ✅ WHERE, ORDER BY, LIMIT
- ✅ Agregaciones (COUNT, SUM, AVG, MIN, MAX)
- ✅ GROUP BY y HAVING
- ✅ INNER JOIN
- ✅ LEFT JOIN
- ✅ Subconsultas
- ✅ UNION
- ✅ Window Functions (ROW_NUMBER)
- ✅ Funciones de fecha y hora
- ✅ GROUP_CONCAT
- ✅ Funciones matemáticas (ROUND)

