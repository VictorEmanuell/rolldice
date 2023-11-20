import { prisma } from '../database';

interface ICreateUserProps {
	id: string;
	name: string;
	email: string;
}

interface IGetUserProps {
	type: 'id' | 'username';
	key: any;
}

export default {
	create,
	get,
	update,
	drop,
};

async function create({ id, name, email }: ICreateUserProps) {
	try {
		await prisma.user.create({
			data: {
				id,
				name,
				email,
			},
		});

		return 'success';
	} catch (error) {
		return 'error';
	}
}

async function get({ type, key }: IGetUserProps) {
	try {
		// if (type === 'id') {
		// 	const getUser = await prisma.user.findFirst({
		// 		where: {
		// 			id: {
		// 				equals: key
		// 			},
		// 		},
		// 	});

		// 	return getUser;
		// }

		// if (type === 'username') {
		// 	const getUser = await prisma.user.findFirst({
		// 		where: {
		// 			username: {
		// 				equals: key,
		// 			},
		// 		},
		// 	});

		// 	return getUser;
		// }

		return 'error';
	} catch (error) {
		return 'error';
	}
}

async function update() {
	try {
		//
	} catch (error) {
		return 'error';
	}
}

async function drop() {
	try {
		//
	} catch (error) {
		return 'error';
	}
}
