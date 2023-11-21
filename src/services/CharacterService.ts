import CharacterRepository from '../repositories/CharacterRepository';
// import UserConstants from '../constants/UserConstants';

interface IMethodsReturn {
	status: 'error' | 'success';
	message: string;
	data?: object;
}

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
	user_id: string;
}

export default {
	create,
	get,
	update,
	drop,
};

async function create(character: ICreateCharacterProps): Promise<IMethodsReturn> {
	if (!character)
		return {
			status: 'error',
			message: 'error',
		};

	try {
		const createCharacterInDB = await CharacterRepository.create(character);

		if (createCharacterInDB === 'success') {
			return {
				status: 'success',
				message: 'Sucesso!',
			};
		} else {
			return {
				status: 'success',
				message: 'Sucesso!',
			};
		}
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}

async function get({ user_id }: IGetCharacterProps): Promise<IMethodsReturn> {
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
