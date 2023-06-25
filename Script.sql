create table if not EXISTS music_genre (
id SERIAL primary key,
music_genre_name VARCHAR(100) not null unique
);

create table if not EXISTS  music_artist (
id SERIAL primary key,
music_artist_name VARCHAR(60) not null unique
);

create table if not exists genre_artist (
music_genre_id integer references music_genre(id),
music_artist_id integer references music_artist(id),
constraint pk primary key (music_artist_id, music_genre_id)
);

create table if not EXISTS  album (
id SERIAL primary key,
album_name VARCHAR(60) not null unique
);

create table if not exists album_artist (
album_id integer references album(id),
music_artist_id integer references music_artist(id),
constraint ps primary key (music_artist_id, album_id)
);

create table if not EXISTS  track (
id SERIAL primary key,
track_name VARCHAR(60) not null unique,
album_id INTEGER references album(id)
);

create table if not EXISTS  collection (
id SERIAL primary key,
collection_name VARCHAR(60) not null unique,
year_of_release INTEGER not NULL
);
create table if not exists collection_track (
collection_id integer references collection(id),
track_id integer references track(id),
constraint pt primary key (collection_id, track_id)
);
