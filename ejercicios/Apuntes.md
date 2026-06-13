### Aplicaciónes nativa

* Una versión en concreta
* Arquitectura PC
* Configuraciones

### Docker

* Estandar

### Comandos Básicos de terminal

```bash
# Mostrar el Path (Donde estamos ubicados)
pwd
# Ingresar y Retroceder una ruta (directorio)
cd [carpeta/ruta]
# Retroceder
cd ..
# listar carpetas / archivos
ls
```

### Comandos Docker Compose

```bash
# Que servicios están levantados
docker compose ps
# Levantar los contenedores
docker compose up -d # -d: significa que correrá en segundo plano
# Ingresar al contenedor
docker compose exec db bash
# Ingresar directamente al motor de base de datos
docker compose exec db mysql -u root -p
```

### Sintaxis SQL, para MySQL

#### Manejo de bases de datos

```sql
SHOW DATABASES;        -- Lista todas las bases de datos
USE nombre_bd;         -- Cambia a una base de datos específica
SELECT DATABASE();     -- Muestra la base de datos actual
CREATE DATABASE test;  -- Crea una nueva base de datos
DROP DATABASE test;    -- Elimina una base de datos
```

#### Manejo de tablas

```sql
SHOW TABLES;                  -- Lista todas las tablas de la BD actual
DESCRIBE nombre_tabla;        -- Muestra estructura de la tabla (columnas, tipos)
CREATE TABLE ejemplo (
  id INT PRIMARY KEY,
  nombre VARCHAR(50)
);                            -- Crea una tabla simple
DROP TABLE ejemplo;           -- Elimina una tabla
```

#### Crear una base de datos y tablas

```sql
CREATE DATABASE pasajes;
use pasajes;

CREATE TABLE user (
  id integer PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nombre varchar(50),
  apellido varchar(50),
  correo varchar(100),
  contra varchar(100),
  tipo varchar(15),
  fecha datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE chofer (
  id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  ci varchar(20),
  nombre varchar(50),
  apellido varchar(50),
  categoria varchar(5),
  descripcion text,
  celular int,
  fecha_nac date,
  img varchar(300), # path\img-usuario-1.png
  fecha datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE bus (
  id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  placa varchar(15),
  marca varchar(30),
  num varchar(10),
  color varchar(15),
  capacidad int,
  tipo varchar(15),
  img varchar(150),
  fecha datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE viaje (
  id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_chofer int,
  id_bus int,

  horario varchar(30),
  origen varchar(30),
  destino varchar(30),
  fecha datetime,
  FOREIGN KEY (id_chofer) REFERENCES chofer(id),
  FOREIGN KEY (id_bus) REFERENCES bus(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
```

#### Insertar datos a una tabla

```sql
INSERT INTO user (nombre, apellido, correo, contra, tipo, fecha) VALUES
('María', 'Gonzales', 'maria.gonzales@example.com', 'pass1234', 'ADM', '2026-06-13 10:30:00'),
('Carlos', 'Ramirez', 'carlos.ramirez@example.com', 'secure5678', 'USR', '2026-06-12 09:15:00'),
('Lucía', 'Fernandez', 'lucia.fernandez@example.com', 'clave9876', 'USR', '2026-06-11 14:45:00'),
('Jorge', 'Lopez', 'jorge.lopez@example.com', 'jorge2026', 'ADM', '2026-06-10 08:00:00'),
('Ana', 'Torres', 'ana.torres@example.com', 'anaPass', 'USR', '2026-06-09 16:20:00');
```

#### Eliminar todos los registros de user

```sql
DELETE FROM user;
```

