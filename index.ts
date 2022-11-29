import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
import bodyParser from 'body-parser';
import routes from "./routes";

dotenv.config();

// @ts-ignore
BigInt.prototype.toJSON = function() { return this.toString() }

const app: Express = express();
const port = process.env.PORT;
app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)

app.get('/', (req: Request, res: Response) => {
    res.send('Express + TypeScript Server1');
});
app.use('/api', routes);

app.listen(port, () => {
    console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
});
