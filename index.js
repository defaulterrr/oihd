const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const config = require('config');

const usersC = require('./routes/users');
const rolesC = require('./routes/roles');
const statusC = require('./routes/status');
const categoryC = require('./routes/categories');
const newsC = require('./routes/news');

const app = express();
app.use(cors(config.get('corsOptions')));
app.use(helmet());
app.use(express.json());

app.get('/ping', (req,res) => {
    res.status(200).json({
        "message":"pong"
    })
});
app.use(usersC);
app.use(rolesC);
app.use(statusC);
app.use(newsC);
app.use(categoryC);

app.listen('5000');