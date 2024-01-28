# Documentación del Proceso de Creación de la Base de Datos

## 1. Introducción

Este documento proporciona una descripción detallada del proceso de diseño e implementación de la base de datos para un sistema de gestión de vídeos.

## 2. Objetivos

Los objetivos principales del diseño de la base de datos son:

- Almacenar información sobre usuarios, autores, colaboradores, videos, comentarios y reviews.
- Establecer relaciones entre las entidades para representar la estructura del sistema.

## 3. Estructura de la Base de Datos

### 3.1. Tablas

#### 3.1.1. Usuarios

- `usuario_id` (Clave Primaria)
- `nombre_usuario`
- `correo_electronico`
- `contrasena`

#### 3.1.2. Autores

- `autor_id` (Clave Primaria)
- `nombre`
- `biografia`

#### 3.1.3. Colaboradores

- `colaborador_id` (Clave Primaria)
- `nombre`

#### 3.1.4. Videos

- `video_id` (Clave Primaria)
- `autor_id` (Clave Foránea)
- `colaborador_id` (Clave Foránea)
- `titulo`
- `descripcion`
- `fecha_subida`
- `duracion`


#### 3.1.5. Comentarios

- `comentario_id` (Clave Primaria)
- `usuario_id` (Clave Foránea)
- `video_id` (Clave Foránea)
- `texto`
- `fecha_comentario`

#### 3.1.6. Reviews

- `review_id` (Clave Primaria)
- `usuario_id` (Clave Foránea)
- `video_id` (Clave Foránea)
- `calificacion`
- `comentario`
- `fecha_review`

### 3.2. Relaciones

- `Usuarios` <-> `Comentarios`: Relación Uno a Muchos
- `Usuarios` <-> `Reviews`: Relación Uno a Muchos
- `Autores` <-> `Videos`: Relación Uno a Muchos
- `Colaboradores` <-> `Videos`: Relación Uno a Muchos


## 4. Proceso de Creación

El proceso de creación de la base de datos se llevó a cabo mediante la ejecución de un script SQL. Este script incluye la creación de tablas, definición de columnas, claves primarias y foráneas. Dicho script SQL se obtuvo mediante el proceso de ingeniería inversa con la ayuda de la herramienta MySQL Workbench. En esta herramienta, se crearon las tablas con sus atributos y las relaciones, para posteriormente exportar la base de datos en formato SQL.

El script SQL completo se encuentra en el archivo [`Modelo_base_datos.sql`].