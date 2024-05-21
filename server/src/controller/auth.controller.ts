import { Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import { validateLogin } from '../schemas/auth';
import Estudiante from '../models/Estudiante';


export async function login(req: Request, res: Response) {

    const results = validateLogin(req.body);
    if (!results.success) return res.status(400).json( { message: results.error.issues[0].message } );
    const student = await Estudiante.findOne( {
        where: {
            n_control: results.data.ncontrol
        }
    } )
    if(!student) return res.status(404).json( { message: 'Estudiante no encontrado' } );
    
    const token = jwt.sign({ n_control: student.n_control }, process.env.JWTOKEN || 'development', {
        expiresIn: 60 * 60 * 24
    });

    res.cookie('auth-token', token, { httpOnly: true, secure: true }).json().end();

}

export async function getStudent(req: Request, res: Response) {
    const student = await Estudiante.findOne( {
        where: {
            n_control: req.n_control
        }
    } )
    if(!student) return res.status(404).json( { message: 'Estudiante no encontrado' } );
    res.json(student).end();
}