const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/status';
const table = "status";

router.get(prefix, async (_, res) => {
    try {
        const roles = await pool.query(`
            select 
            status_id,
            status_label as name
            from ${table};
        `);
        return res.status(200).json(roles.rows);
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.post(prefix, async (req, res) => {
    try {
        const { name } = req.body;
        const response = await pool.query(`insert into ${table} (status_label) values ($1)`, [name]);
        return res.status(200).json({
            message: "Строка добавлена"
        });
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.put(prefix + "/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { name } = req.body;
        const response = await pool.query(`update ${table} set status_label = $1 where status_id=$2`, [name, id]);
        return res.status(200).json({
            message: "Строка обновлена"
        });
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.delete(prefix + "/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const response = await pool.query(`delete from ${table} where status_id=$1`, [id]);
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