## Data pipeline POC
* kafka connect
* gcp



## Commands
### warehouse
```
$ ksql-datagen quickstart=orders format=avro topic=orders maxInterval=100 iterations=50  // generate data
$ confluent local start // run kafka (single node)
$ confluent local load gcs-sink  -- -d  gcs-sink.properties // register kafka connect
$ confluent local unload gcs-sink // unload
```