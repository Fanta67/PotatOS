build-container:
	docker build -t potatos .

stack:
	docker run -it --rm --name potatoes --mount type=bind,source=`pwd`,target=/potatos potatos