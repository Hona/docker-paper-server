# docker-paper-server
A dockerized PaperMC server, with daily/crash auto restarting, made for easier deployment on Debian.

## Usage
First `git clone` this repository. 
Then edit the `env-vars.list` file, and the `buildAndRunDocker.sh` file to edit any paths/options to your needs.

By default the config will use the latest 1.16.2 paper jar, and create server files in `./server`.

To run the server, just execute `./buildAndRunDocker.sh`. The first build time will take a while, as it must pull the JDK etc, consecutive runs will be significantly faster due to caching.
