# Cluster definition format (v4)

When creating a new cluster or obtaining details on a cluster via the API, the Cluster Definition format described here is used as a format for requests and responses.

## Sparse creation {#sparse-create}

When creating a new cluster, most fields of the cluster definition, e. g. the number of worker nodes, the memory size, or the disk size, are optional. For missing fields, default values are assumed.

Currently there is no technical way to obtain information on applied defaults. Please contact Giant Swarm via `support@giantswarm.io` to find out about current default values.

## Example

The following example contains an entire cluster definition in JSON format, as it may be obtained from the API.

__Note:__ upon cluster creation, some of the attributes shown below MUST NOT be set. Other attributes MAY be ommitted (see [Sparse creation](#sparse-create) above). Find details in the API documentation for the specific operation.

```json
{
    "id": "wqtlq",
    "create_date": "2017-03-03T10:50:45.949270905Z",
    "api_endpoint": "https://api.wqtlq.example.com",
    "name": "Just a Standard Cluster",
    "kubernetes_version": "v1.5.2_coreos.0",
    "owner": "acme",
    "workers": [
        {
            "memory": {"size_gb": 2},
            "storage": {"size_gb": 20},
            "cpu": {"cores": 4},
            "labels": {
                "beta.kubernetes.io/arch": "amd64",
                "beta.kubernetes.io/os": "linux",
                "ip": "10.3.11.2",
                "kubernetes.io/hostname": "worker-1.x882ofna.k8s.gigantic.io",
                "nodetype": "hicpu"
            }
        },
        {
            "memory": {"size_gb": 8},
            "storage": {"size_gb": 20},
            "cpu": {"cores": 2},
            "labels": {
                "beta.kubernetes.io/arch": "amd64",
                "beta.kubernetes.io/os": "linux",
                "ip": "10.3.62.2",
                "kubernetes.io/hostname": "worker-2.x882ofna.k8s.gigantic.io",
                "nodetype": "hiram"
            }
        }
    ]
}
```

## Attribute details

- `id`: Identifier of the cluster, unique with the system.
- `create_date`: Date and time when the cluster has been created.
- `api_endpoint`: URI to access the Kubernetes API of the cluster.
- `name`: User friendly name of the cluster
- `kubernetes_version`: Kubernetes version of the cluster. The string reported here may also contain additional details and thus may not be machine-interpretable.
- `owner`: Name of the organization owning the cluster.
- `workers`: Array of worker definition objects. Each array item represents one worker node. In order to create a cluster with three worker nodes, this array MUST have three items, even if all worker share the same configuration.
- `workers[n].memory`: Memory definition object. This object can currently contain only one attribute `size_gb`, which indicates the RAM size in Gigabytes as an integer.
- `workers[n].storage`: Storage definition object. Storage here refers to the local disk storage of a worker node. The definition object can currently contain only one attribute `size_gb`, which indicates the local storage size in Gigabytes as an integer.
- `workers[n].cpu`: CPU definition object. This object may (only) contain the attribute `cores`, indicating the number of CPU cores for the given worker node.
- `workers[n].labels`: Object representing the worker labels.
