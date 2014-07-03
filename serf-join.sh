#!/bin/sh

SERF_ADDR=`env | grep SERF | grep TCP_ADDR | cut -f2 -d"=" | uniq`
SERF_PORT=`env | grep SERF | grep "TCP_PORT=" | cut -f2 -d"=" | sort -u | tr "\\n" ","`

echo "Serf at ${SERF_ADDR}"

SVC=`env | grep -v SERF | grep TCP_ADDR | cut -f1 -d"_" | tr '[:upper:]' '[:lower:]' | head -1`
SVC_ADDR=`env | grep -v SERF | grep -i ${SVC} | grep TCP_ADDR | cut -f2 -d"="`
SVC_PORT=`env | grep -v SERF | grep -i ${SVC} | grep "TCP_PORT=" | cut -f2 -d"="`

echo "Agent role = ${SVC}_${SVC_PORT}"
echo "Agent address tag = ${SVC}_address=${SVC_ADDR}"
echo "Agent port tag ${SVC}_port=${SVC_PORT}"

exec serf agent -join=${SERF_ADDR} -tag role=${SVC}_${SVC_PORT} -tag ${SVC}_address=${SVC_ADDR} -tag ${SVC}_port=${SVC_PORT}
