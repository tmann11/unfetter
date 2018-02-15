#echo "api-config"
#docker run -it -v unfetter_api-config:/data -v /tmp/backup/:/backup alpine tar -cvf /backup/api-config.tar -C /data/ .

#echo "socket-config"
#docker run -it -v unfetter_socket-config:/data -v /tmp/backup/:/backup alpine tar -cvf /backup/socket-config.tar -C /data/ .

echo "certs"
tar -cvf  /tmp/backup/cert.tar -C ../certs/ .

echo "backup mongo"
docker exec -it cti-stix-store-repository mongodump --host localhost --archive=/data/db/mongo.archive
cp ../data/db/mongo.archive /tmp/backup
