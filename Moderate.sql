--Q1.Write query to return the email, first name, last name, & Genre of all Rock Music 
--listeners. Return your list ordered alphabetically by email starting with A

select DISTINCT email,first_name,last_name
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

--Q2.Let's invite the artists who have written the most rock music in our dataset. Write a 
--query that returns the Artist name and total track count of the top 10 rock bands

select artist.name,artist.artist_id, COUNT(artist.name) AS no_of_songs
from track
JOIN album ON album.album_id = track.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
Group BY artist.artist_id
ORDER BY no_of_songs desc
limit 10;

--Q3. Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the 
--longest songs listed first

select name, milliseconds
from track
WHERE milliseconds >(
	SELECT AVG(milliseconds)
	FROM track )
ORDER BY milliseconds desc;
--created dynamically so that in future it automatically calculate teh average value






