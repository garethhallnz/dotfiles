## To install run

`./install.sh`

`./installPHP.sh`

`./installLocalDev.sh`

## Switch to zsh
`chsh -s $(which zsh) && gnome-session-quit`


# Other notes
You can symlink config to flatpak for example

`cd /home/gareth/.var/app/rest.insomnia.Insomnia/config`

`ln -s /home/gareth/.config/Insomnia Insomnia
`

---

To link and app image to launcher

`/usr/share/applications`

`sudo ln -s /home/GarethData/Apps/Outline-Manager/Outline-Manager.desktop Outline-Manager.desktop`


---

# How to where data saves data
Stop the Docker daemon:
```
sudo systemctl stop docker
```
Create the new directory where you want to store Docker data. For example:
```
sudo mkdir /new/docker/directory
```
Edit the Docker daemon configuration file. The location of the file depends on your operating system. For example, on Ubuntu, the file is located at /etc/docker/daemon.json. If the file does not exist, you need to create it.
```
sudo vim /etc/docker/daemon.json
```
Add the following line to the file, replacing /new/docker/directory with the path to your new directory:
```json
{
  "data-root": "/new/docker/directory"
}
```
Save the changes and exit the text editor.

Start the Docker daemon:
```
sudo systemctl start docker
```
That's it! Docker should now use the new directory to store images and containers. You can verify this by running the docker info command and looking for the Docker Root Dir setting.