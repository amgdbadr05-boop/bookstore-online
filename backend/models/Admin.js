const db=require('../config/db');
exports.findByUsername=async username=>{const [r]=await db.query('SELECT * FROM admins WHERE username=?',[username]);return r[0]||null;};
