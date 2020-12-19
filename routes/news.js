const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/news';
const table = "news";

router.get(prefix, async (_, res) => {
    try {
        const roles = await pool.query(`
        select
        news_id,
        news_title as name,
        categories.category_name as category,
        users.users_id as createdby,
        news_createdat as date,
        status.status_label as status,
        roles.roles_name as permission,
        news_content as content
        from ${table}
        inner join users on ${table}.news_createdby = users.users_id
        inner join categories on ${table}.news_category = categories.category_id
        inner join status on ${table}.news_status = status.status_id
        inner join roles on ${table}.news_permission = roles.roles_id
        ;`);
        return res.status(200).json(roles.rows);
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            message: e.message
        });
    }
})

router.post(prefix, async (req, res) => {
    try {
        const { name, category, createdby, permission, content, status } = req.body;
        const response = await pool.query(`insert into ${table} 
        (news_title, news_category, news_createdby, news_createdat, news_status, news_permission, news_content)
        values
        (
            $1,
            (select category_id from categories where category_name = $2),
            $3,
            NOW(),
            (select status_id from status where status_label=$4),
            (select roles_id from roles where roles_name=$5),
            $6
            )`,
            [name, category, createdby, status, permission, content]);
        return res.status(200).json({
            message: "Строка добавлена"
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            message: e.message
        });
    }
})

router.put(prefix + "/:id", async (req, res) => {
    try {
        const { id } = req.params;

        const { name, category, createdby, status, permission, content } = req.body;
        const response = await pool.query(`
        update ${table} set
        (news_title, news_category, news_createdby, news_createdat, news_status, news_permission, news_content) =
        (
            $1,
            (select category_id from categories where category_name = $2),
            $3,
            NOW(),
            (select status_id from status where status_label=$4),
            (select roles_id from roles where roles_name=$5),
            $6
            ) 
            where news_id=$7`,
            [name, category, createdby, status, permission, content, id]);
        return res.status(200).json({
            message: "Строка обновлена"
        });
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            message: e.message
        });
    }
})

router.delete(prefix + "/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const response = await pool.query(`delete from ${table} where news_id=$1`, [id]);
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