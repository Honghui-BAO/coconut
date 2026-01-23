
# 环境变量设置
export NCCL_P2P_LEVEL=NVL
export http_proxy=http://oversea-squid1.jp.txyun:11080 
export https_proxy=http://oversea-squid1.jp.txyun:11080 
export no_proxy=localhost,127.0.0.1,localaddress,localdomain.com,internal,corp.kuaishou.com,test.gifshow.com,staging.kuaishou.com

# 获取当前时间
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
# 为每次运行生成独立文件名
LOG_FILE="log/train_cot_${TIMESTAMP}.log"
# 使用新文件保存日志（此时用 > 即可，因为文件名是唯一的）
torchrun --nnodes 1 --nproc_per_node 4 run.py args/gsm_cot.yaml > "$LOG_FILE" 2>&1 &
echo "训练已启动，日志保存在: $LOG_FILE"