import app from './src/app';
import dotenv from 'dotenv';
import './src/db'


dotenv.config();

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`\x1b[34m[EXPRESS] Servidor iniciado en el puerto ${port}`);
} );


import Aula from './src/models/Aulas';
import Horario from './src/models/Horario';
import Carrera from './src/models/Carrera';
import Materia from './src/models/Materias';
import Personal from './src/models/Personal';
import Estudiante from './src/models/Estudiante';
import auth from './src/routes/auth.route';
import schedule from './src/routes/schedule.route';

app.use('/api/auth', auth)
app.use('/api/schedule', schedule)



/*

Estudiante.findAll( ).then( async (res: Estudiante[]) => {
    
    const horarios = res[0]['horarios'];

    if(horarios.length > 0) {
        
        for(const horario of horarios) {
            const hor:any = await Horario.findByPk(horario, { 
                include: [
                    {
                        model: Personal,
                        as: 'personal',
                    },
                    {
                        model: Materia,
                        as: 'mat'
                    }
                ]
            });


            
            console.log( `Estudiante ${res[0].nombre} - Materia: ${hor?.mat.nombre_completo_materia} - Maestro: ${hor['personal'].nombre_empleado} ${hor['personal'].apellidos_empleado}  ` )

            console.log(hor?.mat)
        }
    }

    
} )


*/

/* public n_control!: string;
    public nombre!: string;
    public apellido_paterno!: string;
    public apellido_materno!: string;
    public carrera!: string;
    public horario!: string;
Horario.findAll( {
    include: [
        {
            model: Personal,
            as: 'personal',
        },
    ]
}).then((res: any) => {

    console.log(res[0].id )
})



const hor: Horario = new Horario( { 
    id: 1,
    periodo: '20203',
    rfc: 'REFG840802EP0',
    tipo_horario: 'D',
    dia_semana: 5,
    hora_inicial: '1900-01-01 16:00:00',
    hora_final: '1900-01-01 17:00:00',
    materia: 'UI7',
    grupo: 'B',
    aula: 'S2',
    actividad: 'B',
    consecutivo_admvo: 166612,	
    clave_puesto: 13,
});

hor.save().then( (horario) => {
    console.log(horario);
}).catch( (error) => {
    console.log(error);
} )



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
*/

/* 
    rfc bpchar(13) NOT NULL, 

clave_centro_seit bpchar(10) NULL, 

clave_area bpchar(6) NULL, 

curp_empleado bpchar(18) NULL, 

no_tarjeta int4 NULL, 

apellidos_empleado varchar(45) NULL, 

nombre_empleado varchar(35) NULL, 

horas_nombramiento int4 NULL, 

nombramiento bpchar(1) NOT NULL, 

clases bpchar(1) NULL, 

ingreso_rama bpchar(6) NULL, 

inicio_gobierno bpchar(6) NULL, 

inicio_sep bpchar(6) NULL, 

inicio_plantel bpchar(6) NULL, 

domicilio_empleado varchar(60) NULL, 

colonia_empleado varchar(40) NULL, 

codigo_postal_empleado int4 NULL, 

localidad varchar(30) NULL, 

telefono_empleado varchar(30) NULL, 

sexo_empleado bpchar(1) NULL, 

estado_civil bpchar(1) NULL, 

fecha_nacimiento timestamp NULL, 

lugar_nacimiento int4 NULL, 

institucion_egreso varchar(50) NULL, 

nivel_estudios bpchar(1) NULL, 

grado_maximo_estudios bpchar(1) NULL, 

estudios varchar(250) NULL, 

fecha_termino_estudios timestamp NULL, 

fecha_titulacion timestamp NULL, 

cedula_profesional bpchar(15) NULL, 

especializacion varchar(50) NULL, 

idiomas_domina varchar(60) NULL, 

status_empleado bpchar(2) NULL, 

foto json NULL, 

firma json NULL, 

correo_electronico varchar(60) NULL, 

padre varchar(50) NULL, 

madre varchar(50) NULL, 

conyuge varchar(50) NULL, 

hijos varchar(100) NULL, 

num_acta int4 NULL, 

num_libro int4 NULL, 

num_foja int4 NULL, 

num_ano int4 NULL, 

num_cartilla_smn bpchar(15) NULL, 

ano_clase int4 NULL, 

pigmentacion bpchar(1) NULL, 

pelo bpchar(1) NULL, 

frente bpchar(1) NULL, 

cejas bpchar(1) NULL, 

ojos bpchar(1) NULL, 

nariz bpchar(1) NULL, 

boca bpchar(1) NULL, 

estaturamts numeric(3, 2) NULL, 

pesokg numeric(5, 2) NULL, 

    senas_visibles varchar(255) NULL, pais varchar(30) NULL, 
    pasaporte varchar(40) NULL,  fm varchar(30) NULL,  inicio_vigencia timestamp NULL,  termino_vigencia timestamp NULL,  entrada_salida bpchar(1) NULL,  observaciones_empleado varchar(254) NULL,  area_academica bpchar(6) NULL,  tipo_personal bpchar(1) NULL,  tipo_control bpchar(1) NULL,  emergencia varchar(250) NULL,  entidad_federativa int4 NULL,  situacion_estudios varchar(5) NULL,  sybfi2_1 varchar(81) NULL,  correo_electronico_personal varchar(60) NULL, 
    REFG840802EP0	28DIT0026P	130100	REFG840802HVZYGR09	17	REYES FIGUEROA	GERARDO		D		201120	201120	201120	202002	CALLE: ALDANA # 12	17 DE MAYO	92513	CERRO AZUL, VERACRUZ	7851012803	M	C	1984-08-02 00:00:00.000	30		I	0	INGENIERO EN SISTEMAS COMPUTACIONALES						02			gerardo.rf@matamoros.tecnm.mx	
*/
/*

const mat = new Materia( {
    materia: 'UI7',
    nivel_escolar: 'L',
    tipo_materia: 1,
    clave_area: '110600',
    nombre_completo_materia: 'Taller de Investigacion II ',
    nombre_abreviado_materia: 'TALLER DE INVESTIGACION II',
    ntemas: 3,
} )

mat.save().then( (materia) => {
    console.log(materia);
}).catch( (error) => {
    console.log(error);

} )





new Carrera( {
    carrera: 10,
    reticula: 1,
    nivel_escolar: 'L',
    clave_oficial: 'ISIC-2010-224 ',
    nombre_carrera: 'Ingeniería en Sistemas Computacionales',
    nombre_reducido: 'ING. EN SISTEMAS COMP.',
    siglas: 'ISC',
    carga_maxima: 36,
    carga_minima: 22,
    fecha_inicio: '2010-08-16',
    fecha_termino: '9999-01-01',
}).save().then( (carrera) => {
    console.log(carrera);
}).catch( (error) => {
    console.log(error);

})


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

