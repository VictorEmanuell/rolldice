import bcrypt from 'bcrypt';

import UserRepository from '../repositories/UserRepository';
import UserConstants from '../constants/UserConstants';

interface IMethodsReturn {
	status: 'error' | 'success';
	message: string;
	data?: object;
}

interface ICreateUserProps {
	username: string;
	name: string;
	password: string;
}

interface IGetUserProps {
	id?: string;
	username?: string;
}

export default {
	create,
	get,
	update,
	drop,
};

async function create({
	username,
	name,
	password,
}: ICreateUserProps): Promise<IMethodsReturn> {
	try {
		if (!username || !name || !password) {
			return {
				status: 'error',
				message: UserConstants.userCreateNullInput,
			};
		}

		const checkUserExist = await UserRepository.get({ type: 'username', key: username });

		if (checkUserExist || checkUserExist === 'error') {
			return {
				status: 'error',
				message: UserConstants.userCreateAlreadyExist,
			};
		}

		const password_hash = await bcrypt.hash(password, 10);

		const createUser = await UserRepository.create({
			username,
			name,
			password_hash,
		});

		if (createUser === 'success') {
			return {
				status: 'success',
				message: UserConstants.userCreateSuccess,
				data: {
					user: {
						username,
						name,
					},
				},
			};
		}

		return {
			status: 'error',
			message: UserConstants.userCreateError,
		};
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}

async function get({ id, username }: IGetUserProps): Promise<IMethodsReturn> {
	try {
		if (id) {
			const user = await UserRepository.get({ type: 'id', key: id });

			if (!user) {
				return {
					status: 'error',
					message: UserConstants.userGetNotFound,
				};
			}

			if (user === 'error') {
				return {
					status: 'error',
					message: UserConstants.userGetError,
				};
			}

			return {
				status: 'success',
				message: UserConstants.userGetSuccess,
				data: { user },
			};
		}

		if (username) {
			const user = await UserRepository.get({ type: 'username', key: username });

			if (!user) {
				return {
					status: 'error',
					message: UserConstants.userGetNotFound,
				};
			}

			if (user === 'error') {
				return {
					status: 'error',
					message: UserConstants.userGetError,
				};
			}

			return {
				status: 'success',
				message: UserConstants.userGetSuccess,
				data: { user },
			};
		}

		return {
			status: 'error',
			message: UserConstants.userGetError,
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
