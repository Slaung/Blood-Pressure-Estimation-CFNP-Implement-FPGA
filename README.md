# 基於血壓預測之卷積模糊神經網路，實現於FPGA進行加速運算

- 實現FPGA板子: ZedBoard Zynq-7000

- Vivado_CFNP 為PL端，包含每層網路IP、AXI總線和CFNP整合網路。

- Vitis_test.c 為PS端，主要負責PL端輸入與輸出。
  - input_data.coe 輸入資料
  - Test_output 輸出資料


目錄：
- 系統架構
- 各層網路架構之硬體實現設計與結果(Conv1, Conv2_bn, Fusion, Fuzzy, Defuzzification)
- 整合結果

## 1. 系統架構
FPGA所實現的網路架構如下圖所示：
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure1.png)

- Conv1_top、Conv2_BN_top為循序處理。
- FusionCAP_top、Fuzzy_top、Defuzzification_top為平行處理。

## 2. 各層網路架構之硬體實現設計(Conv1, Conv2_bn, Fusion, Fuzzy, Defuzzification)
1. Conv1_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure2.png)

2. Conv1_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure3.png)

模擬結果：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure13.png)

python執行結果：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure14.png)

資源使用率：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure15.png)

3. Conv2_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure4.png)

4. BN_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure5.png)

5. Conv2_BN_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure6.png)

模擬結果：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure16.png)

python執行結果：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure17.png)

資源使用率：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure18.png)

6. FusionCAP_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure7.png)

7. FusionCAP_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure8.png)

模擬結果：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure19.png)

python執行結果：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure20.png)

資源使用率：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure21.png)

8. Fuzzy_Rule_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure9.png)

9. Fuzzy_Rule_top

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure10.png)

模擬、python執行結果和資源使用率：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure22.png)

10. Defuzzification_PE

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure11.png)

11. Defuzzification_top
   
![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure12.png)

模擬、python執行結果和資源使用率：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure23.png)

12. CFNP整合結果

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure24.png)

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure25.png)

資源使用率：

![image](https://github.com/Slaung/Blood-Pressure-Estimation-CFNP-Implement-FPGA/blob/main/Figure/Figure26.png)
