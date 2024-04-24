


import { prop, getModelForClass, ReturnModelType, modelOptions } from "@typegoose/typegoose"; 


// allowMixed

@modelOptions( { options: { allowMixed: 0 } } )
class Post {

    @prop( { unique: true } ) 
    public postId: number | undefined;

    @prop( { required: true } )
    public object?: Object;

    public static async getNextNumber(this: ReturnModelType<typeof Post> ) {

        const post = await this.findOne().sort({ postId: -1 }).exec();
        if(post && post.postId) {
            const nextNumber =  post ? post.postId + 1 : 1;
            return nextNumber;
        }

        return 1;
    }
}

export default getModelForClass(Post);