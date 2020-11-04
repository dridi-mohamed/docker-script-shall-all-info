# stepx : get contaiers name
dname=$(docker ps --format "{{.Names}}")
echo "conatiers name :$dname"


# step 2 : take contaiers ID
ID=$(docker ps -q --filter="$name")
echo "containerID is :$ID"

# step 3 : take IP addr
IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $ID)



# port
port=$(docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $ID)
echo "Port is $port"


#log path
logpath=$(docker inspect --format='{{.LogPath}}' $ID)
echo "log path is : $logpath"

# image name
imageName=$(docker inspect --format='{{.Config.Image}}' $ID)
echo "image name : $imageName"
