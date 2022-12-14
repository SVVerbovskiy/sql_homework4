select name_genre, count(musician_id) from music_genre mg 
join genremusician g on mg.id = g.genre_id 
group by name_genre ;

select count(t."name") from track t
join album a on t.album_id = a.id 
where a.year_of_publication >=2019 and a.year_of_publication <= 2020;

select a.name, avg(duration) from album a
join track t on a.id = t.album_id 
group by a.name;

select distinct name from musician m
where name not in (
	select distinct m2.name from musician m2
	join albummusician a on m2.id = a.musician_id
	join album al on a.album_id = al.id
	where year_of_publication = 2020);

select c.name from collection c 
join collectiontrack c2 on c.id = c2.collection_id 
join track t on c2.track_id = t.id 
join album a on t.album_id = a.id 
join albummusician a2 on a.id = a2.album_id 
join musician m on a2.musician_id = m.id 
where m."name" = 'Луи Армстронг';

select a.name from album a 
join albummusician a2 on a.id = a2.album_id
join musician m on a2.musician_id = m.id 
join genremusician g on m.id = g.musician_id 
join music_genre mg on g.genre_id = mg.id
group by a.name
having count(mg.name_genre) > 1
order by a.name; 

select t.name from track t
join collectiontrack ct on t.id = ct.track_id
where ct.track_id is null;

select m.name, t.duration from track t
join album a on a.id = t.album_id
join albummusician am on am.album_id = a.id
join musician m on m.id = am.musician_id
group by m.name, t.duration
having t.duration = (select min(duration) from track)
order by m.name;

select distinct a.name from album a
join track t on t.album_id = a.id
where t.album_id in (
    select album_id from track
    group by album_id
    having count(id) = (
        select count(id) from track
        group by album_id
        order by count
        limit 1
    )
)
order by a.name;








 
