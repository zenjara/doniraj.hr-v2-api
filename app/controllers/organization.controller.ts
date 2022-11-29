import {Request, Response} from 'express'
import {PrismaClient} from '@prisma/client'
import type {Organization} from '@prisma/client'

const prisma = new PrismaClient()

export async function index(req: Request, res: Response) {
    const organizations: Organization[] = await prisma.organization.findMany({
        orderBy: [
            {
                highlighted: 'desc',
            },
            {
                name: 'asc',
            },
        ],
        where: {verified: true}, include: {
            city: {select: {name: true}}
        }
    });
    // res.status(201)
    // return res.json(serializeResponse(organizations));
    return res.json(organizations);
}

