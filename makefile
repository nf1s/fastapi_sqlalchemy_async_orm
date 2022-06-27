default:
	just --list

setup:
	@pipenv install --dev --pre

run:
	@pipenv run uvicorn main:app --reload

test:
	@pipenv run pytest -s

shell:
	@pipenv shell

db-run:
	@docker run \
		--rm   \
		--name  postgres \
		-p 5432:5432 \
		-e POSTGRES_USER=postgres \
		-e POSTGRES_PASSWORD=postgres \
		-e POSTGRES_DB=postgres \
		-d postgres

db-stop:
	@docker stop postgres

db-shell:
	@docker exec -it postgres psql -U postgres
