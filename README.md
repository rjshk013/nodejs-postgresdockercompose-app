# nodejs-postgresdockercompose-app

1.run the app locally on your machine
------------------------------------------

clone the repo

go to folder addressbook

    To start the application:

$ npm start

Check the new application on http://localhost:3000

To start the application with pm2:

$ npm run pm2


Running Postgres With Docker

With Docker, we can run any pre-packaged application in seconds. Look how easy it is to run a PostgreSQL database:

$ docker run -it -p 5432:5432 postgres

Docker will download a PostgreSQL image and start it on your machine with the 5432 port mapped to your local network.

Now, with the database running, open a new terminal and execute the migrations to create the table:

$ npm run migrate

The application should be fully working now:

$ npm run pm2

the database tests should be passing now:
npm run test


We’re almost there. To run our container locally, we need to do two things:

    Build the container:

$ docker build -t addressbook .

    Run the container:

$ docker run -it -p 3000:3000 addressbook

After this you can see that new image is created as 

Successfully built ac5646c47d74
Successfully tagged addressbook:latest

check your application is working 

go to http://localhost:3000/persons/all

you will connection error with database.We will fix this issue by using docker compose 


Now remove the created addressbook image as docker rmi -f addressbook:latest otherwise if we run docker compose again it will create one more image

--------------------------------------------------------------------------------------------------------------------------------------------------------


    Run the migration script inside the container. This will build the Docker image, create a persistent volume for the data, and create the table:

$ docker-compose run addressbook npm run migrate

    And finally, start Docker Compose:

$ docker-compose up

Open a new terminal and try running the database tests inside the container:

$ docker-compose run addressbook npm test


now check the application is connecting with database 

http://localhost:3000/persons/all

reference : https://semaphoreci.com/community/tutorials/dockerizing-a-node-js-web-application
