docker build -t avro-build .
docker run --rm \
  -v "$PWD/src:/work/avdl" \
  -v "$PWD/out:/work/out" \
  avro-build


docker build -t avro-typescript  -f Dockerfile.typescript .
docker run --rm \
  -v "$PWD/out/avsc:/usr/src/app/schemas" \
  -v "$PWD/out/typescript:/usr/src/app/types" \
  avro-typescript