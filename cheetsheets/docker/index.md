### Delete

Delete all containers with volumes:

```docker rm -vf $(docker ps -a -q)```

Delete all the images:

```docker rmi -f $(docker images -a -q)```

Remember, you should remove all the containers before removing all the images from which those containers were created.
