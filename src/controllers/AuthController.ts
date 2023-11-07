import { Request, Response } from 'express';
import AuthService from '../services/AuthService';

export default {
	auth,
};

async function auth(request: Request, response: Response) {
	try {
		const { username, password } = request.body;

		const getAuth = await AuthService.auth({ username, password });

		return response.send(getAuth);
	} catch (error) {
		return response.send({
			status: 'error',
			message: error,
		});
	}
}
