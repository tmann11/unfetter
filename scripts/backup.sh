#echo "api-config"
#docker run -it -v unfetter_api-config:/data -v /tmp/backup/:/backup alpine tar -cvf /backup/api-config.tar -C /data/ .

#echo "socket-config"
#docker run -it -v unfetter_socket-config:/data -v /tmp/backup/:/backup alpine tar -cvf /backup/socket-config.tar -C /data/ .

echo "certs"
docker run -it -v unfetter_certs:/data -v /tmp/backup/:/backup alpine tar -cvf  /backup/cert.tar -C /data/ .

echo "backup mongo"
docker exec -it cti-stix-store-repository mongodump --host localhost --archive=/data/backup/mongo.archive

echo "backup mongo"
docker run -it -v unfetter_data-backup:/data -v /tmp/backup/:/backup alpine cp /data/mongo.archive /backup/mongo.archive