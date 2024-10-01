# 基於血壓預測之卷積模糊神經網路，實現於FPGA進行加速運算

目錄：
- 系統架構
- 各層網路架構之硬體實現設計(Conv1, Conv2_bn, Fusion, Fuzzy, Defuzzy)
- 成果展示

## 1. 系統架構
FPGA所實現的網路架構如下圖所示：
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure1.png)

## 2. 各層網路架構之硬體實現設計(Conv1, Conv2_bn, Fusion, Fuzzy, Defuzzy)
1. Conv1_PE
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure2.png)

2. Conv1_top
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure3.png)

3. Conv2_PE
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure4.png)

4. BN_PE
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure5.png)

5. Conv2_BN_PE
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure6.png)
   
