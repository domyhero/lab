# redis 集群搭建

redis 3.0的集群搭建示例，create-cluster 脚本来自redis源码的utils目录，改了下路径。

## 步骤

编译安装redis：

```shell
$ sh build.sh
```

启动多个redis实例：
```shell
$ ./create-cluster start
Starting 7001
Starting 7002
Starting 7003
Starting 7004
Starting 7005
Starting 7006
```

创建集群，过程中输入 `yes` 确认配置：
```shell
$ ./create-cluster create
>>> Creating cluster
>>> Performing hash slots allocation on 6 nodes...
Using 3 masters:
127.0.0.1:7001
127.0.0.1:7002
127.0.0.1:7003
Adding replica 127.0.0.1:7004 to 127.0.0.1:7001
Adding replica 127.0.0.1:7005 to 127.0.0.1:7002
Adding replica 127.0.0.1:7006 to 127.0.0.1:7003
M: 270379eae7f4da1b62227062d8e4e6b8e1548389 127.0.0.1:7001
   slots:0-5460 (5461 slots) master
M: de8b49c83a82f305881af78277f3b4afdc64b8c6 127.0.0.1:7002
   slots:5461-10922 (5462 slots) master
M: f1a80f94901241c18da5863191fd1368398e1652 127.0.0.1:7003
   slots:10923-16383 (5461 slots) master
S: bc9f5d9b9dde4a670ec5ad35faac7132796969af 127.0.0.1:7004
   replicates 270379eae7f4da1b62227062d8e4e6b8e1548389
S: 9c7079d78c7bcf747cd9b5430aeaa13faf0b408a 127.0.0.1:7005
   replicates de8b49c83a82f305881af78277f3b4afdc64b8c6
S: 4efb51eb2ca5b5884d6e1e18efc7e82183b36fb5 127.0.0.1:7006
   replicates f1a80f94901241c18da5863191fd1368398e1652
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join.
>>> Performing Cluster Check (using node 127.0.0.1:7001)
M: 270379eae7f4da1b62227062d8e4e6b8e1548389 127.0.0.1:7001
   slots:0-5460 (5461 slots) master
   1 additional replica(s)
M: de8b49c83a82f305881af78277f3b4afdc64b8c6 127.0.0.1:7002
   slots:5461-10922 (5462 slots) master
   1 additional replica(s)
S: 9c7079d78c7bcf747cd9b5430aeaa13faf0b408a 127.0.0.1:7005
   slots: (0 slots) slave
   replicates de8b49c83a82f305881af78277f3b4afdc64b8c6
M: f1a80f94901241c18da5863191fd1368398e1652 127.0.0.1:7003
   slots:10923-16383 (5461 slots) master
   1 additional replica(s)
S: 4efb51eb2ca5b5884d6e1e18efc7e82183b36fb5 127.0.0.1:7006
   slots: (0 slots) slave
   replicates f1a80f94901241c18da5863191fd1368398e1652
S: bc9f5d9b9dde4a670ec5ad35faac7132796969af 127.0.0.1:7004
   slots: (0 slots) slave
   replicates 270379eae7f4da1b62227062d8e4e6b8e1548389
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

停止：
```shell
$ ./create-cluster stop
Stopping 7001
Stopping 7002
Stopping 7003
Stopping 7004
Stopping 7005
Stopping 7006
```

清除数据：
```shell
$ ./create-cluster clean
```





