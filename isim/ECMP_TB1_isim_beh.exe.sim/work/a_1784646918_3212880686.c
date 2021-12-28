/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/ProgrammingProjects/Xilinx/ErrorCorrectionMemoryPathFinal/DPRAM.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1784646918_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;
    unsigned char t23;
    unsigned char t24;
    unsigned char t25;
    int t26;

LAB0:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 3952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(30, ng0);
    t1 = xsi_get_transient_memory(176U);
    memset(t1, 0, 176U);
    t5 = t1;
    t6 = (t0 + 7136);
    t8 = (11U != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 7147);
    t12 = (0 - 0);
    t13 = (t12 * 1);
    t14 = (11U * t13);
    t15 = (t5 + t14);
    memcpy(t15, t10, 11U);
    t16 = (t0 + 4032);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t1, 176U);
    xsi_driver_first_trans_fast(t16);
    goto LAB3;

LAB5:    t9 = (176U / 11U);
    xsi_mem_set_data(t5, t6, 11U, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t8 = *((unsigned char *)t5);
    t21 = (t8 == (unsigned char)3);
    if (t21 == 1)
        goto LAB12;

LAB13:    t4 = (unsigned char)0;

LAB14:    if (t4 != 0)
        goto LAB9;

LAB11:
LAB10:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB15;

LAB17:
LAB16:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB18;

LAB20:
LAB19:    goto LAB3;

LAB9:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2472U);
    t7 = *((char **)t2);
    t24 = *((unsigned char *)t7);
    t25 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t24);
    t2 = (t0 + 4096);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t25;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB12:    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t22 = *((unsigned char *)t6);
    t23 = (t22 == (unsigned char)3);
    t4 = t23;
    goto LAB14;

LAB15:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1992U);
    t5 = *((char **)t1);
    t1 = (t0 + 1672U);
    t6 = *((char **)t1);
    t1 = (t0 + 6832U);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t1);
    t26 = (t12 - 0);
    t9 = (t26 * 1);
    t13 = (11U * t9);
    t14 = (0U + t13);
    t7 = (t0 + 4032);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t15 = (t11 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t5, 11U);
    xsi_driver_first_trans_delta(t7, t14, 11U, 0LL);
    goto LAB16;

LAB18:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2312U);
    t5 = *((char **)t1);
    t1 = (t0 + 1832U);
    t6 = *((char **)t1);
    t1 = (t0 + 6848U);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t6, t1);
    t26 = (t12 - 0);
    t9 = (t26 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t12);
    t13 = (11U * t9);
    t14 = (0 + t13);
    t7 = (t5 + t14);
    t10 = (t0 + 4160);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t7, 11U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB19;

}


extern void work_a_1784646918_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1784646918_3212880686_p_0};
	xsi_register_didat("work_a_1784646918_3212880686", "isim/ECMP_TB1_isim_beh.exe.sim/work/a_1784646918_3212880686.didat");
	xsi_register_executes(pe);
}
