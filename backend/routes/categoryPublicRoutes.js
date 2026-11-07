const router=require('express').Router();const c=require('../controllers/bookController');router.get('/',c.categories);module.exports=router;
