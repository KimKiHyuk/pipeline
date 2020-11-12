## Infra

> data warehouse (gcs, bigquery)
```
$ terraform workspace new warehouse
$ terraform init data_warehouse
$ terraform apply data_warehouse
$ terraform destroy data_warehouse
```

---

> data processor (hdfs, spark)
```
$ terraform workspace new proc
$ terraform init data_proc
$ terraform apply data_proc
$ terraform destroy data_proc
```