import express from 'express';

const router = express.Router()
import {index} from '../../app/controllers/organization.controller';

router.get('/',  index)

export default router;
