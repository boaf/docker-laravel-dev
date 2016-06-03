# Laravel + Docker Compose dev environment

## Install

1. Clone repo
2. Change `MYSQL_ROOT_PASSWORD` in `docker-compose.yml`
3. `docker-compose up -d`
4. Change `DB_PASSWORD` in your `app/.env` (or `app/config/database.php`, I guess) to match step 2.
5. `bin/composer create-project --prefer-dist laravel/laravel app`
6. `docker-compose port web 80`
7. `http://[Docker Machine's IP]:[web service public port]`
