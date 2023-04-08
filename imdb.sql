-- 1. Movie should have multiple media(Video or Image)

SELECT m.movie_title, COUNT(*) as media_count
FROM movie m
JOIN media me ON m.movie_id = me.movie_id
WHERE me.media_type IN ('video', 'image')
GROUP BY m.movie_id
HAVING COUNT(*) > 1

-- 2. Movie can belongs to multiple Genre

SELECT m.movie_title, GROUP_CONCAT(g.genre_name) as genre_names
FROM movie m
JOIN movie_genre mg ON m.movie_id = mg.movie_id
JOIN genre g ON mg.genre_id = g.genre_id
GROUP BY m.movie_id
HAVING COUNT(*) > 1

-- 3. Movie can have multiple reviews and Review can belongs to a user

SELECT m.movie_title, u.user_name, r.review_text
FROM movie m
JOIN review r ON m.movie_id = r.movie_id
JOIN user u ON r.user_id = u.user_id
WHERE r.review_text IS NOT NULL
GROUP BY m.movie_id, u.user_id
HAVING COUNT(*) > 1

-- 4. Artist can have multiple skills 

SELECT a.artist_name, GROUP_CONCAT(s.skill_name) as skill_names
FROM artist a
JOIN artist_skill ast ON a.artist_id = ast.artist_id
JOIN skill s ON ast.skill_id = s.skill_id
GROUP BY a.artist_id
HAVING COUNT(*) > 1

--  5. Artist can perform multiple role in a single film
SELECT m.movie_title, a.artist_name, GROUP_CONCAT(r.role_name) as role_names
FROM movie m
JOIN artist_role ar ON m.movie_id = ar.movie_id
JOIN artist a ON ar.artist_id = a.artist_id
JOIN role r ON ar.role_id = r.role_id
GROUP BY m.movie_id, a.artist_id
HAVING COUNT(*) > 1