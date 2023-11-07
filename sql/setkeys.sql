ALTER TABLE artists
MODIFY COLUMN sp_artistid VARCHAR(45) PRIMARY KEY;

ALTER TABLE albums
MODIFY COLUMN sp_albumid VARCHAR(45) PRIMARY KEY;

ALTER TABLE albums
MODIFY COLUMN artists_sp_artistid VARCHAR(45);

ALTER TABLE albums
ADD CONSTRAINT fk_artist
FOREIGN KEY (artists_sp_artistid) 
REFERENCES artists(sp_artistid);

ALTER TABLE tracks
MODIFY COLUMN sp_trackid VARCHAR(45) PRIMARY KEY;

ALTER TABLE tracks
MODIFY COLUMN albums_sp_albumid VARCHAR(45);

ALTER TABLE tracks
ADD CONSTRAINT fk_album
FOREIGN KEY (albums_sp_albumid) 
REFERENCES albums(sp_albumid);









