.SILENT:run

run: 
	docker network create --attachable custom_network

	docker volume create database
	docker volume create logs

	docker container run -d -p 5432:5432 -v database:/var/lib/postgresql/data:rw -v logs:/var/log/postgresql:rw -e POSTGRES_PASSWORD=mysecretpassword --name database 3.1_database_image
	docker network connect custom_network database
	docker network disconnect bridge database

	docker container create -it --env-file 'Golang image/.env' --name golang 3.2_golang_image
	docker network connect custom_network golang
	docker network disconnect bridge golang
	docker container start golang
	
stop:
	@docker container rm -f database
	@docker container rm -f golang
	@docker network rm custom_network
	
cardinal_stop:
	@docker container rm -f database
	@docker container rm -f golang
	@docker network rm custom_network
	@docker volume rm database
	@docker volume rm logs