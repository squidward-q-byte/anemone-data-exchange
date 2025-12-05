docker build -t avro-build .
docker run --rm \
  -v "$PWD/src:/work/avdl" \
  -v "$PWD/out:/work/out" \
  avro-build