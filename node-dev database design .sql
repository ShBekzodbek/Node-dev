CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "name" varchar(30),
  "bio" varchar(400),
  "avatar" varchar(200),
  "phone" varchar(25),
  "email" varchar(40),
  "password" varchar(50),
  "status" varchar(15),
  "roles" ENUM
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar(50),
  "image" varchar(100),
  "created_at" timestamp,
  "updated_at" timestamp,
  "content" varchar(500),
  "url" varchar(200),
  "user_id" integer
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "updated_at" timestamp,
  "contents" varchar(240),
  "user_id" integer,
  "post_id" integer
);

CREATE TABLE "likes" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "user_id" integer,
  "comment_id" integer,
  "post_id" integer
);

CREATE TABLE "followers" (
  "id" SERIAL PRIMARY KEY,
  "created_at" timestamp,
  "leader_id" integer,
  "follower_id" integer
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("comment_id") REFERENCES "comments" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("leader_id") REFERENCES "users" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("follower_id") REFERENCES "followers" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles") REFERENCES "users" ("created_at");
