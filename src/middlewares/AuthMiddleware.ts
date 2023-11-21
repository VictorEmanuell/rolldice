import { Request, Response, NextFunction } from 'express';
import { jwtVerify, importX509 } from 'jose';

import AuthConstants from '../constants/AuthConstants';

const firebaseProjectId = process.env.FIREBASE_PROJECT_ID;

export default async function (request: Request, response: Response, next: NextFunction) {
	try {
		const tokenHeader = request.headers['authorization'];
		const token = tokenHeader && tokenHeader.split(' ')[1];

		const { user_id } = request.query;

		if (!token) {
			return response.send({
				status: 'error',
				message: AuthConstants.authUnauthorized,
			});
		}

		let publicKeys;

		const getPublicKeys = async () => {
			if (publicKeys) {
				return publicKeys;
			}
			const res = await fetch(
				'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com'
			);
			publicKeys = await res.json();
			return publicKeys;
		};

		const verifyFirebaseJwt = async (firebaseJwt) => {
			const publicKeys = await getPublicKeys();
			const decodedToken = await jwtVerify(
				firebaseJwt,
				async (header) => {
					const x509Cert = publicKeys[header.kid];
					const publicKey = await importX509(x509Cert, 'RS256');
					return publicKey;
				},
				{
					issuer: `https://securetoken.google.com/${firebaseProjectId}`,
					audience: firebaseProjectId,
					algorithms: ['RS256'],
				}
			);
			return decodedToken.payload;
		};

		try {
			const tokenData = await verifyFirebaseJwt(token);

			if (user_id && tokenData.user_id != user_id) {
				return response.send({
					status: 'error',
					message: AuthConstants.authInvalidToken,
				});
			}

			next();
		} catch (error) {
			return response.send({
				status: 'error',
				message: AuthConstants.authInvalidToken,
			});
		}
	} catch (error) {
		return {
			status: 'error',
			message: error,
		};
	}
}
