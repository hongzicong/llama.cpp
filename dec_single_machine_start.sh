#echo "master server 1"
#$(./server -m  models/7B/ggml-model-f16.gguf -c 2048 --port 8080 --hostfile examples/server/multihosts -np 2 -cb) &
#sleep 1
#echo "slave server 2"
#$(./server -m  models/7B/ggml-model-f16.gguf -c 2048 --port 8081 --hostfile examples/server/multihosts -np 2 -cb) &
#sleep 1
#echo "slave server 3"
#$(./server -m  models/7B/ggml-model-f16.gguf -c 2048 --port 8082 --hostfile examples/server/multihosts -np 2 -cb) &
#echo "slave server 4"
#$(./server -m  models/7B/ggml-model-f16.gguf -c 2048 --port 8083 --hostfile examples/server/multihosts -np 2 -cb) &

# script read config file and start dis server

if [ $# -eq 0 ]; then
  echo "No arguments provides."
  exit 1
fi

while IFS=' ' read -r key value || [[ -n "$key" ]]; do
  IFS=':' read -ra parts <<< "$value"
#  echo "ip:" ${parts[0]}
#  echo "port:" $((${parts[1]}))

  host=${parts[0]}
  port=$((${parts[1]}))

  if [ "$host" == "$1" ]; then
    $(./server -m  models/7B/ggml-model-f16.gguf -c 2048 --host $host --port $port --hostfile examples/server/multihosts -np 2 -cb) &
  fi
done < ~/桌面/llama_cpp/new3/llama.cpp/examples/server/multihosts


#  $(./server -m  models/7B/ggml-model-f16.gguf -c 2048 --host $host--port $port --hostfile examples/server/multihosts -np 2 -cb) &
#done < examples/server/multihosts


