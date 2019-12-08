build-container:
	docker build -t potatos .

stack:
	xhost +local: 
	docker run -it --rm --name potatoes --net=host --env="DISPLAY" --volume="${HOME}/.Xauthority:/root/.Xauthority:rw" --mount type=bind,source=`pwd`,target=/potatos potatos

test:
	bfg9k run tests/*

report: test
	bfg9k report

clean:
	bfg9k clean

ci-test: build-container
	docker run --rm --name potatoes --mount type=bind,source=`pwd`,target=/potatos potatos make report