const db=require('../config/db');
exports.details=async id=>{const [orders]=await db.query('SELECT * FROM orders WHERE order_id=?',[id]);if(!orders[0])return null;const [items]=await db.query('SELECT oi.*,b.title,b.author,b.image_url FROM order_items oi JOIN books b ON b.book_id=oi.book_id WHERE oi.order_id=?',[id]);return {...orders[0],items};};
