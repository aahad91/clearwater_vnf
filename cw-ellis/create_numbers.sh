#!/bin/bash
# Wait until mysqld is running
until pids=$(pidof mysqld)
do
  sleep 1
done


sleep 2

usr/share/clearwater/ellis/env/bin/python /usr/share/clearwater/ellis/src/metaswitch/ellis/tools/create_numbers.py --start 6505550000 --count 1000
