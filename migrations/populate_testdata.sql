-- Insert some test data
INSERT INTO users (username, hashedpass)
VALUES
  ('ary82', 'hashedpass_ary82'),
  ('test', 'hashedpass_test'),
  ('demo', 'hashedpass_demo');

INSERT INTO stashes (title, body, owner_id, is_public)
VALUES
  ('Top places to learn golang', 'The best places to learn golang', '1', 'true'),
  ('Postgresql resources', 'This contains resources to learn PostgreSQL database', '2', 'false');

INSERT INTO links (url, stash_id)
VALUES
  ('https://go.dev', '1'),
  ('https://gobyexample.com/', '1'),
  ('https://www.postgresql.org/', '2'),
  ('https://www.postgresql.org/docs/', '2');

INSERT INTO comments (author, body, stash_id)
VALUES
  ('1', 'Go.dev has everything', '1'),
  ('2', 'great list 10/10', '1'),
  ('3', 'Good one', '1'),
  ('1', 'Postgresql official docs the best huh', '2');
