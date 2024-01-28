const express = require('express'); // importar express
const axios = require('axios');     // Importar axios para las solicitud get
const app = express();              // Crear instancia de express
const PORT = 3000;                  // Puerto donde se ejecuta la petición

app.get('/',async(req,res)=>{
    try{
    const response= await axios.get('https://api.github.com/users/google/repos?sort=watchers');
    const popularRepos=response.data.slice(0, 10);
    let respuesta=[];
    popularRepos.forEach(element => {
        respuesta.push({
            id:element.id,
            nombre:element.name,
            private:element.private,
            tipo:element.owner.type,
            licencia:element.license,
            lenguaje:element.language,
            sshUrl:element.ssh_url,
            clonarUrl:element.clone_url,
            fechaCreacion:element.created_at,
            fechaActualizacion:element.updated_at,
            peso:element.size+ 'mb',
            visibilidad:element.visibility,


        });
    //res.json({ repositorios: popularRepos 
    });
    res.json(respuesta)
    }catch(error){
        console.error('Error al obtener los repositorios:', error.message);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
})
app.listen(PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${PORT}`);
  });