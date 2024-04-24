import express, { Application } from 'express'
import cookieParser from 'cookie-parser';
import cors from 'cors'
import fs from 'fs';
import https from 'https';

const app: Application = express();

app.use(express.static(__dirname));
app.use(express.urlencoded({extended: false}))
app.set('trust proxy', 1)
app.use(cookieParser());
app.use(express.json())

app.use(cors({
    origin: ['http://127.0.0.1:*', 'http://127.0.0.1:5500', "http://localhost:5500", "http://localhost:80", "http://localhost:*"],
    methods: ["GET", "POST", "DELETE", "PUT"],
    credentials: true,
    exposedHeaders: ['token'],
}));

/*
let privateKey  = fs.readFileSync('./privkey.pem');
let certificate = fs.readFileSync('./fullchain.pem');

let credentials = {key: privateKey, cert: certificate};

const httpsServer = https.createServer(credentials, app);
httpsServer.listen(9875);

*/
export default app;





