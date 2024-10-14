## Troubleshooting performance with iostat
> Basic usage

### CPU Metrics

```
iostat -c
```

| Metric | Description | Good Performance | Bad Performance |
|--------|-------------|------------------|-----------------|
|`%user`|Time spent on user processes|**< 50%** (Balanced Workload)|**> 70% **(CPU-bound, may need optimization)|
|`%system`|Time spent on kernel tasks|**< 30%**|**> 50% **(Too many system calls or I/O operations)|
|`%iowait`|Time spent waiting for I/O|**< 5%**|**> 10%** (I/O bottleneck, storage too slow)|
|`%idle`|CPU time doing nothing|**> 70%**|**< 20%** (CPU overloaded)|

### Disk Metrics

```
iostat -x
```

| Metric | Description | Good Performance | Bad Performance |
|--------|-------------|------------------|-----------------|
| `r/s`|Reads per second| Depends on workload (higher is fine)| Sudden spike without known cause may indicate a problem|
| `w/s`|Writes per second| Depends on workload (higher is fine)| Unexpected high write rates may signal misbehaving processes|
| `rkB/s`|Kilobytes read per second| Matches normal workload| Too low or too high may indicate bottlenecks or anomalies|
| `wkB/s`|Kilobytes written per second| Matches normal workload| Excessive writes may degrade disk performance|
| `await`|Average wait time for I/O (ms) | **< 10 ms** | **> 20 ms** (I/O bottleneck or overloaded disk)|
| `svctm`|Average service time per I/O request (ms)| **< 10 ms**| **> 20 ms** (Storage struggling to handle requests)|
| `%util`|Percentage of time the device is busy | **< 60%** | **> 80%** (Disk saturated, may need tuning)|


#### Repeat metrics

```
iostat [option] [seconds interval] [time to repeat metrics]
```

More info
```
man iostat
```
