import { Request, Response } from 'express'

export const Teste = async(req: Request, res: Response) => {
    res.send('Hello World!')
}