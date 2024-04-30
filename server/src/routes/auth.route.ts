import { Router } from "express";
import { getStudent, login } from "../controller/auth.controller";
import { validateToken } from "../middleware/validate";

const router = Router();


router.post('/login',  login  )
router.get('/', validateToken, getStudent)

export default router;