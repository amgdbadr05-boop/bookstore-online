exports.ok=(res,data,message='Request successful',status=200)=>res.status(status).json({success:true,message,data});
exports.fail=(res,message,status=400,details)=>res.status(status).json({success:false,message,...(details?{details}:{})});
