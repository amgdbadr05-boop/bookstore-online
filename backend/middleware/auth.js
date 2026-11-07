const {fail}=require('../utils/respond');
exports.requireAdmin=(req,res,next)=>{if(!req.session?.admin)return fail(res,'Authentication required. Please sign in.',401);if(req.session.admin.role!=='admin')return fail(res,'Administrator access required.',403);next();};
