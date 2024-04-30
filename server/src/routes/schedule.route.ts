import { Router } from 'express';
import { validateToken } from '../middleware/validate';
import { get } from '../controller/schedule.controller';

const router = Router();


router.get('/', validateToken, get);


export default router;