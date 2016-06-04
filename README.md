# Laravel + Docker Compose dev environment

## Install

1. Clone repo
2. Change `MYSQL_ROOT_PASSWORD` in `docker-compose.yml`
3. `docker-compose up -d`
4. `bin/composer create-project --prefer-dist laravel/laravel`
    * __NOTE:__ (don't specify a target directory; `bin/composer`'s working directory is already `app`)
5. Change `DB_PASSWORD` in your `app/.env` (or `app/config/database.php`, I guess) to match step 2.
6. `docker-compose port web 80`
7. `http://[Docker Machine's IP]:[web service public port]`
