const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/categories';
const table = "categories";

router.get(prefix, async (_, res) => {
    try {
        const roles = await pool.query(`select * from ${table};`);
        return res.status(200).json(roles.rows);
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.post(prefix, async (req,res) => {
    try {
        const {category_name} = req.body;
        const response = await pool.query(`insert into ${table} (category_name) values ($1)`,[category_name]);
        return res.status(200).json({
            message: "Строка добавлена"
        });
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.put(prefix+"/:id", async (req,res) => {
    try {
        const {id} = req.params;
        const {category_name} = req.body;
        const response = await pool.query(`update ${table} set category_name = $1 where category_id=$2`,[category_name,id]);
        return res.status(200).json({
            message: "Строка обновлена"
        });
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.delete(prefix+"/:id", async (req,res) => {
    try {
        const {id} = req.params;
        const response = await pool.query(`delete from ${table} where category_id=$1`,[id]);
        return res.status(200).json({
            message: "Строка удалена"
        });
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

module.exports = router;