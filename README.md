# Wordpress Docker Basic Boilerplate

This repository was based on a generated docker configuration from [phpdocker.io](https://phpdocker.io/). This provides a basic starter configuration providing PHP 7.3 and MySQL 5.7 served through NGINX with PHP-FPM. There is also a setup script which downloads the latest version of Wordpress and puts it in the `/public` directory which is the root of the web server. Additional, the setup script will download auto-generated AUTH_KEYS from [https://api.wordpress.org/secret-key/1.1/salt/](https://api.wordpress.org/secret-key/1.1/salt/) and place it in the `public/wp-config-auth-keys.php` file. Also provided is a customized version of a `wp-config.php` file that is preconfigured with the database credentials as well as including the `wp-config-auth-keys.php` file generated in the setup.

## Prerequisites
* Mac/Unix environment (not tested on Windows).
* Latest version of [Docker](https://hub.docker.com/?overlay=onboarding) installed and running.

## Instructions

### Clone this repository and download Wordpress

* Clone the repository with `git clone git@github.com:keithmorris/wordpress-docker-boilerplate.git my-new-wp-site` where `my-new-wp-site` is the name of your new site directory.
* `cd my-new-wp-site` to change into the newly cloned directory.
* Run `./setup.sh` to download the latest version of Wordpress into the `public` directory and generate new auth keys.

### Build and launch the Docker containers

* Build and launch your new environment with Docker compose in the project rood directory with the command `docker-compose up`. Note that this will launch the containers with the logging output directed to your current terminal. To run the command in daemon mode, use the command `docker-compose up -d`
* Open your web browser and go to [http://localhost:8080](http://localhost:8080) to go through the basic setup of your new Wordpress site.

## Accessing MySQL from your desktop

The docker containers themselves communicate through the native service ports provided by the services. To access MySQL from your desktop, the ports have been mapped to external ports. Note that these port mappings may be easily changed to your liking within the `docker-compose.yml` file. Here are the port configurations set by default in the provided `docker-compose.yml` file:

* MySQL: 8082 local -> 3306 container
* NGINX: 8080 local -> 80 container

## Cleanup and gotchas

### Change git repository to your own

You will need to create your own repository in your Github, Bitbucket, Gitlab, etc. system. After creating a new empoty repository, change the origin configuration then push to your own repo.

* Change origin: `git remote set-url origin git@github.com:mygithandle/my-new-wp-site.git`
* Push to your new repo: `git push origin --all`
* Feel free to cleanup the `.gitignore` file to suit your needs.

### Gotchas

If you are new to Docker, there are a few things to be aware of that could cause you issues.

1. If you use the docker command `docker-compose down`, this will remove all the containers as well as their persisted local data which includes they MySQL databases. You can find more info on how to persist this data outside of the container [here](https://stackoverflow.com/questions/39175194/docker-compose-persistent-data-mysql).
2. If you decide to change the port numbers in your `docker-compose.yml` to expose the native ports locally (e.g. `80:80` instead of `8080:80`, you will need to make sure that there is not running local webserver (or other service) running on the same port. Also, if you are managing multiple sites using a similar configuration, you will need to stop all other sites using similar configurations (e.g. `docker-compose stop` within each other project) and only work on one site at a time.

I hope you find this helpful and feel free to shoot me a pull request with any suggested changes or improvements.





