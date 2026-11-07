const {validationResult}=require('express-validator');
const {fail}=require('../utils/respond');
module.exports=(req,res,next)=>{const errors=validationResult(req);if(!errors.isEmpty())return fail(res,'Please check the submitted information.',422,errors.array().map(e=>({field:e.path,message:e.msg})));next();};
