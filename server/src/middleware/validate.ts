import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';


declare module 'express' {
    export interface Request {
        n_control?: string;
    }
}

interface IPayload {
    n_control: string;
    iat: number;
    exp: number;
}



export async function validateToken( req: Request, res: Response, next: NextFunction) {
    const token = req.cookies['auth-token'] || req.headers['auth-token'];
    console.log(token)
    if(!token) return res.status(401).json("Access denied");
    try {
        const payload = jwt.verify(token, process.env.JWTOKEN || 'development') as IPayload
        req.n_control = payload.n_control;
        next()
    } catch (error) {
        console.log(error)
        if(token) return res.clearCookie("auth-token").status(401).json("Access denied");
        return res.status(401);
    }

}