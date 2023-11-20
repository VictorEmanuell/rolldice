import { Request, Response } from 'express';
import UserService from '../services/UserService';

export default {
	create,
	get,
	update,
	drop,
};

async function create(request: Request, response: Response) {
	try {
		const { id, name, email } = request.body;

		const createUser = await UserService.create({ id, name, email });

		return response.send(createUser);
	} catch (error) {
		return response.send({
			status: 'error',
			message: error,
		});
	}
}

async function get(request: Request, response: Response) {
	try {
		const { user_id } = request.body;

		const getUser = await UserService.get({ user_id });

		return response.send(getUser);
	} catch (error) {
		return response.send({
			status: 'error',
			message: error,
		});
	}
}

async function update(request: Request, response: Response) {
	try {
		//
	} catch (error) {
		return response.send({
			status: 'error',
			message: error,
		});
	}
}

async function drop(request: Request, response: Response) {
	try {
		//
	} catch (error) {
		return response.send({
			status: 'error',
			message: error,
		});
	}
}
