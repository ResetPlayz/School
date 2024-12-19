#!/bin/bash
message="Message from master at $(date)"
echo "$message" | sudo tee /dev/console

