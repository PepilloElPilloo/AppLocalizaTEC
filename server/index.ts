import app from './src/app';
import './src/db'

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`\x1b[34m[EXPRESS] Servidor iniciado en el puerto ${port}`);
} );


import Aula from './src/models/Aulas';
import Horario from './src/models/Horario';



new Horario( { 
    periodo: 20203,
    rfc: 'RIBA8511031V7',
    tipo_horario: 'D',
    dia_semana: 6,
    hora_inicial: '1900-01-01 16:00:00.000',
    hora_final: '1900-01-01 17:00:00.000',
    materia: 'TH8',
    grupo: 'B',
    aula: 'YC8',
    actividad: '',
    consecutivo_admvo: 166612,
    tipo_personal: 'N'
}).save().then( (aula) => {
    console.log(aula);
}).catch( (error) => {
    console.log(error);

} )

/*

public id!: number;
	public periodo!: string | null;
	public rfc!: string | null;
	public tipo_horario!: string | null;
	public dia_semana!: number | null;
	public hora_inicial!: Date;
	public hora_final!: Date | null;
	public materia!: string | null;
	public grupo!: string | null;
	public aula!: string | null;
	public actividad!: string | null;
	public consecutivo!: number | null;
	public vigencia_inicio!: Date | null;
	public vigencia_fin!: Date | null;
	public consecutivo_admvo!: number | null;
	public tipo_personal!: string | null;
	public clave_puesto!: number | null;
	public created_user_id!: number | null;
	public updated_user_id!: number | null;
	public created_at!: Date | null;
	public updated_at!: Date | null;

periodo 20203	
rfc RIBA8511031V7	
tipo D	
dia 6	
hora_inicia 1900-01-01 16:00:00.000	
hora fin 1900-01-01 17:00:00.000	
materia TH8    	
grupo B
aula YC8   						
actividad B	
consecutivo_admvo 166612	
tipo_personal 562 


new Aula( {

    aula: 'S2',
    ubicacion: 'laboratorio',
    capacidad_aula: 45,
    observaciones: 'N',
    permite_cruce: '',
    estatus: 'A',
    id: 187,
    area_id: 11

}).save().then( (aula) => {
    console.log(aula);
}).catch( (error) => {
    console.log(error);

} )*/


/* 

aula: S2
ubicacion: laboratorio
capacidad: 45
observaciones: N
permite_cruce: ''
estatus: A
id: 187,
areaid: 11
*/


/*import Post from './src/routes/Post.route'
app.use('/api/posts', Post);*/

