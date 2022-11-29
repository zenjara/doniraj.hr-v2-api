import express from 'express';
import cityRouter from './city'
import organizationRouter from './organization'

const router = express.Router()

router.use('/cities', cityRouter);
router.use('/organizations', organizationRouter);

export default router;
