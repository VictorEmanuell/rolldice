import { prisma } from '../database';

type Classes =
	| 'Arcanista'
	| 'Barbaro'
	| 'Bardo'
	| 'Bucaneiro'
	| 'Cacador'
	| 'Cavaleiro'
	| 'Clerigo'
	| 'Druida'
	| 'Guerreiro'
	| 'Inventor'
	| 'Ladino'
	| 'Lutador'
	| 'Nobre'
	| 'Paladino';

interface ICreateCharacterProps {
	user_id: string;
	name: string;
	class: Classes;
	level: number;
	attributes: {
		strength: number;
		dexterity: number;
		constitution: number;
		intelligence: number;
		wisdom: number;
		charisma: number;
	};
}

interface IGetCharacterProps {
	type: 'id' | 'username';
	key: any;
}

export default {
	create,
	get,
	update,
	drop,
};

async function create(character: ICreateCharacterProps) {
	try {
		await prisma.character
			.create({
				data: {
					user: {
						connect: {
							id: character.user_id,
						},
					},
					name: character.name,
					class: character.class,
					level: character.level,
					strength: character.attributes.strength,
					dexterity: character.attributes.dexterity,
					constitution: character.attributes.constitution,
					intelligence: character.attributes.intelligence,
					wisdom: character.attributes.wisdom,
					charisma: character.attributes.charisma,
				},
			})
			.catch(() => {
				throw 'error';
			});

		return 'success';
	} catch (error) {
		return 'error';
	}
}

async function get({ type, key }: IGetCharacterProps) {
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
