#!/bin/bash

# check if a parameter is provided
if [ "$#" -ne 1 ]; then
    echo "usage: $0 <number (1-4)>"
    exit 1
fi

PARAM=$1

# validate parameter
if [[ ! "$PARAM" =~ ^[1-4]$ ]]; then
    echo "parameter must be a number between 1 and 4 inclusive"
    exit 1
fi

# define image names
KAFKA_CLUSTER_IMAGE="kafka-cluster-image"
KAFKA_CLIENTS_IMAGE="kafka-clients-image"

# stop and remove existing containers
docker stop kafka-cluster kafka-clients 2>/dev/null
docker rm kafka-cluster kafka-clients 2>/dev/null

# run Kafka cluster and clients containers
docker run --privileged -d --name kafka-cluster \
    --cpus 64 \
    --memory 128g \
    -p 2222:22 \
    -p 19091:19091 \
    -p 19092:19092 \
    -p 19093:19093 \
    -p 19094:19094 \
    -p 19095:19095 \
    -p 19096:19096 \
    -p 19097:19097 \
    -p 19098:19098 \
    -p 19099:19099 \
    -p 19100:19100 \
    -p 19101:19101 \
    -p 19102:19102 \
    -p 19103:19103 \
    -p 19104:19104 \
    -p 19105:19105 \
    -p 19106:19106 \
    -p 19107:19107 \
    -p 19108:19108 \
    -p 19109:19109 \
    -p 19110:19110 \
    -p 19111:19111 \
    -p 19112:19112 \
    -p 19113:19113 \
    -p 19114:19114 \
    -p 19115:19115 \
    -p 19116:19116 \
    -p 19117:19117 \
    -p 19118:19118 \
    -p 19119:19119 \
    -p 19120:19120 \
    -p 19121:19121 \
    -p 19122:19122 \
    -p 19123:19123 \
    -p 19124:19124 \
    -p 19125:19125 \
    -p 19126:19126 \
    -p 19127:19127 \
    -p 19128:19128 \
    -p 19129:19129 \
    -p 19130:19130 \
    -p 19131:19131 \
    -p 19132:19132 \
    -p 19133:19133 \
    -p 19134:19134 \
    -p 19135:19135 \
    -p 19136:19136 \
    -p 19137:19137 \
    -p 19138:19138 \
    -p 19139:19139 \
    -p 19140:19140 \
    -p 19141:19141 \
    -p 19142:19142 \
    -p 19143:19143 \
    -p 19144:19144 \
    -p 19145:19145 \
    -p 19146:19146 \
    -p 19147:19147 \
    -p 19148:19148 \
    -p 19149:19149 \
    -p 19150:19150 \
    -p 19151:19151 \
    -p 19152:19152 \
    -p 19153:19153 \
    -p 19154:19154 \
    -p 19155:19155 \
    -p 19156:19156 \
    -p 19157:19157 \
    -p 19158:19158 \
    -p 19159:19159 \
    -p 19160:19160 \
    -p 19161:19161 \
    -p 19162:19162 \
    -p 19163:19163 \
    -p 19164:19164 \
    -p 19165:19165 \
    -p 19166:19166 \
    -p 19167:19167 \
    -p 19168:19168 \
    -p 19169:19169 \
    -p 19170:19170 \
    -p 19171:19171 \
    -p 19172:19172 \
    -p 19173:19173 \
    -p 19174:19174 \
    -p 19175:19175 \
    -p 19176:19176 \
    -p 19177:19177 \
    -p 19178:19178 \
    -p 19179:19179 \
    -p 19180:19180 \
    -p 19181:19181 \
    -p 19182:19182 \
    -p 19183:19183 \
    -p 19184:19184 \
    -p 19185:19185 \
    -p 19186:19186 \
    -p 19187:19187 \
    -p 19188:19188 \
    -p 19189:19189 \
    -p 19190:19190 \
    -p 19191:19191 \
    -p 19192:19192 \
    -p 19193:19193 \
    -p 19194:19194 \
    -p 19195:19195 \
    -p 19196:19196 \
    -p 19197:19197 \
    -p 19198:19198 \
    -p 19199:19199 \
    -p 19200:19200 \
    -p 19201:19201 \
    -p 19202:19202 \
    -p 19203:19203 \
    -p 19204:19204 \
    -p 19205:19205 \
    -p 19206:19206 \
    -p 19207:19207 \
    -p 19208:19208 \
    -p 19209:19209 \
    -p 19210:19210 \
    -p 19211:19211 \
    -p 19212:19212 \
    -p 19213:19213 \
    -p 19214:19214 \
    -p 19215:19215 \
    -p 19216:19216 \
    -p 19217:19217 \
    -p 19218:19218 \
    -p 19219:19219 \
    -p 19220:19220 \
    -p 19221:19221 \
    -p 19222:19222 \
    -p 19223:19223 \
    -p 19224:19224 \
    -p 19225:19225 \
    -p 19226:19226 \
    -p 19227:19227 \
    -p 19228:19228 \
    -p 19229:19229 \
    -p 19230:19230 \
    -p 19231:19231 \
    -p 19232:19232 \
    -p 19233:19233 \
    -p 19234:19234 \
    -p 19235:19235 \
    -p 19236:19236 \
    -p 19237:19237 \
    -p 19238:19238 \
    -p 19239:19239 \
    -p 19240:19240 \
    -p 19241:19241 \
    -p 19242:19242 \
    -p 19243:19243 \
    -p 19244:19244 \
    -p 19245:19245 \
    -p 19246:19246 \
    -p 19247:19247 \
    -p 19248:19248 \
    -p 19249:19249 \
    -p 19250:19250 \
    $KAFKA_CLUSTER_IMAGE
docker run -d --name kafka-clients --cpus 64 --memory 128g $KAFKA_CLIENTS_IMAGE

# wait for the kafka-cluster container to be fully started
sleep 24

# get the IP address of the host
HOST_IP=$(hostname -I | awk '{print $1}')

# check if IP was retrieved
if [ -z "$HOST_IP" ]; then
  echo "failed to get IP address of host"
  exit 1
fi

echo "Host IP: $HOST_IP"

# execute commands inside the kafka-clients container
docker exec kafka-clients bash -c "
  cd /home/ubuntu &&
  eval \$(ssh-agent) &&
  ssh-add /home/ubuntu/newkey &&
  cd /home/ubuntu/kafka-hdd &&
  export KAFKA_DIR=\$PWD/kafka_2.13-3.4.1 &&
  echo 'KAFKA_DIR is set to '\$KAFKA_DIR &&
  export REMOTEHOST=$HOST_IP &&
  echo 'REMOTEHOST is set to '\$REMOTEHOST &&
  ./scripts/check_reqs.sh &&
  cd experiments &&
  cd $(printf '%03d' $PARAM) &&
  date &&
  ./run.sh &&
  date &&
  [ $PARAM -eq 1 ] || [ $PARAM -eq 2 ] && ./post.sh

  # notify completion of the experiment
  echo 'experiment complete'
  
  # set locale inside Docker container
  echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen &&
  export LANG=en_US.UTF-8 &&
  dpkg-reconfigure locales &&
  
  # generate plots using gnuplot
  cd graphs
  for plt_file in *.plt; do
      # extract the filename without the extension
      base_name=\$(basename \"\$plt_file\" .plt)
  
      # generate the PNG file using gnuplot
      gnuplot -e \"set terminal png; set output '../\${base_name}.png'; load '\$plt_file'\"
  
      echo \"\${base_name}.png generated\"
  done
"
