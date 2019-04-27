create view view1 as select a.Hashtags,b.Open_date,b.Title,b.Country,b.Screen_name from
project.hashtag as a
inner join
project.movies as b on
a.M_names =b.Title;
/*view 1 */

create view view2 as SELECT  a.Screen_name,  a.Followers, a.Friends_count, a.tweets_count, b.Title FROM project.movie_tw_info as a
inner join project.movies as b
on a.Screen_name = b.Screen_name
order by a.Followers desc
; /*View 2 */

create view view3 as SELECT  * FROM project.movies where Open_date  like '%May%'
; /*View 3*/

create view view4 as select a.* ,b.*from project.cast as a 
inner join project.movies as b
on a.Movie = b.Title 
where name = 'Robert Downey Jr.' ;
/*View 4 */

create view view5 as select movie,links from project.ytb_links
where movie like '%Avenger%';
/*View 5 */

create view view6 as select count(*) from project.movies
where Open_date like '%May%';
/*View 6 */