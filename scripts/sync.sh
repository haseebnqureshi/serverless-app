#!/bin/bash

cd resources 
sls invoke local -f sync 
cd ..
