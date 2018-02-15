
#echo "api-config"
#docker run -it -v unfetter_api-config:/data -v /tmp/backup/:/backup alpine tar -xvf /backup/api-config.tar -C /data/ .

#echo "socket-config"
#docker run -it -v unfetter_socket-config:/data -v /tmp/backup/:/backup alpine tar -xvf /backup/socket-config.tar -C /data/ .

echo "certs"
docker run -it -v unfetter_certs:/data -v /tmp/backup:/backup alpine tar -xvf /backup/cert.tar -C /data/ .


echo "copy mongo"
docker run -it -v unfetter_data-backup:/data -v /tmp/backup/:/backup alpine cp /backup/mongo.archive /data/mongo.archive

echo "restore mongo"
docker exec -it cti-stix-store-repository mongorestore --host localhost --archive=/data/backup/mongo.archive