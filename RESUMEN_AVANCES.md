# Resumen de Avances — Curso de Análisis de Datos

Documento de recapitulación del avance del curso, organizado por clase (cronológico) según las grabaciones y el material de trabajo. Incluye los temas vistos, las herramientas utilizadas, los ejercicios realizados y las competencias adquiridas en cada sesión.

---

## Índice

1. [Clase 1 — 09 de mayo · Ética y gobernanza del dato](#clase-1--09-de-mayo--ética-y-gobernanza-del-dato)
2. [Clase 2 — 16 de mayo · Estructura y origen de los datos](#clase-2--16-de-mayo--estructura-y-origen-de-los-datos)
3. [Clase 3 — 30 de mayo · Docker y Docker Compose](#clase-3--30-de-mayo--docker-y-docker-compose)
4. [Clase 4 — 14 de junio · Primera clase de SQL](#clase-4--14-de-junio--primera-clase-de-sql)
5. [Clase 5 — 20 de junio · Segunda clase de SQL](#clase-5--20-de-junio--segunda-clase-de-sql)
6. [Clase 6 — 04 de julio · Tercera clase de SQL (Data Cleaning)](#clase-6--04-de-julio--tercera-clase-de-sql-data-cleaning)
7. [Clase 7 — 11 de julio · Cuarta clase de SQL/MongoDB (NoSQL)](#clase-7--11-de-julio--cuarta-clase-de-sqlmongodb-nosql)
8. [Clase 8 — 18 de julio · Primera clase de Power BI](#clase-8--18-de-julio--primera-clase-de-power-bi)
9. [Clase 9 — 01 de agosto · Segunda clase de Power BI](#clase-9--01-de-agosto--segunda-clase-de-power-bi)
10. [Síntesis general](#síntesis-general)

---

## Clase 1 — 09 de mayo · Ética y gobernanza del dato

**Material:** `Temas/1.2 - Etica y Gobernanza.pdf` · `Uso-de-los-datos/`

### Temas tratados
- **Gobierno y gobernanza del dato (Data Governance):** quién es responsable de definir políticas, estándares y decisiones sobre los datos en una organización.
- **Ética del dato:** uso responsable, transparencia, privacidad y consentimiento al trabajar con información de usuarios.
- **Sesgos y calidad:** importancia de que los datos sean veraces, completos y no discriminatorios antes de su análisis.
- **Gobernanza de la IA:** de "solucionar problemas" a "diagnosticarlos" — las implicancias de usar modelos de IA sobre datos de terceros.

### Competencias logradas
- Reconocer la diferencia entre gestionar datos y *gobernar* datos.
- Identificar riesgos éticos (privacidad, sesgo, discrecionalidad) al analizar datos reales.
- Establecer criterios mínimos de calidad y de uso responsable del dato.

### Material referencial
- `Uso-de-los-datos/La gobernanza de la IA de solucionar problemas a Diagnosticarlos.pdf`
- README del resto de bibliografía en `Uso-de-los-datos/`.

---

## Clase 2 — 16 de mayo · Estructura y origen de los datos

**Material:** `Temas/2.1 - Datos web_estructura_y_origen.pdf` (+ 2.2 Data Science y 2.3 Data Mining como contexto)

### Temas tratados
- **Estructura de los datos:** datos estructurados, semiestructurados y no estructurados.
- **Origen de los datos web:** cómo las páginas y aplicaciones generan datos (logs, APIs, bases de datos, sensores, redes sociales).
- **Introducción a Data Science y su ciclo de vida** (captura → limpieza → análisis → visualización → modelado).
- **Introducción a Data Mining:** extracción de patrones y conocimiento en grandes volúmenes de datos (web content, web structure y web usage mining).

### Brechas logradas
- Distinguir tipologías de datos y sus fuentes.
- Ubicar el rol del analista dentro del proceso de *Data Science*.
- Entender en alto nivel qué es la minería de datos.

### Material referencial
- `Temas/2.1 - Datos web_estructura_y_origen.pdf`
- `Web-Mining/` (Data Mining Slides, What is Data Science, Data Mining concepts, intro a Data Mining, etc.)

---

## Clase 3 — 30 de mayo · Docker y Docker Compose

**Material:** comandos y config en `ejercicios/01-clase-sql/Apuntes.md` y `docker-compose.yml`

### Temas tratados
- **¿Qué es Docker?** Contenedores como estándar para ejecutar servicios de forma reproducible (vs. aplicaciones nativas con arquitectura específica y configuraciones propias).
- **Comandos básicos de terminal:** `pwd`, `cd`, `cd ..`, `ls`.
- **Comandos de Docker Compose:**
  ```bash
  docker compose ps          # servicios en ejecución
  docker compose up -d       # levantar contenedores en segundo plano
  docker compose exec db bash  # entrar al contenedor
  docker compose exec db mysql -u root -p  # entrar al motor de BD
  ```

### Brechas logradas
- Levantar y administrar servicios de base de datos en contenedores.
- Configurar puertos, volumenes y variables de entorno vía `docker-compose.yml`.
- Tener el entorno de trabajo (MySQL) reproducible para las clases siguientes.

---

## Clase 4 — 14 de junio · Primera clase de SQL

**Material:** `ejercicios/01-clase-sql/` (`Apuntes.md`, `consultas.md`, `inserts.sql`, `docker-compose.yml`)

### Temas tratados
- **Gestión de bases de datos:** `SHOW DATABASES`, `USE`, `CREATE/DROP DATABASE`.
- **Gestión de tablas:** `SHOW TABLES`, `DESCRIBE`, `CREATE TABLE`, `DROP TABLE`, claves primarias (PK) y foráneas (FK).
- **Diseño DDL/DML en MySQL** sobre una BD ejemplo *"pasajes"* (tablas `user`, `chofer`, `bus`, `viaje` con relaciones).
- **Inserción de datos:** `INSERT INTO ... VALUES`.
- **Consultas progresivas (100+ en `consultas.md`):**
  - `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`.
  - Búsquedas y filtrado por texto, fechas, condiciones múltiples.
  - **Agregación:** `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`.
  - **JOINs:** `INNER JOIN` y `LEFT JOIN` entre `user`, `chofer`, `bus`, `viaje`.
  - **Subconsultas**, `UNION`, y funciones de ventana (`ROW_NUMBER()`), funciones de fecha y `GROUP_CONCAT`.

### Brechas logradas
- Modelar y consultar una base de datos relacional aplicada a un caso real.
- Analizar datos (KPIs: totales, promedio, segmentación) usando SQL puro.

---

## Clase 5 — 20 de junio · Segunda clase de SQL

**Material:** `ejercicios/02-clase-sql/` (`Clase_3_SQL_MySQL_Sakila.md`, notebook, `Sakila_MySQL_Example-master`)

### Temas tratados
- **MySQL contra la base relacional real Sakila** (tablas `customer`, `rental`, `inventory`, `film`, `payment`, `category`).
- **JOINs de varias tablas** para responder preguntas de negocio:
  - Clientes + alquileres (`INNER JOIN`).
  - Alquileres → películas (join de 3+ tablas).
  - Ingresos por cliente (`SUM(p.amount)` + `GROUP BY`).
  - Ingresos por categoría (join en cadena `payment → rental → inventory → film_category → category`).
- **Conexión de Jupyter a MySQL con Python** (SQLAlchemy + `pymysql`, `pd.read_sql`).
- **Exportación de resultados a CSV** (preparación para Power BI).

### Brechas logradas
- Conectar un *Notebook* Python a un motor MySQL remoto.
- Transformar consultas SQL en `DataFrames` de pandas.
- Generar datasets tabulares (CSV) listos para dashboards.

---

## Clase 6 — 04 de julio · Tercera clase de SQL (Data Cleaning)

**Material:** `ejercicios/03-clase-sql/Clase3_SQL_DataCleaning_exec.ipynb` + `docker-compose.yml`

### Temas tratados
- **Subir un CSV a MySQL** (`pd.to_sql` → tabla `titanic_passengers`).
- **Análisis preliminar con SQL:** dimensiones, tipos (INFORMATION_SCHEMA) y distribución por `pclass`/`sex`/`survived`.
- **Data wrangling con SQL:** selección de subconjuntos, filtros múltiples, ordenamiento.
- **Data cleaning + ingeniería de variables** mediante la vista `titanic_clean`:
  - Imputación de `age`, `fare`, `embarked` con `COALESCE` (media por grupo / media global / moda).
  - Variables derivadas: `family_size`, `is_alone`, `age_group` (CTE + `CASE`).
- **Detección de outliers** en `fare` con regla **IQR** (cuartiles vía `ROW_NUMBER`).
- **Exportación** de datos limpios a CSV (para Power BI).

### Brechas logradas
- Reproducir en SQL lo que tradicionalmente se hace en pandas (wrangling y cleaning).
- Construir vistas reutilizables de datos limpios.

---

## Clase 7 — 11 de julio · Cuarta clase de SQL / MongoDB (NoSQL)

**Material:** `ejercicios/04-clase-sql/curso-mongodb-intro/`

> Aunque la carpeta se llama `04-clase-sql`, el contenido es una introducción a **MongoDB (modelo NoSQL/documentos)**.

### Temas tratados
- **Contexto NoSQL** vs modelo relacional (documentos flexibles, sin esquema rígido).
- **Levantar MongoDB con Docker** (`docker compose up -d mongodb`) y `mongosh`.
- **CRUD básico:** insertar (`insertOne`/`insertMany`), buscar (`find`, `find`), actualizar (`updateOne`, `$set`, `$inc`), eliminar.
- **Consultas avanzadas:**
  - Operadores de comparación/lógica (`$eq`, `$ne`, `$gt`, `$in`, `$expr`…).
  - Consulta de arreglos y subdocumentos.
  - Expresiones regulares (`$regex`).
  - **Proyección** (filtrar columnas del resultado).
  - **Agregación** / pipeline; `sort`, `limit` y paginación.
  - `upsert`.

### Brechas logradas
- Entender y usar una base de datos documental.
- Comparar modelos relacional (SQL) vs al respecto de documentos (NoSQL) para distintos casos de uso.

---

## Clase 8 — 18 de julio · Primera clase de Power BI

**Material:** `PowerBI/Clase - 01/DataCleaning.ipynb`

### Temas tratados
- **Preparación del entorno en Jupyter** con pandas/NumPy/Matplotlib.
- **Carga e inspección** del dataset `titanic3.csv` (cambio de tipo a `describe`).
- **Diagnóstico de valores faltantes** (nulos por columna y %):
  - `body` 90.76 %, `cabin` 77.46 %, `boat` 62.87 %, `home.dest` 43.09 %, `age` 20.09 %.
- **Pipeline de limpieza** (data cleaning en Python) pensado para una data pipeline que será consumida de Power BI.
- **Exportación** de datasets listos para dashboard:
  - `outputs/titanic_tratado_pasajero.csv` (detalle por pasajero).
  - `outputs/titanic_tratado_agregado_dashboard.csv` (resumen por segmento).

### Brechas logradas
- Preparar datos con código antes de visualizarlos.
- Definir qué tabla granular y qué agrupado conviene para un dashboard.

---

## Clase 9 — 01 de agosto · Segunda clase de Power BI

**Material:** `PowerBI/Clase - 02/` (`Appol Datos.xlsx`, `Reporte Appol.pbix`, `Reto - Titanic.jpg`)

### Temas tratados
- **Carga de datos** desde Excel (`Appol Datos.xlsx`) y modelado dentro de Power BI.
- **Construcción de un dashboard** / reporte interactivo (`Reporte Appol.pbix`):
  - Visualizaciones y segmentaciones (slicers).
  - Medidas básicas / agregados para responder preguntas de negocio.
  - Conexión de datasets limpios (los CSV generados en las clases de SQL/pandas).
- **Reto Titanic** (`Reto - Titanic.jpg`): aplicar el flujo completo datos → limpieza → dashboard sobre el dataset Titanic.

### Brechas logradas
- Construir un reporte interactivo completo en Power BI.
- Vincular el pipeline aprendido (SQL + pandas) con la visualización final.

---

## Síntesis

### Hilo conductor del curso
```
Datos (origen/estructura)  →  Ética y gobernanza
        ↓
Docker / entorno (MySQL, MongoDB)
        ↓
SQL relacional + MongoDB (NoSQL)  →  Data cleaning y wrangling
        ↓
pandas / Python (limpieza y EDA)
        ↓
Power BI (modelado y dashboard)
```

### Herramientas y tecnologías
| Herramienta | Uso | Clases |
|-------------|-----|--------|
| Docker / Docker Compose | entorno de BD reproducibles | 3 |
| MySQL (SQL) | análisis y Data Cleaning relacional | 4–6 |
| Jupyter / Python (SQLAlchemy, pandas, matplotlib) | conexión, wrangling, exportación | 5–8 |
| MongoDB | bases documentales / NoSQL | 7 |
| Power BI | modelado y visualización | 8–9 |

### Técnicas cubiertas
- **SQL:** DDL / DML, SELECT/WHERE/ORDER BY, agregación (`GROUP BY`, `HAVING`), JOIN (INNER/LEFT), subconsultas, UNION, ventanas (`ROW_NUMBER`), funciones de fecha, `GROUP_CONCAT`, vistas, IQR.
- **NoSQL:** CRUD con `mongosh`, operadores (`$eq`, `$in`, `$regex`…), proyección, agregación, arrays/subdocumentos.
- **Data cleaning:** tratamiento de nulos (imputación/salida), variables derivadas, detección de outliers, exportación a CSV.
- **BI:** modelado, visualizaciones y reporte en Power BI.

---

## Resumen de actividades

| Fecha | Clase | Tema | Herramientas | Actividad principal |
|-------|-------|------|--------------|---------------------|
| 09/05 | 1 | Ética y gobernanza del dato | (conceptual) | Políticas, ética y gobernanza de datos |
| 16/05 | 2 | Estructura y origen de los datos | (conceptual) | Tipología y fuentes de datos (web, Data Science, Data Mining) |
| 30/05 | 3 | Docker y Docker Compose | Docker, Compose, terminal | Levantar/administrar servicios de BD en contenedores |
| 14/06 | 4 | Primera clase de SQL | MySQL, SQL | BD "pasajes": DDL, DML y +100 consultas analíticas |
| 20/06 | 5 | Segunda clase de SQL | MySQL, Jupyter, pandas | Sakila + JOINs de negocio, conexión Jupyter y export CSV |
| 04/07 | 6 | Tercera clase de SQL (Data Cleaning) | MySQL, Jupyter, pandas | Titanic: imputación, vista `titanic_clean`, outliers (IQR) |
| 11/07 | 7 | Cuarta clase (MongoDB / NoSQL) | MongoDB, mongosh, Docker | CRUD, consultas, arrays, agregación y proyección |
| 18/07 | 8 | Primera clase de Power BI | Python, pandas | DataCleaning.ipynb: EDA y preparación de datos Titanic |
| 01/08 | 9 | Segunda clase de Power BI | Power BI | Modelado y dashboard "Appol" + reto Titanic |