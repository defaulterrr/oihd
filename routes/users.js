const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/users';
const table = "users";

router.get(prefix, async (_, res) => {
    try {
        const users = await pool.query(`
        select
        users_id,
        users_name as name,
        roles_name as role
        from users
        inner join roles on users.users_role = roles.roles_id;
        `);
        return res.status(200).json(users.rows);
    } catch (e) {
        return res.status(500).json({
            message: e.message
        });
    }
})

router.post(prefix, async (req, res) => {
    try {
        const { name, role } = req.body;
        const response = await pool.query(`
        insert into ${table} 
        (users_name, users_role) 
        values (
            $1,
            (SELECT roles_id FROM roles WHERE roles_name = $2)
            );
        `, [name, role]);
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
        const { name, role } = req.body;
        const response = await pool.query(`
        update ${table} 
        set (users_name,users_role) = 
        (
            $1,
            (SELECT roles_id FROM roles WHERE roles_name = $2)
            ) 
        where users_id=$3;`,
            [name, role, id]);
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
        const response = await pool.query(`delete from ${table} where users_id=$1`, [id]);
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