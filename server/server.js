const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const port = 3000;

app.use(cors());

const pool = new Pool({
  user: 'postgres',        // USER DE POSTGRES
  host: 'localhost',        // NO CAMBIAR
  database: 'postgres',    // NOMBRE DE LA BASE DE DATOS
  password: 'password',    // CONTRA DE LA BASE DE DATOS
  port: 5432,
});

// Ruta para obtener lugares en GeoJSON
app.get('/lugares', async (req, res) => {
  try {
    const query = `
      SELECT id, nombre, tipo, horario, 
      costo, servicios, calificacion, 
       ST_AsGeoJSON(geom)::json as geometry       
      FROM lugares;
    `; // QUERY DE LA BASE DE DATOS
    const result = await pool.query(query);

    const features = result.rows.map(row => ({
      type: "Feature",
      geometry: row.geometry,
      properties: {
        id: row.id,
        nombre: row.nombre,
        tipo : row.tipo,
        horario: row.horario,
        costo: row.costo,
        servicios: row.servicios,
        calificacion: row.calificacion
      }
    }));

    res.json({
      type: "FeatureCollection",
      features
    });
    res.status(200);
  } catch (error) {
    console.error('Error al consultar PostGIS:', error);
    res.status(500).json({ error: 'Error en la base de datos' });
  }
});


// Ruta para obtener zonas en GeoJSON
app.get('/zonas', async (req, res) => {
  try {
    const query = `
      SELECT id, nombre, ST_AsGeoJSON(geom)::json as geometry       
      FROM zonas;
    `; // QUERY DE LA BASE DE DATOS
    const result = await pool.query(query);

    const features = result.rows.map(row => ({
      type: "Feature",
      geometry: row.geometry,
      properties: {
        id: row.id,
        nombre: row.nombre
      }
    }));

    res.json({
      type: "FeatureCollection",
      features
    });
    res.status(200);
  } catch (error) {
    console.error('Error al consultar PostGIS:', error);
    res.status(500).json({ error: 'Error en la base de datos' });
  }
});

app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
