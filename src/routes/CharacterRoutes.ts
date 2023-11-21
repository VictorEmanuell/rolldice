import { Router } from 'express';

import CharacterController from '../controllers/CharacterController';

import AuthMiddleware from '../middlewares/AuthMiddleware';

const router = Router();

router
	.route('/character')
	.post(AuthMiddleware, CharacterController.create)
	.get(AuthMiddleware, CharacterController.get)
	.put(AuthMiddleware, CharacterController.update)
	.delete(AuthMiddleware, CharacterController.drop);

export default router;
