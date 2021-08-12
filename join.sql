-- 1.
SELECT * FROM invoice 
WHERE invoice_id IN(
  SELECT invoice_id FROM invoice_line
  WHERE unit_price = .99);

-- 2.
SELECT invoice_date "date", first_name "first", last_name "last", total
FROM invoice
JOIN customer on customer.customer_id = invoice.invoice_id;

-- 3.
SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
FROM customer JOIN employee
ON customer.support_rep_id = employee.employee_id;

-- 5.
SELECT album.title "Title", artist.name "Name"
FROM album
JOIN artist ON album.artist_id = artist.artist_id;

-- 6.
SELECT playlist_track.track_id 
FROM playlist_track
WHERE playlist_id IN(
 SELECT playlist_id FROM playlist WHERE name = 'Music' 
)
ORDER BY track_id ASC;

-- 7.
SELECT track.name, playlist.playlist_id
FROM track JOIN playlist_track.track_id
ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist.playlist_id = playlist_track.playlist_id;

-- 8.
SELECT track.name "Name", playlist.name "Playlist"
FROM track
JOIN playlist_track 
ON track.track_id = playlist_track.track_id
JOIN playlist 
ON playlist_track.playlist_id = playlist.playlist_id;

-- 9.
SELECT track.name "Name", album.title "Album"
FROM track JOIN album ON track.album_id = album.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Alternative & Punk';
