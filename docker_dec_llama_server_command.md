# 1. download model
```bash
e.g., include llama (Mixtral-8x7B-Instruct-v0.1.gguf)
```
# 2. make docker image
```bash
sudo docker build -t dec-llama-server -f dec-server.Dockerfile .
```
# 3.0. modify server/multihosts
```bash
master 127.0.0.1:8080 -> master 0.0.0.0:8080
```
# 3.1. run docker contrainer (llama dec-server)
```bash
sudo docker run -it --rm   --add-host host.docker.internal:host-gateway -v /path/to/models:/models -v /path/to/server:/server -p 8080:8080  dec-llama-server:latest "./server -m  /models/7B/ggml-model-f16.gguf -c 2048 --host 127.0.0.1 --port 8081 --hostfile /server/multihosts & ./server -m /models/7B/ggml-model-f16.gguf -c 2048 --host 127.0.0.1 --port 8082 --hostfile /server/multihosts & ./server -m  /models/7B/ggml-model-f16.gguf -c 2048 --host 0.0.0.0 --port 8080 --hostfile /server/multihosts"
* e.g., /path/to/models: /home/lenovo/桌面/llama_cpp/single/llama.cpp/models
* e.g., /path/to/server: /home/lenovo/桌面/llama_cpp/make_613/llama.cpp/examples/server 
* image_name: dec-llama-server:latest  
* llama.gguf: /models/7B/ggml-model-f16.gguf (note: it appears 3 times in the voriable)
```
