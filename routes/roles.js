const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/roles';
const table = "roles";

router.get(prefix, async (_, res) => {
    try {
        const roles = await pool.query(`
        select
            roles_id, 
            roles_name as name, 
            roles_permissions as permissions
            from ${table};
        `);
        return res.status(200).json(roles.rows);
    } catch (e) {
        return res.status(500).json({ message: e.message });
    }
})

router.post(prefix, async (req, res) => {
    try {
        const { name, permissions } = req.body;
        const response = await pool.query(`insert into ${table} (roles_name, roles_permissions) values ($1,$2)`, [name, permissions]);
        return res.status(200).json({ message: 'Строка добавлена' });
    } catch (e) {
        return res.status(500).json({ message: e.message });
    }
})

router.put(prefix + "/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { name, permissions } = req.body;
        const response = await pool.query(`update ${table} set (roles_name,roles_permissions) = ($1,$2) where roles_id=$3`, [name, permissions, id]);
        return res.status(200).json({ message: 'Строка обновлена' });
    } catch (e) {
        return res.status(500).json({ message: e.message });
    }
})

router.delete(prefix + "/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const response = await pool.query(`delete from ${table} where roles_id=$1`, [id]);
        return res.status(200).json({ message: 'Строка удалена' });
    } catch (e) {
        return res.status(500).json({ message: e.message });
    }
})

module.exports = router;