USE bookstore_db;

INSERT IGNORE INTO categories (name) VALUES
('Fiksi'),('Pengembangan Diri'),('Bisnis'),('Teknologi'),('Pendidikan'),('Sejarah'),('Sastra'),('Anak & Remaja');

-- Seed 20 sample titles. Re-running this file skips titles already present.
INSERT INTO books (category_id, title, author, price, stock, description, image_url)
SELECT c.category_id, v.title, v.author, v.price, v.stock, v.description, v.image_url
FROM (
 SELECT 'Laut Bercerita' AS title, 'Leila S. Chudori' AS author, 98000 AS price, 24 AS stock, 'Novel tentang persahabatan, keluarga, kehilangan, dan perjuangan pada masa penuh gejolak.' AS description, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=700' AS image_url, 'Sastra' AS category
 UNION ALL SELECT 'Filosofi Teras','Henry Manampiring',89000,18,'Pengantar filsafat Stoa untuk menghadapi kehidupan modern dengan lebih jernih.','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=700','Pengembangan Diri'
 UNION ALL SELECT 'Atomic Habits','James Clear',125000,30,'Panduan praktis membangun kebiasaan baik melalui perubahan kecil yang konsisten.','https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=700','Pengembangan Diri'
 UNION ALL SELECT 'The Psychology of Money','Morgan Housel',119000,16,'Pelajaran tentang perilaku, keputusan, dan hubungan manusia dengan uang.','https://images.unsplash.com/photo-1519682337058-a94d519337bc?w=700','Bisnis'
 UNION ALL SELECT 'Clean Code','Robert C. Martin',285000,9,'Prinsip dan praktik menulis kode yang mudah dibaca, dirawat, dan dikembangkan.','https://images.unsplash.com/photo-1532012197267-da84d127e765?w=700','Teknologi'
 UNION ALL SELECT 'Bumi Manusia','Pramoedya Ananta Toer',110000,13,'Kisah Minke tentang pendidikan, kolonialisme, dan pencarian martabat manusia.','https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=700','Sastra'
 UNION ALL SELECT 'Sapiens','Yuval Noah Harari',169000,11,'Tinjauan luas tentang perjalanan manusia dari masa purba hingga dunia modern.','https://images.unsplash.com/photo-1513001900722-370f803f498d?w=700','Sejarah'
 UNION ALL SELECT 'Matematika Itu Asyik','N. S. Rahma',65000,20,'Buku pengayaan matematika dengan pendekatan ringan dan contoh sehari-hari.','https://images.unsplash.com/photo-1509228468518-180dd4864904?w=700','Pendidikan'
 UNION ALL SELECT 'The Little Prince','Antoine de Saint-Exupéry',78000,14,'Dongeng filosofis tentang persahabatan, kasih sayang, dan cara memandang dunia.','https://images.unsplash.com/photo-1519682337058-a94d519337bc?w=700','Anak & Remaja'
 UNION ALL SELECT 'Laskar Pelangi','Andrea Hirata',99000,22,'Kisah persahabatan sepuluh anak Belitung yang berjuang meraih pendidikan dan mimpi.','https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=700','Fiksi'
 UNION ALL SELECT 'Negeri 5 Menara','Ahmad Fuadi',95000,17,'Perjalanan enam santri yang belajar tentang disiplin, persahabatan, dan cita-cita.','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=700','Fiksi'
 UNION ALL SELECT 'Perahu Kertas','Dewi Lestari',105000,15,'Novel tentang Kugy dan Keenan, dua anak muda yang mengejar mimpi dan cinta.','https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=700','Fiksi'
 UNION ALL SELECT 'Hujan','Tere Liye',89000,21,'Novel tentang ingatan, kehilangan, persahabatan, dan pilihan di tengah perubahan dunia.','https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=700','Fiksi'
 UNION ALL SELECT 'Rindu','Tere Liye',99000,12,'Kisah perjalanan panjang yang mempertemukan lima penumpang dengan pertanyaan hidup.','https://images.unsplash.com/photo-1513001900722-370f803f498d?w=700','Fiksi'
 UNION ALL SELECT 'Rich Dad Poor Dad','Robert T. Kiyosaki',115000,19,'Pengenalan tentang literasi keuangan, aset, kewajiban, dan cara berpikir mengenai uang.','https://images.unsplash.com/photo-1519682337058-a94d519337bc?w=700','Bisnis'
 UNION ALL SELECT 'Deep Work','Cal Newport',135000,10,'Strategi membangun fokus mendalam dan menghasilkan pekerjaan bernilai tinggi.','https://images.unsplash.com/photo-1532012197267-da84d127e765?w=700','Pengembangan Diri'
 UNION ALL SELECT 'The Pragmatic Programmer','David Thomas & Andrew Hunt',310000,7,'Panduan praktik profesional untuk mengembangkan perangkat lunak secara efektif.','https://images.unsplash.com/photo-1532012197267-da84d127e765?w=700','Teknologi'
 UNION ALL SELECT 'A Brief History of Time','Stephen Hawking',145000,8,'Penjelasan populer tentang alam semesta, ruang-waktu, lubang hitam, dan kosmologi.','https://images.unsplash.com/photo-1509228468518-180dd4864904?w=700','Pendidikan'
 UNION ALL SELECT 'How to Win Friends and Influence People','Dale Carnegie',99000,14,'Prinsip komunikasi dan hubungan antarmanusia untuk kehidupan sosial dan profesional.','https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=700','Pengembangan Diri'
 UNION ALL SELECT 'Cantik Itu Luka','Eka Kurniawan',139000,6,'Novel yang merangkai sejarah, keluarga, mitos, dan realitas sosial Indonesia.','https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=700','Sastra'
) AS v
JOIN categories c ON c.name = v.category
LEFT JOIN books existing ON existing.title = v.title
WHERE existing.book_id IS NULL;
