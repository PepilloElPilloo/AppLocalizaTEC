import { z } from 'zod';

const loginschema= z.object({
    ncontrol: z.string( {
        invalid_type_error: 'Debe de ser un número de control válido',
        required_error: 'El número de control es requerido',
    } ).min(8).max(8),
});




export function validateLogin(data: any) {
    return loginschema.safeParse(data);
}







