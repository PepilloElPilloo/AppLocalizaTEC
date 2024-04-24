import { Request, Response } from "express";
import Post from "../models/Post";


export async function create(req: Request, res: Response) {
    
    const data = req.body;
    if(!data) return res.status(400).json({ message: "Se requiere información al enviar" });
    const nextId = await Post.getNextNumber();

    const post = new Post({
        postId: nextId,
        object: data
    });
    

    

    await post.save();    
    res.status(200).json( {
        postId: nextId,
        data,
        message: "Post creado exitosamente "
    
    } );
}

export async function getAll(req: Request, res: Response) {
    const posts = await Post.find();
    res.status(200).json(posts);
}

export async function get(req: Request, res: Response) {

    if(!req.params.postId) return res.status(400).json({ message: "PostId es requerido" });
    const post = await Post.findOne( { postId: Number(req.params.postId) } );
    res.status(200).json(post);
}

export async function update(req: Request, res: Response) {
    if(!req.params.postId) return res.status(400).json({ message: "PostId es requerido" });
    if(!req.body) return res.status(400).json({ message: "Se requiere información al enviar" });
    const post = await Post.findOne( { postId: Number(req.params.postId) } );
    if(!post) return res.status(404).json({ message: "Post no encontrado" });
    post.object = req.body;
    await post.save();
    res.status(200).json( {
        message: "Post actualizado exitosamente",
        post
    } );
}

export async function remove(req: Request, res: Response) {
    if(!req.params.postId) return res.status(400).json({ message: "PostId es requerido" });
    const post = await Post.findOne( { postId: Number(req.params.postId) } ); 
    if(!post) return res.status(404).json({ message: "Post no encontrado" });
    await post.deleteOne();
    res.status(200).json( {
        message: "Post eliminado exitosamente",
        postId: req.params.postId,
    } );
}





