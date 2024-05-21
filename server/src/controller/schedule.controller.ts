import e, { Request, Response } from 'express';
import { validateLogin } from '../schemas/auth';
import Estudiante from '../models/Estudiante';
import Personal from '../models/Personal';
import Materia from '../models/Materias';
import Horario from '../models/Horario';



interface IEdificio {
    id: number;
    nombre: string;
    aula: string[];
}

let edificios: IEdificio[] = [
    { id: 1, nombre: 'Edificio R', aula: [] },
    { id: 2, nombre: 'Edificio Y', aula: [] },
    { id: 3, nombre: 'Edificio K', aula: [] },
    { id: 4, nombre: 'Edificio H', aula: [] },
    { id: 5, nombre: 'Edificio M', aula: [] },
    { id: 6, nombre: 'Edificio N', aula: []},
    { id: 7, nombre: 'Edificio J', aula: [] },
    { id: 8, nombre: 'Edificio S', aula: [] },
    { id: 9, nombre: 'Edificio O', aula: [] },
    { id: 10, nombre: 'Edificio I', aula: [] },
    { id: 11, nombre: 'Edificio Q', aula: [] },
    { id: 12, nombre: 'Edificio T', aula: [] },
];

edificios.forEach((val) => {
    const name = val.nombre.replace('Edificio ', '');
    for(let i = 0; i < 8; i++) {
        val.aula.push( `${name}${i}` )
    }
})


console.log(edificios)


interface IHorario {

    materia: string;
    grupo: string;
    aula: string;
    maestro: string;
    startAt: Date;
    endAt: Date;
}


export async function get( req: Request, response: Response) {
    const student = await Estudiante.findOne( {
        where: {
            n_control: req.n_control
        }
    } )
    if(!student) return response.status(404).json( { message: 'Estudiante no encontrado' } );

    let schedule: IHorario[] = [];

    const horarios = student['horarios'];
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
            
            schedule.push( {
                materia: hor['mat'].nombre_completo_materia,
                grupo: hor.grupo.replace(/\s/g, ''),
                aula: hor.aula.replace(/\s/g, ''),
                maestro: `${hor['personal'].nombre_empleado} ${hor['personal'].apellidos_empleado}`,
                startAt: hor.hora_inicial,
                endAt: hor.hora_final
            } )
        }
    }


    if(req.query.aulas) {
        
        let data: any = [];
        for( const horario of schedule  ) { 
            const edificio = edificios.find( (val) => val.aula.includes(horario.aula) );
            if(!edificio) continue;

            data.find(( val:any, index: number) => {
                if(val.edificio === edificio.nombre) {
                    data[index].aula.push(horario);
                }
            });
            
            if(edificio) data.push({
                edificio: edificio.nombre,
                horarios: [horario]
            });
        }


        // remove space from edificio name

        const building = data.find( (val: any) => val.edificio.replace(/\s/g, '') === req.query.aulas );

        console.log(building.horarios)
        if(building) return response.json(building).end();
        return response.json([]).end();
    }


    response.json(schedule).end();
}




//console.log( `Estudiante ${res.nombre} - Materia: ${hor?.mat.nombre_completo_materia} - Maestro: ${hor['personal'].nombre_empleado} ${hor['personal'].apellidos_empleado}  ` )