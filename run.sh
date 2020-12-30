docker run --rm -it --net host -p 8888:8888 -v /home1/irteam/seungkikim:/home --name pytorch3d-seungki pytorch3d:latest jupyter notebook /home --allow-root --ip=0.0.0.0
