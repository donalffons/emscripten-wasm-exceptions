Build: `docker build -t test .`

Run: `docker run -it --net=host -v "$(pwd)":"/app/" test`

Visit: `http://localhost:5000/javascript/`
