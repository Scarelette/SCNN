#!/usr/bin/env sh
exp=vgg_SCNN_DULR_w9
data=/home/zhangyujun/Code/Data
th main.lua \
   -data  ${data} \
   -train ${data}/train.txt \
   -val ${data}/val.txt \
   -dataset lane \
   -save experiments/models/${exp} \
   -retrain experiments/models/${exp}/${exp}.t7 \
   -shareGradInput true \
   -nThreads 2 \
   -nGPU 2 \
   -batchSize 12 \
   -maxIter 60000 \
   -LR 0.01 \
   -backWeight 0.4 \
   -nEpochs 100 \
2>&1|tee experiments/models/${exp}/train.log
