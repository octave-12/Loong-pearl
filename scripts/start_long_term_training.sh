#!/bin/bash
# 长期训练启动脚本

cd /mnt/d/soso/projects/Loong-pearl

LOG_FILE="outputs/long_term_training_$(date +%Y%m%d_%H%M%S).log"

echo "========================================================================" | tee -a $LOG_FILE
echo "四代龙珠 - 长期训练" | tee -a $LOG_FILE
echo "开始时间: $(date)" | tee -a $LOG_FILE
echo "日志文件: $LOG_FILE" | tee -a $LOG_FILE
echo "========================================================================" | tee -a $LOG_FILE

# 运行训练
nohup python3 experiments/run_production_fixed.py >> $LOG_FILE 2>&1 &

PID=$!
echo "训练进程已启动，PID: $PID" | tee -a $LOG_FILE
echo "查看日志: tail -f $LOG_FILE" | tee -a $LOG_FILE
echo "停止训练: kill $PID" | tee -a $LOG_FILE

echo $PID > outputs/training.pid