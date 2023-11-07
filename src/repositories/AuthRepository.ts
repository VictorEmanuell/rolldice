import { prisma } from '../database';

export default {
	get,
};

async function get(username: string) {
	try {
		const getHash = await prisma.user_Auth.findFirst({
			where: {
				username: {
					equals: username,
				},
			},
		});

		return getHash.password_hash;
	} catch (error) {
		return 'error';
	}
}
