import bcrypt from 'bcrypt';

import UserRepository from '../repositories/UserRepository';
import UserConstants from '../constants/UserConstants';

interface IMethodsReturn {
	status: 'error' | 'success';
	message: string;
	data?: object;
}

interface ICreateUserProps {
	id: string;
	name: string;
	email: string;
}

interface IGetUserProps {
	user_id: string;
}

export default {
	create,
	get,
	update,
	drop,
};

async function create({ id, name, email }: ICreateUserProps): Promise<IMethodsReturn> {
	try {
		if (id && name && email) {
			const createUserInDB = await UserRepository.create({ id, name, email });

			if (createUserInDB === 'success') {
				return {
					status: 'success',
					message: UserConstants.userCreateSuccess,
				};
			} else {
				return {
					status: 'error',
					message: UserConstants.userCreateError,
				};
			}
		} else {
			return {
				status: 'error',
				message: UserConstants.userCreateNullInput,
			};
		}
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}

async function get({ user_id }: IGetUserProps): Promise<IMethodsReturn> {
	try {
		//
		return {
			status: 'success',
			message: 'Success',
		};
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}

async function update(): Promise<IMethodsReturn> {
	try {
		//
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}

async function drop(): Promise<IMethodsReturn> {
	try {
		//
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}
