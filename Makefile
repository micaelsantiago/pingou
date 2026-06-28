.PHONY: up down build restart logs ps

up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build

restart: down up

logs:
	docker compose logs -f

ps:
	docker compose ps

artisan:
	docker compose exec php php artisan $(filter-out $@,$(MAKECMDGOALS))

migrate:
	docker compose exec php php artisan migrate

migrate-fresh:
	docker compose exec php php artisan migrate:fresh --seed

npm:
	docker compose exec node npm $(filter-out $@,$(MAKECMDGOALS))

composer:
	docker compose exec php composer $(filter-out $@,$(MAKECMDGOALS))

test:
	docker compose exec php php artisan test

test-web:
	docker compose exec node npm run

shell-php:
	docker compose exec php bash

shell-node:
	docker compose exec node sh

shell-postgres:
	docker compose exec postgres psql -U root -d backend

shell-redis:
	docker compose exec redis redis-cli

octane-reload:
	docker compose exec php php artisan octane:reload

seed:
	docker compose exec php php artisan db:seed

setup: up
	docker compose exec php php artisan key:generate
	$(MAKE) migrate
	@echo "✓ Ambiente pronto em http://localhost"

%:
	@:
