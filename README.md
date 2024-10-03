# 基於血壓預測之卷積模糊神經網路，實現於FPGA進行加速運算

目錄：
- 系統架構
- 各層網路架構之硬體實現設計(Conv1, Conv2_bn, Fusion, Fuzzy, Defuzzy)
- 成果展示

## 1. 系統架構
FPGA所實現的網路架構如下圖所示：
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure1.png)

- Conv1_top、Conv2_BN_top為循序處理。
- Fusion_top、Fuzzy_top、Defuzzy_top為平行處理。

## 2. 各層網路架構之硬體實現設計(Conv1, Conv2_bn, Fusion, Fuzzy, Defuzzy)
1. Conv1_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure2.png)

2. Conv1_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure3.png)

3. Conv2_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure4.png)

4. BN_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure5.png)

5. Conv2_BN_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure6.png)

6. FusionCAP_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure7.png)

7. FusionCAP_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure8.png)

8. Fuzzy_Rule_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure9.png)

9. Fuzzy_Rule_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure10.png)

10. Defuzzification_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure11.png)

11. Defuzzification_top
   
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure12.png)
