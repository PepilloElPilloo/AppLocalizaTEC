import { Router } from "express";

//import { PostController } from "../controllers/Post.controller";

import { create, getAll, get, update, remove } from "../controller/Post.controller";

const router = Router();



router.post("/", create);
router.get("/", getAll);
router.get("/:postId", get);
router.put("/:postId", update);
router.delete("/:postId", remove);



export default router;
