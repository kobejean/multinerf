#!/bin/bash
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export CUDA_VISIBLE_DEVICES=0

SCENE=lego
EXPERIMENT=blender
DATA_DIR=/home/ccl/Datasets/NeRF/blender
CHECKPOINT_DIR=/home/ccl/Code/multinerf/outputs/"$EXPERIMENT"/"$SCENE"

# rm "$CHECKPOINT_DIR"/*
# python -m train \
#   --gin_configs=configs/blender_256.gin \
#   --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
#   --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}'" \
#   --logtostderr

python -m eval \
  --gin_configs=configs/blender_256.gin \
  --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
  --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}'" \
  --logtostderr
