import { Request, Response } from 'express';
import UserService from '../services/UserService';

export default {
	create,
	get,
	update,
	drop
};

async function create(request: Request, response: Response) {
	try {
		const userData = request.body;

		const createUser = await UserService.create(userData);

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
		const { id, username } = request.body;

		const getUser = await UserService.get({ id, username });

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
			message: error
		});
	}
}
