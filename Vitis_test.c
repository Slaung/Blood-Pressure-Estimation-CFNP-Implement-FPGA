#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "CFNP_AXI_IP.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xtime_l.h"

int main()
{
    init_platform();
    print("Successfully ran Hello World application\r\n");

    u32 odata;
    u32 done;
    u32 tUsed;
	XTime tStart, tEnd;

    /*** reset ***/
    Xil_Out32(XPAR_CFNP_AXI_IP_0_S00_AXI_BASEADDR+CFNP_AXI_IP_S00_AXI_SLV_REG0_OFFSET, 1); // rst
    Xil_Out32(XPAR_CFNP_AXI_IP_0_S00_AXI_BASEADDR+CFNP_AXI_IP_S00_AXI_SLV_REG1_OFFSET, 0); // start

    /*** start ***/
    Xil_Out32(XPAR_CFNP_AXI_IP_0_S00_AXI_BASEADDR+CFNP_AXI_IP_S00_AXI_SLV_REG0_OFFSET, 0);
    Xil_Out32(XPAR_CFNP_AXI_IP_0_S00_AXI_BASEADDR+CFNP_AXI_IP_S00_AXI_SLV_REG1_OFFSET, 1);

    /*** output ***/
    XTime_GetTime(&tStart);
    for(int i=0; i<50; i=i+1){
		odata = Xil_In32(XPAR_CFNP_AXI_IP_0_S00_AXI_BASEADDR+CFNP_AXI_IP_S00_AXI_SLV_REG2_OFFSET);
		done  = Xil_In32(XPAR_CFNP_AXI_IP_0_S00_AXI_BASEADDR+CFNP_AXI_IP_S00_AXI_SLV_REG3_OFFSET);

		/***** print result *****/
		if(done==1){
			/***** get end time *****/
		    XTime_GetTime(&tEnd);
		    break;
		}
	}
    xil_printf("odata=%d, done=%d \r\n", odata, done);
    tUsed=((tEnd-tStart)*1000000)/COUNTS_PER_SECOND;
    xil_printf("time is %d us \r\n", tUsed);

    cleanup_platform();
    return 0;
}
// 2.776ms, 2.769ms, 2.769ms, 2.775ms, 2.771ms
