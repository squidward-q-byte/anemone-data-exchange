# docker build -t avro-build .
# docker run --rm \
#   -v "$PWD/src:/work/avdl" \
#   -v "$PWD/out:/work/out" \
#   avro-build


docker build -t avro-codegen-typescript  -f typescript/Dockerfile .
docker run --rm \
  -v "$PWD/out/avsc:/usr/src/app/schemas" \
  -v "$PWD/out/typescript:/usr/src/app/types" \
  avro-codegen-typescript


docker build -t avro-codegen-python  -f python/Dockerfile .
docker run --rm \
  -v "$PWD/out/avsc:/app/schemas" \
  -v "$PWD/out/python:/app/types" \
  avro-codegen-python