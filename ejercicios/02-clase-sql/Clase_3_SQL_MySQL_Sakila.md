# Clase 3: Fundamentos de SQL y Analisis con MySQL (Sakila)

## Objetivo de la clase
Aprender los fundamentos de SQL sobre una base de datos relacional real (Sakila), conectar MySQL con Jupyter para analisis exploratorio y exportar resultados a CSV para usarlos luego en Power BI.

---

## 1) Resultados de aprendizaje

Al finalizar la clase, el estudiante podra:

- Explicar que es SQL y que es un RDBMS.
- Identificar tablas, claves primarias (PK) y claves foraneas (FK).
- Ejecutar consultas con `SELECT`, `WHERE`, `ORDER BY`.
- Construir `JOIN` entre tablas relacionadas.
- Conectarse desde Jupyter a MySQL usando Python.
- Exportar consultas a archivos CSV.
- Responder preguntas de negocio simples con Sakila.

---

## 2) Requisitos previos

- Docker Desktop instalado (o Docker Engine + Docker Compose).
- Python 3.10+ recomendado.
- Jupyter Notebook o JupyterLab.
- Archivos de Sakila:
  - `sakila-schema.sql`
  - `sakila-data.sql`
- Editor SQL opcional:
  - MySQL Workbench, DBeaver o VS Code + extension SQL.

---

## 3) Agenda sugerida (minuto a minuto)

### Bloque A - Fundamentos + Setup (0-45 min)
- 0-15: Introduccion a SQL y modelos relacionales.
- 15-30: Levantar MySQL con Docker.
- 30-45: Importar Sakila y validar tablas.

### Bloque B - SQL basico (45-90 min)
- 45-70: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`.
- 70-90: Filtros con fechas, texto, operadores logicos.

### Bloque C - JOINs y analisis (90-145 min)
- 90-120: `INNER JOIN` y relaciones entre tablas.
- 120-145: Preguntas de negocio con Sakila.

### Bloque D - Jupyter + Exportacion + cierre (145-180 min)
- 145-160: Conexion Python/Jupyter <-> MySQL.
- 160-172: Consultas en pandas y exportacion CSV.
- 172-180: Recap, ejercicio final y proximos pasos a Power BI.

---

## 4) Levantar MySQL con Docker

> Puedes usar contrasena y puertos de ejemplo para clase.  
> Usuario root: `root`  
> Password: `root123`  
> Puerto local: `3307` (evita conflicto con un MySQL local en 3306)

### Opcion A: `docker run` rapido

```bash
docker run --name mysql-sakila \
  -e MYSQL_ROOT_PASSWORD=root123 \
  -e MYSQL_DATABASE=sakila \
  -p 3307:3306 \
  -d mysql:8.0
```

Verificar que esta corriendo:

```bash
docker ps
```

### Opcion B: `docker-compose.yml` (recomendado para reutilizar)

```yaml
version: "3.9"
services:
  mysql:
    image: mysql:8.0
    container_name: mysql-sakila
    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: sakila
    ports:
      - "3307:3306"
    volumes:
      - mysql_sakila_data:/var/lib/mysql
volumes:
  mysql_sakila_data:
```

Levantar:

```bash
docker compose up -d
```

---

## 5) Importar el dataset Sakila

### 5.1 Copiar archivos al contenedor (si estan en tu maquina)

```bash
docker cp sakila-schema.sql mysql-sakila:/sakila-schema.sql
docker cp sakila-data.sql mysql-sakila:/sakila-data.sql
```

### 5.2 Ejecutar scripts dentro del contenedor

```bash
docker compose ps
docker compose exec [SERVICE] bash
mysql --user=root --password=root123
SOURCE /sakila-schema.sql;
SOURCE /sakila-schema.sql;
```
O intentan con este otro comando:

```bash
docker compose exec mysql mysql --user=root --password=root123 -e "SOURCE /sakila-schema.sql;"
docker compose exec mysql mysql --user=root --password=root123 -e "SOURCE /sakila-data.sql;"
```

### 5.3 Validacion inicial

```sql
SHOW DATABASES;
USE sakila; SHOW TABLES;
```

Consulta rapida:

```sql
USE sakila;
SELECT COUNT(*) AS total_films FROM film;
```

---

## 6) Conexion de Jupyter a MySQL

## 6.1 Instalar dependencias Python

```bash
pip install jupyterlab pandas sqlalchemy pymysql
```

## 6.2 Iniciar Jupyter

```bash
jupyter lab
```

## 6.3 Codigo de conexion (Notebook)

```python
import pandas as pd
from sqlalchemy import create_engine, text

# mysql+pymysql://usuario:password@host:puerto/base_datos
engine = create_engine("mysql+pymysql://root:root123@localhost:3307/sakila")

with engine.connect() as conn:
    result = conn.execute(text("SELECT 'Conexion OK' AS status;"))
    for row in result:
        print(row)
```

---

## 7) Fundamentos SQL con ejemplos guiados

### 7.1 Inspeccion de estructura

```sql
USE sakila;
SHOW TABLES;
DESCRIBE film;
DESCRIBE customer;
DESCRIBE rental;
```

### 7.2 SELECT basico

```sql
SELECT title, release_year, rating
FROM film
LIMIT 10;
```

### 7.3 WHERE

```sql
SELECT title, rental_rate, rating
FROM film
WHERE rating = 'PG'
LIMIT 15;
```

### 7.4 ORDER BY

```sql
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;
```

### 7.5 Filtros combinados

```sql
SELECT title, length, rating
FROM film
WHERE rating IN ('PG', 'PG-13')
  AND length >= 120
ORDER BY length DESC;
```

---

## 8) JOINs y relaciones (nucleo de la clase)

## 8.1 Modelo logico a explicar
- `customer` -> clientes
- `rental` -> alquileres
- `inventory` -> copias disponibles por tienda
- `film` -> catalogo de peliculas
- `payment` -> pagos realizados

## 8.2 JOIN 1: clientes y alquileres

```sql
SELECT c.customer_id, c.first_name, c.last_name, r.rental_date
FROM customer c
INNER JOIN rental r
  ON c.customer_id = r.customer_id
ORDER BY r.rental_date DESC
LIMIT 20;
```

## 8.3 JOIN 2: alquileres y peliculas

```sql
SELECT r.rental_id, f.title, r.rental_date
FROM rental r
INNER JOIN inventory i
  ON r.inventory_id = i.inventory_id
INNER JOIN film f
  ON i.film_id = f.film_id
ORDER BY r.rental_date DESC
LIMIT 20;
```

## 8.4 JOIN 3: ingresos por cliente

```sql
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       ROUND(SUM(p.amount), 2) AS total_paid
FROM customer c
INNER JOIN payment p
  ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_paid DESC
LIMIT 15;
```

## 8.5 JOIN 4: ingresos por categoria

```sql
SELECT cat.name AS category,
       ROUND(SUM(p.amount), 2) AS revenue
FROM payment p
INNER JOIN rental r
  ON p.rental_id = r.rental_id
INNER JOIN inventory i
  ON r.inventory_id = i.inventory_id
INNER JOIN film_category fc
  ON i.film_id = fc.film_id
INNER JOIN category cat
  ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY revenue DESC;
```

---

## 9) Consultas desde Jupyter con pandas

```python
q_top_customers = """
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       ROUND(SUM(p.amount), 2) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_paid DESC
LIMIT 10;
"""

df_top_customers = pd.read_sql(q_top_customers, engine)
df_top_customers
```

Otro ejemplo:

```python
q_revenue_category = """
SELECT cat.name AS category,
       ROUND(SUM(p.amount), 2) AS revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY revenue DESC;
"""

df_revenue_category = pd.read_sql(q_revenue_category, engine)
df_revenue_category.head()
```

---

## 10) Exportacion de datos a CSV (para Power BI)

```python
df_top_customers.to_csv("top_customers.csv", index=False, encoding="utf-8")
df_revenue_category.to_csv("revenue_by_category.csv", index=False, encoding="utf-8")
```

Verificacion rapida:

```python
import os
os.listdir(".")
```

---

## 11) Ejercicio guiado (20 minutos)

### Consigna
Responder 3 preguntas de negocio:

1. Cuales son las 10 peliculas mas alquiladas?
2. Que clientes generan mas ingresos?
3. Que categoria de pelicula recauda mas?

### Entregable
- 3 consultas SQL.
- 3 DataFrames en Jupyter.
- 3 archivos CSV exportados:
  - `top_10_films.csv`
  - `top_customers.csv`
  - `revenue_by_category.csv`

---

## 12) Checklist docente (antes de iniciar clase)

- [ ] Docker corriendo.
- [ ] Contenedor `mysql-sakila` activo.
- [ ] Sakila importado sin errores.
- [ ] Jupyter abre correctamente.
- [ ] Conexion Python a MySQL validada.
- [ ] Queries de ejemplo probadas.
- [ ] Carpeta de exportacion CSV confirmada.

---

## 13) Problemas comunes y solucion rapida

- **Error de conexion (`Connection refused`)**
  - Verifica que el contenedor este arriba: `docker ps`
  - Revisa puerto correcto (`3307`) y host (`localhost`).

- **`Access denied for user 'root'`**
  - Revisa usuario/password.
  - Reinicia contenedor si cambiaste variables de entorno.

- **No aparece la base `sakila`**
  - Re-ejecuta `sakila-schema.sql` y `sakila-data.sql` en ese orden.

- **Encoding raro en CSV**
  - Exporta con `encoding='utf-8'`.

---

## 14) Cierre y puente a Power BI

Con esta base ya puedes:
- Limpiar y modelar consultas SQL.
- Exportar datasets tabulares en CSV.
- Conectar esos CSV en Power BI para crear dashboards de:
  - Ingresos por categoria
  - Clientes top
  - Tendencias de alquiler por fecha

Siguiente clase recomendada:
- Modelado en Power BI + medidas DAX basicas sobre los CSV generados.
