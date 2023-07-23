-- 1: Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.
SELECT p.title, u.username, c.name AS category
FROM posts p
JOIN users u 
ON p.user_id = u.user_id
JOIN categories c 
ON p.category_id = c.category_id;

--2: En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte alın.
SELECT p.title, u.username, p.creation_date
FROM posts p
JOIN users u 
ON p.user_id = u.user_id
ORDER BY p.creation_date DESC
LIMIT 5;

--3: Her blog yazısı için yorum sayısını gösterin.
SELECT p.title, COUNT(c.comment_id) AS comment_count
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id;

--4: Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin.
SELECT username, email
FROM users;

--5: En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın.
SELECT c.comment, p.title
FROM comments c
JOIN posts p ON c.post_id = p.post_id
ORDER BY c.creation_date DESC
LIMIT 10;

--6: Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun.
SELECT p.title, p.content
FROM posts p
JOIN users u ON p.user_id = u.user_id
WHERE u.username ILIKE 'O%';

--7: Her kullanıcının yazdığı toplam gönderi sayısını alın.
SELECT u.username, COUNT(p.post_id) AS post_count
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id;

--8: Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin.
SELECT c.name, COUNT(p.post_id) AS post_count
FROM categories c
LEFT JOIN posts p ON c.category_id = p.category_id
GROUP BY c.category_id;

--9: Gönderi sayısına göre en popüler kategoriyi bulun.
SELECT c.name, COUNT(p.post_id) AS post_count
FROM categories c
JOIN posts p ON c.category_id = p.category_id
GROUP BY c.category_id
ORDER BY post_count DESC
LIMIT 1;

--10: Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun.
SELECT c.name, SUM(p.view_count) AS total_views
FROM categories c
JOIN posts p ON c.category_id = p.category_id
GROUP BY c.category_id
ORDER BY total_views DESC
LIMIT 1;

--11: En fazla yoruma sahip gönderiyi alın.
SELECT p.title, COUNT(c.comment_id) AS comment_count
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY comment_count DESC
LIMIT 1;

--12: Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin.
SELECT u.username, u.email
FROM users u
JOIN posts p ON u.user_id = p.user_id
WHERE p.post_id = 55;

--13: Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun.
SELECT *
FROM posts p
WHERE p.title LIKE '%as%' OR p.content LIKE '%as%';

--14: Belirli bir kullanıcının en son yorumunu gösterin.
SELECT c.comment, c.creation_date
FROM comments c
JOIN users u ON c.user_id = u.user_id
WHERE u.username = 'ozzy_fullball'
ORDER BY c.creation_date DESC
LIMIT 1;

--15: Gönderi başına ortalama yorum sayısını bulun.
SELECT AVG(comment_count) AS average_comments
FROM (SELECT p.post_id, COUNT(c.comment_id) AS comment_count
      FROM posts p
      LEFT JOIN comments c ON p.post_id = c.post_id
      GROUP BY p.post_id) AS subquery;

--16: Son 30 günde yayınlanan gönderileri gösterin.
SELECT *
FROM posts
WHERE is_published=true AND creation_date >= CURRENT_DATE - INTERVAL '30 days';

--17: Belirli bir kullanıcının yaptığı yorumları alın.
SELECT c.comment, p.title
FROM comments c
JOIN posts p ON c.post_id = p.post_id
JOIN users u ON c.user_id = u.user_id
WHERE u.username = '%fhen_ashy';

--18: Belirli bir kategoriye ait tüm gönderileri bulun.
SELECT p.title, p.content
FROM posts p
JOIN categories c ON p.category_id = c.category_id
WHERE c.name = 'Software';

--19: 5'ten az yazıya sahip kategorileri bulun.
SELECT c.name, COUNT(p.post_id) AS post_count
FROM categories c
LEFT JOIN posts p ON c.category_id = p.category_id
GROUP BY c.category_id
HAVING COUNT(p.post_id) < 5;

--20: Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin. 
SELECT u.username
FROM users u
JOIN posts p ON u.user_id = p.user_id
JOIN comments c ON u.user_id = c.user_id;

--21: En az 2 farklı yazıya yorum yapmış kullanıcıları alın.
SELECT u.username
FROM users u
JOIN comments c ON u.user_id = c.user_id
GROUP BY u.user_id
HAVING COUNT(DISTINCT c.post_id) >= 2;

--22: En az 3 yazıya sahip kategorileri görüntüleyin.
SELECT c.name, COUNT(p.post_id) AS post_count
FROM categories c
JOIN posts p ON c.category_id = p.category_id
GROUP BY c.category_id
HAVING COUNT(p.post_id) >= 3;

--23: 5'ten fazla blog yazısı yazan yazarları bulun.
SELECT u.username, COUNT(p.post_id) AS post_count
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id
HAVING COUNT(p.post_id) > 5;

--24: Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)
SELECT u.email
FROM users u
JOIN posts p ON u.user_id = p.user_id
UNION
SELECT u.email
FROM users u
JOIN comments c ON u.user_id = c.user_id;

--25: Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun. 
SELECT users.username FROM users
WHERE (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.user_id) > 0
AND (SELECT COUNT(*) FROM comments WHERE comments.user_id = users.user_id) = 0;

