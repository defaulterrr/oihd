const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/comments';
const table = "comments";

router.get(prefix, async (_, res) => {
    try {
        const roles = await pool.query(`
        select 
            comments_id as id,
            comments_news_id as newsid,
            comments_created_at as createdAt,
            comments_created_by as createdBy,
            content,
            news.news_title as title,
            users.users_name as owner
        from ${table}
        inner join news on news.news_id = ${table}.comments_news_id
        inner join users on users.users_id = ${table}.comments_created_by
        ;`);
        // const roles = await pool.query('select * from comments;')
        return res.status(200).json(roles.rows);
    } catch (e) {
        console.log(e);
        return res.status(500).json({
            message: e.message
        });
    }
})

router.post(prefix, async (req,res) => {
    try {
        const {news_id, created_by, content} = req.body;
        const response = await pool.query(`insert into ${table} 
        (comments_news_id,comments_created_at,comments_created_by,content) 
        values 
        ($1, NOW(),$2,$3)`,[news_id, created_by,content]);
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

router.put(prefix+"/:id", async (req,res) => {
    try {
        const {id} = req.params;
        const {news_id, created_by,content} = req.body;
        const response = await pool.query(`update ${table} set
        (comments_news_id, comments_created_by,content) 
        =
        ($1,$2,$3) where comments_id=$4`,[news_id, created_by,content,id]);
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

router.delete(prefix+"/:id", async (req,res) => {
    try {
        const {id} = req.params;
        const response = await pool.query(`delete from ${table} where comments_id=$1`,[id]);
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