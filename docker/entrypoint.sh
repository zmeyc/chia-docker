#!/bin/sh

cd /app
. ./activate

exec "$@"
