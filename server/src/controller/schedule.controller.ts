import { Request, Response } from 'express';
import { validateLogin } from '../schemas/auth';
import Estudiante from '../models/Estudiante';
import Personal from '../models/Personal';
import Materia from '../models/Materias';
import Horario from '../models/Horario';


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
    const res = await Estudiante.findOne()
    if(!res) return response.status(404).json( { message: 'Estudiante no encontrado' } );
    
    const horarios = res['horarios'];
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

    response.json(schedule).end();
}



//console.log( `Estudiante ${res.nombre} - Materia: ${hor?.mat.nombre_completo_materia} - Maestro: ${hor['personal'].nombre_empleado} ${hor['personal'].apellidos_empleado}  ` )