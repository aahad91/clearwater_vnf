# clearwater_vnf
PG-Backflip candidate VNF (VoIP)
##Installation
Step1: Clone the repo
```bash
git clone https://github.com/aahad91/clearwater_vnf.git
```
Step2: Installation of Weave Scope for Visualization of interconnectivity between containers
```bash
sudo curl -L git.io/scope -o /usr/local/bin/scope
sudo chmod a+x /usr/local/bin/scope
sudo scope launch
#to view it open the web browser to http://localhost:4040 
```
Step3: Build the Base Image
```bash
cd clearwater_vnf/cw-base
sudo docker build -t aahad91/cw-base .
```
Step4: Build all the required Images
```bash
cd ..
# make sure you have docker & docker-compose installed
sudo docker-compose build
```
Step5: Running the VNF
```bash
sudo docker-compose up -d
#after some time open the weave scope, all the contianers will be visible with the connections.
```
