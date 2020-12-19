const { Router } = require('express');
const pool = require('../db/db');
const router = Router();
const prefix = '/comments';
const table = "comments";

router.get(prefix, async (_, res) => {
    try {
        const roles = await pool.query(`
        select * from ${table}
        inner join news on news.news_id = ${table}.comments_news_id
        inner join users on users.users_id = ${table}.comments_created_by
        ;`);
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
        const {news_title,news_category,news_createdby,news_permission,news_content,news_status} = req.body;
        console.log({news_title,news_category,news_createdby,news_permission,news_content});
        const response = await pool.query(`insert into ${table} 
        (news_title,news_category,news_createdby,news_createdat,news_status,news_permission,news_content) 
        values 
        ($1,$2,$3,NOW(),$4,$5,$6)`,[news_title,news_category,news_createdby,news_status,news_permission,news_content]);
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

        const {news_title,news_category,news_createdby,news_permission,news_content,news_status} = req.body;
        console.log({news_title,news_category,news_createdby,news_permission,news_content});
        const response = await pool.query(`update ${table} set
        (news_title,news_category,news_createdby,news_createdat,news_status,news_permission,news_content) 
        =
        ($1,$2,$3,NOW(),$4,$5,$6) where news_id=$7`,[news_title,news_category,news_createdby,news_status,news_permission,news_content,id]);
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
        const response = await pool.query(`delete from ${table} where news_id=$1`,[id]);
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