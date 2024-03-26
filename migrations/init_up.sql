-- Create database tables
CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "points" integer,
  "username" varchar NOT NULL UNIQUE,
  "hashedpass" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT current_timestamp
);

CREATE TABLE "stashes" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "body" text,
  "points" integer,
  "owner_id" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT current_timestamp,
  "is_public" bool NOT NULL
);

CREATE TABLE "links" (
  "id" serial PRIMARY KEY,
  "url" text NOT NULL,
  "comment" text,
  "stash_id" integer NOT NULL
);

CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "author" integer NOT NULL,
  "body" text NOT NULL,
  "stash_id" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT current_timestamp
);

-- Add relations
ALTER TABLE "stashes" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");
ALTER TABLE "links" ADD FOREIGN KEY ("stash_id") REFERENCES "stashes" ("id");
ALTER TABLE "comments" ADD FOREIGN KEY ("stash_id") REFERENCES "stashes" ("id");
ALTER TABLE "comments" ADD FOREIGN KEY ("author") REFERENCES "users" ("id");

