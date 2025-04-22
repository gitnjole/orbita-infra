## What is this?

Here you will find two files, `docker-compose.yml` and `.env.example`. Both files are needed to get navidrome running.

### docker-compose

The docker compose file is obscured for security purposes. Instead of hardcoding values, use a local .env file instead.

If you're not familiar with Navidrome's docker config, you can also follow their [guide](https://www.navidrome.org/docs/installation/docker/).

You'll notice there are also 2 different services, `music` and  `demo`. If you don't want to have a demo navidrome site running, you can just delete the entire service and run only `music`.

### .env.example

You can create a new .env file or rename the example file. Docker will automatically load values if there is a .env file in the same directory as the compose file. If unsure, find all possible Navidrome environment configuration variables [here](https://www.navidrome.org/docs/usage/configuration-options/) 
