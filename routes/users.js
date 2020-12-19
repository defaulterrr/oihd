const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/users';
const table = "users";

router.get(prefix, async (_, res) => {
    try {
        const users = await pool.query(`select * from ${table};`);
        return res.status(200).json(users.rows);
    } catch (e) {
        return res.status(500).json(e);
    }
})

router.post(prefix, async (req,res) => {
    try {
        const { name, role } = req.body;
        const response = await pool.query(`insert into ${table} (users_name, users_role) values ($1,$2)`,[name,role]);
        return res.status(200).json(response.rows);
    } catch (e) {
        return res.status(500).json(e);
    }
})

router.put(prefix+"/:id", async (req,res) => {
    try {
        const {id} = req.params;
        const {name, role} = req.body;
        const response = await pool.query(`update ${table} set (users_name,users_role) = ($1,$2) where users_id=$3`,[name,role,id]);
        return res.status(200).json(response.rows);
    } catch (e) {
        return res.status(500).json(e);
    }
})

router.delete(prefix+"/:id", async (req,res) => {
    try {
        const {id} = req.params;
        const response = await pool.query(`delete from ${table} where users_id=$1`,[id]);
        return res.status(200).json(response.rows);
    } catch (e) {
        return res.status(500).json(e);
    }
})

module.exports = router;