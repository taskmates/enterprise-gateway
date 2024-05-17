.PHONY: docker_build

docker_build:
	DOCKER_BUILDKIT=1 docker build -f Dockerfile -t enterprise-gateway --progress=plain .

.PHONY: docker_run

docker_run:
	docker run -it --rm -p 10100:10100 enterprise-gateway


.PHONY: install

install:
	poetry install


.PHONY: run

run:
	poetry run jupyter enterprisegateway --port=10100 --EnterpriseGatewayApp.list_kernels=True
