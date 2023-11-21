import { Request, Response } from 'express';
import CharacterService from '../services/CharacterService';

export default {
	create,
	get,
	update,
	drop,
};

async function create(request: Request, response: Response) {
	try {
		const { user_id } = request.query;
		const characterData = request.body;

		const createCharacter = await CharacterService.create({ user_id, ...characterData });

		return response.send(createCharacter);
	} catch (error) {
		return response.send({
			status: 'error',
			message: error,
		});
	}
}

async function get(request: Request, response: Response) {
	try {
		//
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
