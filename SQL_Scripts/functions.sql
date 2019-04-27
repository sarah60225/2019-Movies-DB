DELIMITER //
CREATE FUNCTION Counttag(tags TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE count INT;
SELECT COUNT(*)
INTO count
FROM project.hashtag
where Hashtags like concat('%',tags,'%');
RETURN count;
end;//
DELIMITER ;

select project.Counttag('Action');

DELIMITER //
CREATE FUNCTION Search(movies TEXT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
DECLARE ct_movies TEXT;
SELECT count(*)
INTO ct_movies
FROM project.movies
where Title = movies;
IF ct_movies IS NULL THEN RETURN FALSE;
ELSEIF ct_movies > 0 THEN RETURN TRUE;
ELSE RETURN FALSE;
END IF;
end;//
DELIMITER ;

select project.Search('Avengers: Endgame');

DELIMITER //
CREATE FUNCTION Matches(g text)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE ct_g INT;
SELECT COUNT(*)
INTO ct_g
FROM project.reddit
where title like concat('%',g,'%');
RETURN ct_g;
end;//
DELIMITER ;

select Matches("Avengers");

DELIMITER //
CREATE FUNCTION SearchTimeBefore(time text)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE ct_date INT;
SELECT count(*)
INTO ct_date
FROM project.reddit
where timestamp < time;
RETURN ct_date;
end;//
DELIMITER ;

select SearchTimeBefore('2019-04-01 14:02:29');

DELIMITER //
CREATE FUNCTION Search_Cast(Cast TEXT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
DECLARE ct_cast TEXT;
SELECT count(*)
INTO ct_cast
FROM project.cast
where Name = cast;
IF ct_cast IS NULL THEN RETURN FALSE;
ELSEIF ct_cast > 0 THEN RETURN TRUE;
ELSE RETURN FALSE;
END IF;
end;//
DELIMITER ;

select Search_Cast('Robert Downey Jr.');

DELIMITER //
CREATE FUNCTION Count_movies_productedby_studio(m TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE count INT;
SELECT COUNT(*)
INTO count
FROM project.studio
where studio like concat('%',m,'%');
RETURN count;
end;//
DELIMITER ;

select project.Count_movies_productedby_studio('Warner Bros.');