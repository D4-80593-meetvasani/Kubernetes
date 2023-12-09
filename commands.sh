               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek88s]
 vasani   main -  sudo minikube status                          
[sudo] password for vasani: 
E1209 14:15:09.788936    5434 status.go:260] status error: host: state: unknown state "minikube": docker container inspect minikube --format={{.State.Status}}: exit status 1
stdout:


stderr:
Error response from daemon: No such container: minikube
E1209 14:15:09.788968    5434 status.go:263] The "minikube" host does not exist!
minikube
type: Control Plane
host: Nonexistent
kubelet: Nonexistent
apiserver: Nonexistent
kubeconfig: Nonexistent

               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek88s]
 ✘  vasani   main -  minikube start --driver=docker  
        
😄  minikube v1.32.0 on Ubuntu 22.04
✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🤷  docker "minikube" container is missing, will recreate.
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
❗  This container is having trouble accessing https://registry.k8s.io
💡  To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
🐳  Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek88s]
 vasani   main -   minikube status            
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek88s]
 vasani   main -  kubectl get pods    
No resources found in default namespace.
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek88s]
 vasani   main -  docker container exec -it minikube bash


root@minikube:/# docker image ls
REPOSITORY                                TAG       IMAGE ID       CREATED         SIZE
<none>                                    <none>    a6ca7b52a415   2 weeks ago     168MB
registry.k8s.io/kube-apiserver            v1.28.3   537434729123   7 weeks ago     126MB
registry.k8s.io/kube-scheduler            v1.28.3   6d1b4fd1b182   7 weeks ago     60.1MB
registry.k8s.io/kube-controller-manager   v1.28.3   10baa1ca1706   7 weeks ago     122MB
registry.k8s.io/kube-proxy                v1.28.3   bfc896cf80fb   7 weeks ago     73.1MB
registry.k8s.io/etcd                      3.5.9-0   73deb9a3f702   6 months ago    294MB
registry.k8s.io/coredns/coredns           v1.10.1   ead0a4a53df8   10 months ago   53.6MB
registry.k8s.io/pause                     3.9       e6f181688397   14 months ago   744kB
gcr.io/k8s-minikube/storage-provisioner   v5        6e38f40d628d   2 years ago     31.5MB
root@minikube:/# docker image pull meetvasani/dynform
Using default tag: latest
latest: Pulling from meetvasani/dynform
1f7ce2fa46ab: Already exists 
424de2a10000: Already exists 
6d9a0131505f: Already exists 
5728e491734b: Already exists 
20d3235e84ad: Already exists 
6f51c2e8bf42: Pull complete 
Digest: sha256:3fbb2fc4926c7af9a75cc27a3ad99504a7a952b36ddd97c70f16310aceb05455
Status: Downloaded newer image for meetvasani/dynform:latest
docker.io/meetvasani/dynform:latest
root@minikube:/# docker image ls
REPOSITORY                                TAG       IMAGE ID       CREATED         SIZE
meetvasani/dynform                        latest    8a03a817e09f   20 hours ago    168MB
<none>                                    <none>    a6ca7b52a415   2 weeks ago     168MB
registry.k8s.io/kube-apiserver            v1.28.3   537434729123   7 weeks ago     126MB
registry.k8s.io/kube-scheduler            v1.28.3   6d1b4fd1b182   7 weeks ago     60.1MB
registry.k8s.io/kube-controller-manager   v1.28.3   10baa1ca1706   7 weeks ago     122MB
registry.k8s.io/kube-proxy                v1.28.3   bfc896cf80fb   7 weeks ago     73.1MB
registry.k8s.io/etcd                      3.5.9-0   73deb9a3f702   6 months ago    294MB
registry.k8s.io/coredns/coredns           v1.10.1   ead0a4a53df8   10 months ago   53.6MB
registry.k8s.io/pause                     3.9       e6f181688397   14 months ago   744kB
gcr.io/k8s-minikube/storage-provisioner   v5        6e38f40d628d   2 years ago     31.5MB
root@minikube:/# exit
exit
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 ✘  vasani   main -  kubectl create -f pod1.yaml

pod/pod1 created
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  kubectl get pods           
NAME   READY   STATUS    RESTARTS   AGE
pod1   1/1     Running   0          8s
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  kubectl describe pod pod1     
Name:             pod1
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Sat, 09 Dec 2023 14:30:52 +0530
Labels:           name=frontend
Annotations:      <none>
Status:           Running
IP:               10.244.0.10
IPs:
  IP:  10.244.0.10
Containers:
  container1:
    Container ID:   docker://15ffdac2dd21ed7e7ea2ea1b89b853e0574bdfe655fa4888b3b1aa49c1fef759
    Image:          meetvasani/dynform
    Image ID:       docker-pullable://meetvasani/dynform@sha256:3fbb2fc4926c7af9a75cc27a3ad99504a7a952b36ddd97c70f16310aceb05455
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Sat, 09 Dec 2023 14:30:59 +0530
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-22bsk (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-22bsk:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  31s   default-scheduler  Successfully assigned default/pod1 to minikube
  Normal  Pulling    30s   kubelet            Pulling image "meetvasani/dynform"
  Normal  Pulled     25s   kubelet            Successfully pulled image "meetvasani/dynform" in 5.48s (5.48s including waiting)
  Normal  Created    24s   kubelet            Created container container1
  Normal  Started    24s   kubelet            Started container container1
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  minikube ssh                  
docker@minikube:~$ curl http://10.244.0.10:80
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css    "
    />
    <title>Document</title>
  </head>

  <body class="bg-dark text-light">
    <div class="text-warning text-center mt-3" id="alert"></div>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-12">
          <div class="p-2 border mt-5 rounded">
            <div class="text-center bg-success-primary rounded">
              Registration Form
            </div>
            <div class="mx-auto p-2">
              <label class="form-label">Name</label>
              <input
                class="form-control"
                id="name"
                type="text"
                placeholder="Your name"
                aria-label="default input example"
                onkeydown="blockNumbers(event)"

              />
            </div>
            <div class="mx-auto p-2">
              <label class="form-label">Age</label>
              <input
                class="form-control"
                id="age"
                type="text"
                placeholder="Your age"
                aria-label="default input example"
              />
            </div>
            <div class="mx-auto p-2">
              <label class="form-label">Phone Number</label>
              <input
                class="form-control"
                id="pno"
                type="text"
                placeholder="Your Number"
                aria-label="default input example"
              />
            </div>
            <div class="mx-auto p-2">
              <label class="form-label">Email address</label>
              <input
                type="email"
                id="email"
                class="form-control"
                placeholder="abc@gmail.com"
              />
            </div>
            <div class="text-center">
              <div class="d-inline col-3 mx-auto">
                <button
                  type="button"
                  id="register"
                  class="btn btn-outline-success btn-lg"
                  onclick="register()"
                >
                  Register
                </button>
              </div>
              <div class="d-inline col-3 mx-auto">
                <button
                id="delete"
                  type="button"
                  class="btn btn-outline-danger btn-lg"
                  onclick="del()"
                >
                  Delete
                </button>
              </div>
              <div class="d-inline col-3 mx-auto">
                <button
                  type="button"
                  class="btn btn-outline-primary btn-lg"
                  onclick="update()"
                >
                  Update
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-md-8 col-12 mt-5">
          <div class="table-responsive">
            <table class="table table-dark table-striped">
              <thead>
                <th scope="col"></th>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">Phone Number</th>
                <th scope="col">Email</th>
                <th scope="col"></th>
              </thead>
              <tbody id="myBody" class=""></tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script>
    function register() {
      var refToMyBody = document.getElementById("myBody");
      var refToName = document.getElementById("name");
      var refToAge = document.getElementById("age");
      var refToPhoneNumber = document.getElementById("pno");
      var refToEmail = document.getElementById("email");

      if (
        refToName.value === "" ||
        refToAge.value === "" ||
        refToPhoneNumber.value === "" ||
        refToEmail.value === ""
      ) {
        document.getElementById("alert").innerText =
          "All the fields are required !";
        return;
      }

      if (isNaN(refToAge.value) || parseFloat(refToAge.value) <= 0) {
        document.getElementById("alert").innerText =
          "Please enter a valid age !";

        return;
      }

      if (
        isNaN(refToPhoneNumber.value) ||
        refToPhoneNumber.value.length != 10
      ) {
        document.getElementById("alert").innerText =
          "Please enter a valid Phone Number !";
        return;
      }

      var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      if (!emailPattern.test(refToEmail.value)) {
        document.getElementById("alert").innerText =
          "Please enter a valid Email address !";
        return;
      }

      refToMyBody.innerHTML =
        refToMyBody.innerHTML +
        `<tr>
        <td><input class="form-check-input" type="checkbox" ></td>
        <td>${refToName.value}</td>
        <td>${refToAge.value}</td>
        <td>${refToPhoneNumber.value}</td>
        <td>${refToEmail.value}</td>
        <td><button class="btn btn-outline-primary btn-sm" onclick="editRow(this)">Edit</button></td>
        </tr>`;

      document.getElementById("alert").innerText = "Data added successfully!";
      refToName.value = "";
      refToAge.value = "";
      refToPhoneNumber.value = "";
      refToEmail.value = "";
    }

    function del() {
      debugger;
      var myBody = document.getElementById("myBody");
      var rows = myBody.rows.length;
      // console.log(rows);
      // console.log(myBody.rows[0].cells[0].children[0].checked)
      debugger; 
      if (rows > 0) {
        for (var i = rows - 1; i >= 0; i--) {
          if (myBody.rows[i].cells[0].children[0].checked) {
            myBody.deleteRow(i);
            document.getElementById("alert").innerText =
              "Data deleted successfully!";
              return;
          }else{
              document.getElementById("alert").innerText = "select atleast one row to delete !";
          }
        }
      } else {
        document.getElementById("alert").innerText = "No rows to delete !";
       
      }
    }

    let editedRow = null;

    function editRow(button) {
      editedRow = button.closest("tr");

      const cells = editedRow.cells;
      // console.log(cells[1].innerText);
      // console.log(cells[1].textContent);
      document.getElementById("name").value = cells[1].textContent;
      document.getElementById("age").value = cells[2].textContent;
      document.getElementById("pno").value = cells[3].textContent;
      document.getElementById("email").value = cells[4].textContent;

      document.getElementById("register").disabled = true;
      document.getElementById("delete").disabled = true;
    }

    function blockNumbers(event) {
      var keyPressed = event.key;

      if (!/^[a-zA-Z\s-,'.]+$/.test(keyPressed)) {
        event.preventDefault();
        document.getElementById("alert").innerText = "Numbers are not allowed !  ";
      } else {
        document.getElementById("alert").innerText = "";
      }
    }

    function update() {
      if (editedRow === null) {
        document.getElementById("alert").innerText = "Select atleast one row to update !";
        return;
      }

      var refToName = document.getElementById("name");
      var refToAge = document.getElementById("age");
      var refToPhoneNumber = document.getElementById("pno");
      var refToEmail = document.getElementById("email");

      if (
        refToName.value === "" ||
        refToAge.value === "" ||
        refToPhoneNumber.value === "" ||
        refToEmail.value === ""
      ) {
        document.getElementById("alert").innerText = "All fields are required!";
        return;
      }

      if (isNaN(refToAge.value) || parseFloat(refToAge.value) <= 0) {
        document.getElementById("alert").innerText =
          "Please enter a valid age!";
        return;
      }

      if (
        isNaN(refToPhoneNumber.value) ||
        refToPhoneNumber.value.length != 10
      ) {
        document.getElementById("alert").innerText =
          "Please enter a valid Phone Number!";
        return;
      }

      var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      if (!emailPattern.test(refToEmail.value)) {
        document.getElementById("alert").innerText =
          "Please enter a valid Email address!";
        return;
      }

      // console.log(editedRow.cells[1].innerText);
      // console.log(editedRow.cells[1].textContent);

      editedRow.cells[1].textContent = refToName.value;
      editedRow.cells[2].textContent = refToAge.value;
      editedRow.cells[3].textContent = refToPhoneNumber.value;
      editedRow.cells[4].textContent = refToEmail.value;

      document.getElementById("alert").innerText = "Data updated successfully!";

      refToName.value = "";
      refToAge.value = "";
      refToPhoneNumber.value = "";
      refToEmail.value = "";
      editedRow = null;

      document.getElementById("register").disabled = false;
      document.getElementById("delete").disabled = false;
    }
  </script>
</html>
docker@minikube:~$ exit
logout

 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  kubectl delete pod pod1  
pod "pod1" deleted
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  kubectl create -f pod1.yaml  

pod/pod1 created
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  kubectl get svc                 

NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   2d
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  kubectl create -f service1.yaml 

service/myservice created
               
 [/media/vasani/Sunbeam/1Sunbeam-modules/sdm/deploySitek8s]
 vasani   main -  minikube service myservice

|-----------|-----------|-------------|---------------------------|
| NAMESPACE |   NAME    | TARGET PORT |            URL            |
|-----------|-----------|-------------|---------------------------|
| default   | myservice |          80 | http://192.168.49.2:32403 |
|-----------|-----------|-------------|---------------------------|
🎉  Opening service default/myservice in default browser...
/snap/core20/current/lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.29' not found (required by /lib/x86_64-linux-gnu/libproxy.so.1)
Failed to load module: /home/vasani/snap/code/common/.cache/gio-modules/libgiolibproxy.so
Opening in existing browser session.                                                                                  
               