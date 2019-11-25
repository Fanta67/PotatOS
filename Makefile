build-container:
	docker build -t potatos .

stack:
	docker run -it --rm --name potatoes --mount type=bind,source=`pwd`,target=/potatos potatos

test: build-container
	bfg9k run tests/*

report: test
	bfg9k report

ci-test:
	docker run --rm --name potatoes --mount type=bind,source=`pwd`,target=/potatos potatos make report