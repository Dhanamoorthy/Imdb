-- Table: Movies
CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    -- Other movie-related fields like director, plot, etc.
);
=> this query is used to create a table in database base on movies and release date.

-- Table: Genres
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);
=> this query is used to create a table in database base on Genres .


-- Table: MovieGenres (Many-to-Many relationship between Movies and Genres)
CREATE TABLE MovieGenres (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
=> this query is used to create a table in database base on Moviesgenres .


-- Table: Media
CREATE TABLE Media (
    media_id SERIAL PRIMARY KEY,
    media_type ENUM ('Video', 'Image') NOT NULL,
    media_url VARCHAR(255) NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

=> this query is used to create a table in database base on media.

-- Table: Reviews
CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    movie_id INT NOT NULL,
    user_id INT NOT NULL,
    review_text TEXT NOT NULL,
    rating FLOAT NOT NULL,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
=> this query is used to create a table in database base on Reviews.

-- Table: Artists
CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    -- Other artist-related fields like bio, date_of_birth, etc.
);

=> this query is used to create a table in database base on Artists.

-- Table: ArtistSkills (Many-to-Many relationship between Artists and Skills)
CREATE TABLE ArtistSkills (
    artist_id INT NOT NULL,
    skill VARCHAR(50) NOT NULL,
    PRIMARY KEY (artist_id, skill)
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);
=> this query is used to create a table in database base on ArtistSkills.

-- Table: Performances (For storing artist roles in movies)
CREATE TABLE Performances (
    performance_id SERIAL PRIMARY KEY,
    artist_id INT NOT NULL,
    movie_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

=> this query is used to create a table in database base on Performances.