import('dotenv').then((dotenv) => dotenv.config());

import Express from 'express';

// import routes

import UserRoutes from './routes/UserRoutes';

// setup

const app = Express();
app.use(Express.json());

// routes

app.use(UserRoutes);

// initialize app

app.listen(process.env.PORT, () => {
	console.log('Server running!', process.env.PORT);
});
