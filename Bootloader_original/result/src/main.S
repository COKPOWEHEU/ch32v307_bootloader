.equ corecfgr,	0xBC0 #core configuration register
.equ intsyscr,	0x804 #Interrupt system control register

.equ MSTATUS_FS, 13
.equ MSTATUS_MPIE, 7
.equ MSTATUS_MIE, 3

.equ UART_TX,	9
.equ UART_RX,	10

.equ GPIO_APP50,0b1011
.equ GPIO_PUP,	0b1000

# gp = 0x20000838
#define SystemCoreClock	-2040(gp) # 0x2000'0040
#define cmd_request_ptr -1492(gp) # 0x2000'0264
#define cmd_reply_ptr	-2016(gp) # 0x2000'0058
#define usbotg_ep2_ptr	-1324(gp) # 0x2000'030c
#define usbotg_ep0_ptr	-1320(gp) # 0x2000'0310
#define usbhs_ep2rx_ptr	-1112(gp) # 0x2000'03e0
#define usbhs_ep0_ptr	-1108(gp) # 0x2000'03e4
#define usb_configuration	-1336(gp)#0x2000'0300 //по факту ни на что не влияет
#define flash_bytes_remain	-1476(gp) # 0x2000'0274
#define chipID		-1480(gp) # 0x2000'0270
#define UniqID_sum	-1496(gp) # 0x2000'0260
#define cmd_return_code	-1472(gp) # 0x2000'0278

#TODO что за адрес 0x1ed4 ? Константа 0x49e10000

.global _start
.text
_start:
.org 0

	j	handle_reset
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00000013
	.word 0x00100073
//    .section    .vector,"ax",@progbits
//    .align  1
_vector_base:
//    .option norvc;
.word   _start
.word   0
.word   NMI_Handler                /* NMI */
.word   HardFault_Handler          /* Hard Fault */
.word   0
.word   Ecall_M_Mode_Handler       /* Ecall M Mode */
.word	0
.word	0
.word   Ecall_U_Mode_Handler       /* Ecall U Mode */
.word   Break_Point_Handler        /* Break Point */
.word   0
.word   0
.word   SysTick_Handler            /* SysTick */
.word   0
.word   SW_Handler                 /* SW */
.word   0
/* External interrupts */
.word   WWDG_IRQHandler            /* Window Watchdog */
.word   PVD_IRQHandler             /* PVD through EXTI Line detect */
.word   TAMPER_IRQHandler          /* TAMPER */
.word   RTC_IRQHandler             /* RTC */
.word   FLASH_IRQHandler           /* Flash */
.word   RCC_IRQHandler             /* RCC */
.word   EXTI0_IRQHandler           /* EXTI Line 0 */
.word   EXTI1_IRQHandler           /* EXTI Line 1 */
.word   EXTI2_IRQHandler           /* EXTI Line 2 */
.word   EXTI3_IRQHandler           /* EXTI Line 3 */
.word   EXTI4_IRQHandler           /* EXTI Line 4 */
.word   DMA1_Channel1_IRQHandler   /* DMA1 Channel 1 */
.word   DMA1_Channel2_IRQHandler   /* DMA1 Channel 2 */
.word   DMA1_Channel3_IRQHandler   /* DMA1 Channel 3 */
.word   DMA1_Channel4_IRQHandler   /* DMA1 Channel 4 */
.word   DMA1_Channel5_IRQHandler   /* DMA1 Channel 5 */
.word   DMA1_Channel6_IRQHandler   /* DMA1 Channel 6 */
.word   DMA1_Channel7_IRQHandler   /* DMA1 Channel 7 */
.word   ADC1_2_IRQHandler          /* ADC1_2 */
.word   USB_HP_CAN1_TX_IRQHandler  /* USB HP and CAN1 TX */
.word   USB_LP_CAN1_RX0_IRQHandler /* USB LP and CAN1RX0 */
.word   CAN1_RX1_IRQHandler        /* CAN1 RX1 */
.word   CAN1_SCE_IRQHandler        /* CAN1 SCE */
.word   EXTI9_5_IRQHandler         /* EXTI Line 9..5 */
.word   TIM1_BRK_IRQHandler        /* TIM1 Break */
.word   TIM1_UP_IRQHandler         /* TIM1 Update */
.word   TIM1_TRG_COM_IRQHandler    /* TIM1 Trigger and Commutation */
.word   TIM1_CC_IRQHandler         /* TIM1 Capture Compare */
.word   TIM2_IRQHandler            /* TIM2 */
.word   TIM3_IRQHandler            /* TIM3 */
.word   TIM4_IRQHandler            /* TIM4 */
.word   I2C1_EV_IRQHandler         /* I2C1 Event */
.word   I2C1_ER_IRQHandler         /* I2C1 Error */
.word   I2C2_EV_IRQHandler         /* I2C2 Event */
.word   I2C2_ER_IRQHandler         /* I2C2 Error */
.word   SPI1_IRQHandler            /* SPI1 */
.word   SPI2_IRQHandler            /* SPI2 */
.word   USART1_IRQHandler          /* USART1 */
.word   USART2_IRQHandler          /* USART2 */
.word   USART3_IRQHandler          /* USART3 */
.word   EXTI15_10_IRQHandler       /* EXTI Line 15..10 */
.word   RTCAlarm_IRQHandler        /* RTC Alarm through EXTI Line */
.word   USBWakeUp_IRQHandler       /* USB Wakeup from suspend */
.word   TIM8_BRK_IRQHandler        /* TIM8 Break */
.word   TIM8_UP_IRQHandler         /* TIM8 Update */
.word   TIM8_TRG_COM_IRQHandler    /* TIM8 Trigger and Commutation */
.word   TIM8_CC_IRQHandler         /* TIM8 Capture Compare */
.word   RNG_IRQHandler             /* RNG */
.word   FSMC_IRQHandler            /* FSMC */
.word   SDIO_IRQHandler            /* SDIO */
.word   TIM5_IRQHandler            /* TIM5 */
.word   SPI3_IRQHandler            /* SPI3 */
.word   UART4_IRQHandler           /* UART4 */
.word   UART5_IRQHandler           /* UART5 */
.word   TIM6_IRQHandler            /* TIM6 */
.word   TIM7_IRQHandler            /* TIM7 */
.word   DMA2_Channel1_IRQHandler   /* DMA2 Channel 1 */
.word   DMA2_Channel2_IRQHandler   /* DMA2 Channel 2 */
.word   DMA2_Channel3_IRQHandler   /* DMA2 Channel 3 */
.word   DMA2_Channel4_IRQHandler   /* DMA2 Channel 4 */
.word   DMA2_Channel5_IRQHandler   /* DMA2 Channel 5 */
.word   ETH_IRQHandler             /* ETH */
.word   ETH_WKUP_IRQHandler        /* ETH WakeUp */
.word   CAN2_TX_IRQHandler         /* CAN2 TX */
.word   CAN2_RX0_IRQHandler        /* CAN2 RX0 */
.word   CAN2_RX1_IRQHandler        /* CAN2 RX1 */
.word   CAN2_SCE_IRQHandler        /* CAN2 SCE */

	.word   OTG_FS_IRQHandler          /* OTGFS */
.word   USBHSWakeup_IRQHandler     /* USBHS Wakeup */
	.word   USBHS_IRQHandler           /* USBHS */

.word   DVP_IRQHandler             /* DVP */
.word   UART6_IRQHandler           /* UART6 */
.word   UART7_IRQHandler           /* UART7 */
.word   UART8_IRQHandler           /* UART8 */
.word   TIM9_BRK_IRQHandler        /* TIM9 Break */
.word   TIM9_UP_IRQHandler         /* TIM9 Update */
.word   TIM9_TRG_COM_IRQHandler    /* TIM9 Trigger and Commutation */
.word   TIM9_CC_IRQHandler         /* TIM9 Capture Compare */
.word   TIM10_BRK_IRQHandler       /* TIM10 Break */
.word   TIM10_UP_IRQHandler        /* TIM10 Update */
.word   TIM10_TRG_COM_IRQHandler   /* TIM10 Trigger and Commutation */
.word   TIM10_CC_IRQHandler        /* TIM10 Capture Compare */
.word   DMA2_Channel6_IRQHandler   /* DMA2 Channel 6 */
.word   DMA2_Channel7_IRQHandler   /* DMA2 Channel 7 */
.word   DMA2_Channel8_IRQHandler   /* DMA2 Channel 8 */
.word   DMA2_Channel9_IRQHandler   /* DMA2 Channel 9 */
.word   DMA2_Channel10_IRQHandler  /* DMA2 Channel 10 */
.word   DMA2_Channel11_IRQHandler  /* DMA2 Channel 11 */

/* Align */
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000
.word 0x00000000

NMI_Handler:  mret
HardFault_Handler:	1:	j 1b


flash_unlock_fast:
_206:	lui	a3,0x45670
	lui	a5,0x40022
	add	a3,a3,291 # 0x45670123
	lui	a4,0xcdef9
	sw	a3,4(a5) # FLASH_KEYR = 0x45670123
	add	a4,a4,-1621 # 0xcdef89ab
	sw	a4,4(a5) # FLASH_KEYR = 0xcdef89ab
	#unlock fast program mode
	sw	a3,36(a5)# FLASH_MODEKEYR = 0x45670123
	sw	a4,36(a5)# FLASH_MODEKEYR = 0xcdef89ab
	ret
	
.macro flash_wait_bsy temp base
1:
	lw	\temp,12(\base) # FLASH_STATR
	and	\temp,\temp,(1<<0)
	  bnez	\temp, 1b
.endm

flash_fast_erase:
_224:	lui	a5,0x40022
	lw	a4,16(a5) # a4 = FLASH_CTLR
	add	sp,sp,-16
	li	a3,(1<<17) #FTER
	sw	s0,8(sp)
	sw	ra,12(sp)
	or	a4,a4,a3
	sw	a4,16(a5) # FLASH_CTRL |= FTER (Perform a fast erase operation)
	sw	a0,20(a5) # FLASH_ADDR = a0
	lw	a4,16(a5) # a4 = FLASH_CTLR
	lui	s0,0x40022
	or	a4,a4,(1<<6)
	sw	a4,16(a5) # FLASH_CTLR |= STRT (start write/erase operation)
        flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write #clear end-of-operation flag)
	lw	a5,16(s0) # FLASH_CTLR
	li a4, ~(1<<17) #FTER
	and	a5,a5,a4
	sw	a5,16(s0) # FLASH_CTLR &=~ FTER
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	sp,sp,16
	ret


flash_std_erase:
_266:	lui	a5,0x40022
	lw	a4,16(a5) # FLASH_CTLR
	add	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	or	a4,a4,(1<<1)
	sw	a4,16(a5) # FLASH_CTLR |= PER (standatd flash erase)
	sw	a0,20(a5) # FLASH_ADDR = a0
	lw	a4,16(a5)
	lui	s0,0x40022
	or	a4,a4,(1<<6)
	sw	a4,16(a5) # FLASH_CTLR |= STRT
        flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write #clear end-of-operation flag)
	lw	a5,16(s0)
	lw	ra,12(sp)
	and	a5,a5,~(1<<1)
	sw	a5,16(s0) # FLASH_CTLR &=~ PER (standatd flash erase)
	lw	s0,8(sp)
	add	sp,sp,16
	ret

flash_32k_erase:
_2a2:	lui	a5,0x40022
	lw	a4,16(a5) # FLASH_CTLR
	add	sp,sp,-16
	li	a3,(1<<18)
	sw	s0,8(sp)
	sw	ra,12(sp)
	or	a4,a4,a3
	sw	a4,16(a5) # FLASH_CTLR |= BER32 (Perform a 32KB erase)
	sw	a0,20(a5)  # FLASH_ADDR = a0
	lw	a4,16(a5)
	lui	s0,0x40022
	or	a4,a4,(1<<6)
	sw	a4,16(a5) # FLASH_CTLR |= STRT
        flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write
	lw	a5,16(s0)
	li a4, ~(1<<18)
	and	a5,a5,a4
	sw	a5,16(s0) # FLASH_CTLR &=~ BER32 (Perform a 32KB erase)
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	sp,sp,16
	ret


flash_64k_erase:
_2e6:	lui	a5,0x40022
	lw	a4,16(a5) # FLASH_CTLR
	add	sp,sp,-16
	li	a3,(1<<19) # BER64
	sw	s0,8(sp)
	sw	ra,12(sp)
	or	a4,a4,a3
	sw	a4,16(a5) # FLASH_CTLR |= BER64 (Perform a 64KB erase)
	sw	a0,20(a5) # FLASH_ADDR = a0
	lw	a4,16(a5)
	lui	s0,0x40022
	or	a4,a4,(1<<6)
	sw	a4,16(a5) # FLASH_CTLR |= STRT
	flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write
	lw	a5,16(s0)
	li a4, ~(1<<19)
	and	a5,a5,a4
	sw	a5,16(s0) # FLASH_CTLR &=~ BER64
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	sp,sp,16
	ret

flash_write_fast256: #a0 - dst, a1 - src
_32a:	lui	a4,0x40022
	lw	a5,16(a4) # FLASH_CTLR
	add	sp,sp,-16
	li	a3,(1<<16) # FTPG
	sw	ra,12(sp)
	sw	s0,8(sp)
	or	a5,a5,a3
	sw	a5,16(a4) # FLASH_CTLR |= FTPG (Perform a fast page programming operation)
	flash_wait_bsy a5,a4
	lui	a4,0x40022
WAIT_FLASH_STATR_WRBSY:
	lw	a5,12(a4)
	and	a5,a5,(1<<1)
	  bnez	a5, WAIT_FLASH_STATR_WRBSY
	lui	a4,0x40022
	li	a2,256
copy_256_a1_to_a0:
	add	a3,a1,a5 # a3 = (uint32_t*)a1 [a5]
	lw	a6,0(a3)
	add	a3,a0,a5 # a3 = (uint32_t*)a0 [a5]
	sw	a6,0(a3)
WAIT_FLASH_STATR_WRBSY2:
	lw	a3,12(a4)
	and	a3,a3,(1<<1)
	  bnez	a3, WAIT_FLASH_STATR_WRBSY2
	add	a5,a5,4
	  bne	a5,a2, copy_256_a1_to_a0
	  
	lw	a5,16(a4)
	li	a3,(1<<21)
	lui	s0,0x40022
	or	a5,a5,a3
	sw	a5,16(a4) # FLASH_CTLR |= PGSTRT (start a page programming)
	flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write
	lw	a5,16(s0)
	li	a4,~(1<<16)
	and	a5,a5,a4
	sw	a5,16(s0) # FLASH_CTLR &=~ FTPG
	lw	ra,12(sp)
	lw	s0,8(sp)
	add	sp,sp,16
	ret

option_bytes_write_16: #a0 - address, a1 - data
_39e:	add	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	lui	a5,0x40022
	flash_wait_bsy a4,a5
	li	a4, 0x45670123
	sw	a4,8(a5) # FLASH_OBKEYR = 0x45670123
	li	a4, 0xcdef89ab
	sw	a4,8(a5) # FLASH_OBKEYR = 0xcdef89ab
	lw	a4,16(a5)
	lui	s0,0x40022
	ori	a4,a4,(1<<4)
	sw	a4,16(a5) # FLASH_CTLR |= OBPG (Execute the user option bytes programming)
	sh	a1,0(a0)
	flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write
	lw	a5,16(s0)
	lw	ra,12(sp)
	andi	a5,a5,~(1<<4)
	sw	a5,16(s0) # FLASH_CTLR &=~ OBPG
	lw	a5,16(s0)
	andi	a5,a5,~(1<<9)
	sw	a5,16(s0) # FLASH_CTLR &=~ OBWRE (0: Re-lock the user option bytes)
	lw	s0,8(sp)
	add	sp,sp,16
	ret


option_bytes_erase:
_3f6:	add	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	lui	a5,0x40022
	flash_wait_bsy a4,a5
	li a4, 0x45670123
	sw	a4,8(a5) # FLASH_OBKEYR = 0x45670123
	li a4, 0xcdef89ab
	sw	a4,8(a5) # FLASH_OBKEYR = 0xcdef89ab
	lw	a4,16(a5) # FLASH_CTLR
	lui	s0,0x40022
	or	a4,a4,(1<<5)
	sw	a4,16(a5) # FLASH_CTLR |= OBER (Execute the user option bytes erasure)
	lw	a4,16(a5)
	or	a4,a4,(1<<6)
	sw	a4,16(a5) # FLASH_CTLR |= STRT
	flash_wait_bsy a5,s0
	li	a0,(1<<5) # EOP
	jal	FLASH_STATR_write
	lw	a5,16(s0)
	lw	ra,12(sp)
	and	a5,a5,~(1<<5)
	sw	a5,16(s0) # FLASH_CTLR |= OBER
	lw	a5,16(s0)
	and	a5,a5,~(1<<9)
	sw	a5,16(s0) # FLASH_CTLR &=~ OBWRE
	lw	s0,8(sp)
	add	sp,sp,16
	ret
	
	
memcpy: # a0 - dst, a1 - src, a2 - count
_454:	li	a5,0
1:	bne a5,a2, 2f #skip ret
	  ret
2:	add	a4,a1,a5
	lbu	a3,0(a4) # a3 = a1[a5]
	add	a4,a0,a5
	add	a5,a5,1
	sb	a3,0(a4) # a0[a5] = a3
	j 1b
	

cmd_parse:
_470:	add	sp,sp,-48
	sw	s1,36(sp)
	sw	s3,28(sp)
	lw	t1,cmd_reply_ptr # t1 = [0x2000'0058]
	lw	a1,cmd_request_ptr # a1 = cmd_request_ptr = [0x2000'0264]
	sw	s0,40(sp)
	sw	ra,44(sp)
	sw	s2,32(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sb	zero,5(t1) # [0x2000'0058]->b[5] = 0
	lbu	a0,4(a1) # a0 = cmd_request_ptr->b[4]
	lbu	a5,5(a1) # a5 = cmd_request_ptr->b[5]
	slli	a0,a0,8
	slli	a5,a5,16
	add	a0,a0,a5 # a0 = (cmd_request_ptr->b[4:5])<<8
	li	a2,6
	lbu	a3,3(a1) # a3 = cmd_request_ptr->b[3]
	lbu	a5,6(a1) # a5 = cmd_request_ptr->b[6]
	sw	a2,-1500(gp) # [0x2000'025c] = 6
	lbu	a6,1(a1) # a6 = cmd_request_ptr->b[1] # size_lo (b[2]-size_hi)
	lbu	a4,0(a1) # a4 = cmd_request_ptr->b[0] # cmd
	slli	a5,a5,24
	add	a0,a0,a3
	add	a0,a0,a5 # a0 = cmd_request_ptr->b[3:6] # addr
	li	a5,0xA5 # CMD_PROGRAM
	add	a7,a6,-5 # a7 = cmd_request_ptr->b[1] - 5 # size_lo-5
	  beq	a4,a5, CMD_PROGRAM  #if cmd_request_ptr->b[0] == 0xA5
	  bltu	a5,a4, CMD_more_A5  #if cmd_request_ptr->b[0] > 0xA5
	li	a5,0xA2 # CMD_ISP_END
	  beq	a4,a5, CMD_ISP_END  # if cmd_request_ptr->b[0] == 0xA2
	  bltu	a5,a4, CMD_A3_A4 # if cmd_request_ptr->b[0] > 0xA2
	li	a5,0xA1
	li	a3,0
	  bne	a4,a5, CMD_ERR  # if cmd_request_ptr->b[0] != 0xA1
CMD_IDENTIFY:
.option norvc
_4e2:	li a5, 0x1ec0 #a5 = &prodstring
	#наверное, cmd_request_ptr->b[3]=0x71, b[4]=0x17
.option rvc
	li	a4,16
TEST_PRODSTR_LOOP:
	add	a2,a1,a3
	lbu	a0,5(a2) # a0 = cmd_request_ptr->b[5+i]
	add	a2,a3,a5 
	lb	a2,0(a2) # a2 = prodstr[i]
  	  bne	a0,a2, TEST_PRODSTR_FAIL
	add	a3,a3,1
	  bne	a3,a4, TEST_PRODSTR_LOOP
	#test prodstr: OK
	lbu	s2,chipID
	li	a5,0x17
	sb	a5,5(t1) # [0x2000'0058]->b[5] = 0x17
	jal flash_unlock_fast
	j PARSECMD_END
	
CMD_A3_A4:li	a5,0xA3 # CMD_ISP_KEY
	  beq	a4,a5, CMD_ISP_KEY
	li	a5,0xA4 # CMD_ERASE
  	  beq	a4,a5, CMD_ERASE
CMD_ERR:
	li	s2,254
PARSECMD_END:
_524:	lw	a4,cmd_request_ptr # [0x2000'0264]
	lw	a5,cmd_reply_ptr # a5 = [0x2000'0058]
	lbu	a4,0(a4) # a4 = var->b[0] - cmd
	sb	a4,0(a5) # [0x2000'0058]->b[0] = a4 - cmd
	lw	a5,-1500(gp) # a5 = [0x2000'025c]
	lw	a4,cmd_reply_ptr # a4 = [0x2000'0058]
	add	a5,a5,-4
	sb	a5,2(a4) # [0x2000'0058]->b[2] = ([0x2000'025c] - 4) payload_size?
	lw	a5,cmd_reply_ptr # a5 = [0x2000'0058]
	sb	zero,3(a5) # [0x2000'0058]->b[3] = 0 payload_size_hi
	lw	a5,cmd_reply_ptr # a5 = [0x2000'0058]
	sb	s2,4(a5) # [0x2000'0058]->b[4] = s2
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	lw	s7,12(sp)
	lw	s8,8(sp)
	add	sp,sp,48
	ret

CMD_more_A5:
	li	a5,0xA7 # CMD_READ_CONFIG
	  beq	a4,a5, CMD_READ_CONFIG
	  bltu	a4,a5, CMD_VERIFY # 0xA6=CMD_VERIFY
	li	a5,0xA8 # CMD_WRITE_CONFIG
	  beq	a4,a5, CMD_WRITE_CONFIG
	li	a5,0xC5
	  bne	a4,a5, CMD_ERR
	  
CMD_SET_BAUD: #a0=[3:6]
_58a:	sw	a0,-1468(gp) # [0x2000'027c] = a0 = baudrate
	li	a4,2 # or 1
_590:	sb	a4,-1471(gp) # [0x2000'0279] = a4
	j PARSECMD_END_SUCCESS
	
#if 1 // CMD_PROGRAM
CMD_PROGRAM: #a0=[3:6]-addr ; var->b[7]=padding # a7=(size_lo-5)
_596:	li	a5,0x20000000
	andi	t3,a0,0xFF # t3 = addr & 0xFF
	li	a3,0
	add	a5,a5,92 # a5 = decoded_flash_buffer (0x2000'005c)
	add	a4,gp,-1488 # a4 = &XOR_MASK # 0x2000'0268
flash_decode_loop: # [0x2000'005c] = cmd_request_ptr->data ^ XOR_MASK
_5a8:	bltu	a3,a7, flash_decode 
	
	lw	a5,flash_bytes_remain # a5 = [0x2000'0274]
	li	a4,0x08000000 # (1<<27)
	andi	a0,a0,~0xFF
	add	a5,a5,a7
	or	a0,a0,a4 # map flash from (0x0000'0000 and 0x0800'0000 to 0x0800'0000)?
	sw	a5,flash_bytes_remain # [0x2000'0274] = a5
	li	a4,255
	mv	s2,s4
	  bgeu	a4,a5, flash_fill_tail # if [0x2000'0274] <= 255 дополнить конец страницы FF-ками
	li	s2,0x20000000
	add	a1,s2,92 # a1 = decoded_flash_buffer (0x2000'005c)
	jal flash_write_fast256 # a0 - dst, a1 - src
	lw	a4,flash_bytes_remain # a4 = [0x2000'0274]
	add	a5,s2,92 # a5 = decoded_flash_buffer (0x2000'005c)
	li	a3,0
	addi	a4,a4,-256
	sw	a4,flash_bytes_remain # a4 = ([0x2000'0274] -= 256)
shift_flash_tail_loop: #сдвинуть массив флеша вниз на страницу
_5e6:	  bltu a3,a4, shift_flash_tail

PARSECMD_END_SUCCESS:
	li	s2,0
	j PARSECMD_END

flash_decode: #a1=cmd_request_ptr
_5ee:	andi	t1,a3,0b111
	add	a6,a1,a3 # a6 = cmd_request_ptr + i
	add	t1,t1,a4 # t1 += & XOR_MASK # 0x2000'0268
	lbu	a6,8(a6) # a6 = cmd_request_ptr->b[8+i] ; a6=cmd_request_ptr->data[i]
	lbu	t1,0(t1) # t1 = (uint8_t*)(XOR_MASK)[i]
	add	a2,a3,t3 # a2 = (addr & 0xFF) + i
	add	a2,a2,a5 # a2 = decoded_flash_buffer (0x2000'005c) + (addr & 0xFF) + i
	xor	a6,a6,t1 # a6 = var->data[i] ^ XOR_MASK[i]
	sb	a6,0(a2) # decoded_flash_buffer[i] = a6
	add	a3,a3,1 # i++
  j flash_decode_loop


shift_flash_tail:	lbu	a2,256(a5) # a2 = a5[256]
	add	a3,a3,1    # a3++
	add	a5,a5,1    # a5[0] = a2 ; a5++
	sb	a2,-1(a5)
  j shift_flash_tail_loop
  
flash_fill_tail:
_620:	li	a4,55
	  bltu	a4,a7, PARSECMD_END_SUCCESS # if (size-5) > 55
	  beqz	a5, PARSECMD_END_SUCCESS # if (a5=[0x2000'0274]) == 0
	li	a1,0x20000000
	add	a6,a1,92 # a6 = decoded_flash_buffer (0x2000'005c)
	li	a2,-1
	li	a4,256
	#do{...}while [0x2000'0274] != 256
1:	add	a3,a5,a6
	sb	a2,0(a3) # decoded_flash_buffer[a5] = 0xFF
	add	a5,a5,1
	  bne	a5,a4, 1b

	add	a1,a1,92 # a1 = decoded_flash_buffer (0x2000005c)
	jal flash_write_fast256 # a0 - dst, a1 - src
	sw	zero,flash_bytes_remain # [0x2000'0274] = 0
	j PARSECMD_END_SUCCESS
#endif
	
#if 1 // CMD_VERIFY
CMD_VERIFY: # a0=[3:6]-addr, a7=([1]-5) = (size_lo-5)
_652:	or	a3,a7,a0
	and	a3,a3,0b111
	li	s2,254
	  bnez	a3, PARSECMD_END # если (size-5) не кратен 8 (по размеру страницы 256 байт?)
	lbu	a4,-1495(gp) # 0x2000'0261
	mv	t1,a5 # t1=a5=0xA6
	  bnez a4, PARSECMD_END # if [0x2000'0261] !=0 - ошибка
	add	a5,a1,8 # a5 = cmd_request_ptr+8
	mv	a1,a5
	li	a2,0
	add	a4,gp,-1488 # a4 = &XOR_MASK # 0x2000'0268
xor_to_cmd_request_ptr_data_loop:
	bltu a2,a7, xor_to_cmd_request_ptr_data # a7 = (size_lo - 5)
	li	a2,0x08000000
	srli	a4,a7,2 # a4 = (size-5)/4
	or	a0,a0,a2
	#a3 = 0, a0 = addr(flash)
CMP_VERIFY_LOOP:
	beq a4,a3, PARSECMD_END_SUCCESS #if a3 = size then success
	slli	a2,a3,2
	add	a2,a2,a0
	lw	a1,0(a5) # a1 = (uint32_t*)(var+8][a3]
	lw	a2,0(a2) # a2 = (uint32_t*)flash[a3]
	add	a5,a5,4
  beq a1,a2, CMP_VERIFY_NEXT #if a1 != a2 then break
  
	li	a5,1
	sb	a5,-1495(gp) # [0x2000'0261] = 1
	li	s2,245
	j PARSECMD_END

xor_to_cmd_request_ptr_data:
_6a4:	andi	a6,a2,0b111 # a6 = i & 0x111
	add	a6,a6,a4 # a6 = XOR_MASK + (i & 0b111)
	lbu	t3,0(a1) # t3 = cmd_request_ptr->data[i]
	lbu	a6,0(a6) # a6 = XOR_MASK[i]
	add	a2,a2,1 # i++
	add	a1,a1,1 # ptr(cmd_request_ptr->data)++
	xor	a6,a6,t3 # a6 = cmd_request_ptr->data[i] ^ XOR_MASK[i]
	sb	a6,-1(a1) # cmd_request_ptr->data[i] = a6
	j xor_to_cmd_request_ptr_data_loop

CMP_VERIFY_NEXT:
	add	a3,a3,1
	j CMP_VERIFY_LOOP
#endif

#if 1 // CMD_ERASE
CMD_ERASE: #a0=[3:6]-sectors(u32), a3=[3]-sectors(u8) a6=size
_6c4:	li	a5,4
	  beq	a6,a5, ERASE_SZ_4
	mv	a0,a3 #если size!=4 то используем единственный байт размера
ERASE_SZ_4:
	li	a5,8
	  bgeu	a0,a5, ERASE_SECTORS_MORE_8
	li	a0,8 #если секторов менее 8, стираем 8
ERASE_SECTORS_MORE_8:
	li	a5,480
	mv	s2,a0
	  bgeu	a5,a0, ERASE_SECTORS_LESS_480
	li	s2,480 #если секторов больше 480, стираем 480
ERASE_SECTORS_LESS_480:
	mv	s4,s2 # s4=s2=[8..480]
	li	s5,0x08000000 #начальный адрес
	li	s6,63
	li	s7,65536 #шаг по адресу: 64k
ERASE_64k_NEXT: #while(s4 > 63)
	bltu	s6,s4, ERASE_64k #addr=s5, s5+=s7, s4-=64
	srli	s6,s2,6 # /64
	li	s5,-64
	mul	s5,s6,s5
	li	s8,0x8000
	add	s7,s5,s2
	li	s2, 0x800
	add	s6,s6,s2
	slli	s6,s6,16
	mv	s4,s6
	mv	s2,s7
	li	s5,31
ERASE_32k_NEXT:
	bltu s5,s2, ERASE_32k #addr=s4, s4+=s8, s2-=32
	srli	s4,s7,5 # /32
	li	s5,-32
	mul	s2,s4,s5
	slli	s4,s4,15
	lui	s8,0x1
	add	s5,s2,s7
	add	s2,s4,s6
	mv	s6,s2
	mv	s4,s5
	li	s7,3
ERASE_STD_NEXT:
	bltu s7,s4, ERASE_STD #addr=s6, s6+=s8, s4-=4
	srli	a5,s5,2 # /4
	slli	s4,a5,12
	add	s4,s4,s2
	li	s2,-4
	mul	s2,a5,s2
	add	s2,s2,s5
	sll	s2,s2,0xa
	add	s2,s2,s4
ERASE_1k_FAST_NEXT:
	bne s4,s2, ERASE_1k_FAST #addr=s4, s4+=1024
	sb	zero,-1495(gp) # [0x2000'0261] = 0
	j PARSECMD_END_SUCCESS

ERASE_64k: #addr=s5, s5+=s7, s4-=64
_758:	mv	a0,s5
	jal flash_64k_erase
	add	s5,s5,s7
	add	s4,s4,-64
	j ERASE_64k_NEXT
       
ERASE_32k: #addr=s4, s4+=s8, s2-=32
_764:	mv	a0,s4
	jal flash_32k_erase
	add	s4,s4,s8
	add	s2,s2,-32
	j ERASE_32k_NEXT
	
ERASE_STD: #addr=s6, s6+=s8, s4-=4
_76e:	mv	a0,s6
	jal flash_std_erase
	add	s6,s6,s8
	add	s4,s4,-4
	j ERASE_STD_NEXT

ERASE_1k_FAST: #addr=s4, s4+=1024
_778:	mv	a0,s4
	jal flash_fast_erase
	add	a0,s4,256
	jal flash_fast_erase
	add	a0,s4,512
	jal flash_fast_erase
	add	a0,s4,768
	jal flash_fast_erase
	add	s4,s4,1024
	j ERASE_1k_FAST_NEXT
#endif

# a1 = cmd_request_ptr
# a2 = 6
# a6 = cmd_request_ptr->b[1] # size_lo
# request = [0](cmd) [1,2](size_lo size_hi) [3...](data) [?](checksum)

#xor_key[0] = UniqID_sum ^ data[size/7*4];
#xor_key[1] = UniqID_sum ^ data[size/5*1];
#xor_key[2] = UniqID_sum ^ data[size/7*1];
#xor_key[3] = UniqID_sum ^ data[size/7*6];
#xor_key[4] = UniqID_sum ^ data[size/7*3];
#xor_key[5] = UniqID_sum ^ data[size/5*3];
#xor_key[6] = UniqID_sum ^ data[size/7*5];
#xor_key[7] = ChipID + xor_key[0];
CMD_ISP_KEY:
_794:	li	a5,29 # 0x1D
	li	s2,254
	  bgeu	a5,a6, PARSECMD_END #if size_lo < 29 then error(254)
	li	a4,7
	divu	a4,a6,a4 # a4 = size_lo / 7
	lbu	a0,UniqID_sum
	add	a7,gp,-1488  # a7 = &XOR_MASK
	li	s2,0
	slli	a5,a4,2 # a5 = a4*4
	add	a5,a5,a1 # a5 = &cmd_request_ptr + (a4*4)
	mul	a2,a4,a2 # a2 = a4 * 6
	lbu	t1,3(a5) # t1 = (&cmd_request_ptr + (a4*4))->b3
	add	a5,a1,a4 # a5 = &cmd_request_ptr + (size/7)
	xor	t1,a0,t1 # t1 = t1 ^ UniqID_sum ([0x2000'0260])
	sb	t1,-1488(gp) # XOR_MASK[0] = t1
	
	lbu	a5,3(a5)
	xor	a5,a5,a0 # a5 ^= UniqID
	sb	a5,2(a7) # XOR_MASK[2] = a5
	
	add	a2,a2,a1 # &cmd_request_ptr + (size/7*6)
	lbu	a5,3(a2)
	li	a2,5
	xor	a5,a5,a0 # a5 ^= UniqID
	sb	a5,3(a7) # XOR_MASK[3] = a5
	
	li	a5,3
	mul	a3,a4,a5 # a3 = (size/7)*3
	add	a3,a3,a1
	lbu	a3,3(a3)
	xor	a3,a3,a0 # a3 ^= UniqID
	sb	a3,4(a7) # XOR_MASK[4] = a3
	
	mul	a3,a4,a2 # a3 = (size/7)*5
	divu	a4,a6,a2 # a4 = (size/5)
	add	a3,a3,a1 # a3 = &cmd_request_ptr + (size/7)*5
	lbu	a3,3(a3)
	li	a2,8
	xor	a3,a3,a0 # a3 ^= UniqID
	sb	a3,6(a7) # XOR_MASK[6] = a3
	
	add	a3,a1,a4 # a3 = &cmd_request_ptr + (size/5)
	mul	a4,a4,a5 # a4 = (size/5)*3
	lbu	a3,3(a3)
	xor	a3,a3,a0 # a3 ^= UniqID
	sb	a3,1(a7) # XOR_MASK[1] = a3
	
	add	a5,a1,a4 # a5 = &cmd_request_ptr + (size/5)*3
	lbu	a5,3(a5)
	xor	a5,a5,a0 # a5 ^= UniqID
	sb	a5,5(a7) # XOR_MASK[5] = a5
	
	lbu	a4,chipID
	add	a5,gp,-1488 # a5 = &XOR_MASK # 0x2000'0268
	add	a4,a4,t1 # ChipID + XOR_MASK[0]
	sb	a4,7(a7) # XOR_MASK[7] = a4
	
	li	a4,0

# s2 = 0
# a5 = &XOR_MASK
# a4 = счетчик
# a2 = 8
1:	add	a3,a5,a4
	lbu	a3,0(a3) # a3 = XOR_MASK[i]
	add	a4,a4,1  # i++
	add	s2,s2,a3 # s2 += XOR_MASK[i]
	andi	s2,s2,0xFF # s2 &= 0xFF
	  bne	a4,a2, 1b # while(i != 8)
	j PARSECMD_END


#see CMD_READ_CONFIG
CMD_WRITE_CONFIG: #a3=cmd_request_ptr->b[3]-bitmask, data
_84e:	andi	a3,a3,0b111
	li	a5,0b111
	li	s2,254
	  bne	a3,a5, PARSECMD_END # if (a3 & b0111 != 0b111)
	jal option_bytes_erase
	lw	s2,cmd_request_ptr
	lui	s5,0x20000
	li	s4,0
	add	s2,s2,5
	add	s5,s5,-2048 # 0x1ffff800
	li	s6,16
OPTION_BYTES_WRITE_LOOP: #for(s4=0; s4<16; s4+=2)
	lbu	a1,0(s2)
	add	a0,s4,s5
	jal option_bytes_write_16 #a0-addr, a1-data
	andi	a5,s4,8
	  bnez	a5, OPTION_BYTES_WRITE_ADD1
	add	s2,s2,1
OPTION_BYTES_WRITE_ADD1:
	add	s4,s4,2
	add	s2,s2,1
	  bne	s4,s6, OPTION_BYTES_WRITE_LOOP
	j PARSECMD_END_SUCCESS
	
	
#a3=[3]-bitmask:	0b00111 - user option bytes,
#			0b01000 - bootloader version,
#			0b10000 - UniqID
CMD_READ_CONFIG: 
_88a:	andi	s2,a3,31
	li	a5,0b111
	andi	a3,a3,0b111
	  beq a3,a5, READ_CONFIG_OPTION_BYTES
READ_CONFIG_OPTION_BYTES_END:
_896:	lw	a5,cmd_request_ptr
	lbu	a5,3(a5) #request->b[3], bitmask
	andi	a5,a5,(1<<3)
	  beqz	a5, READ_CONFIG_BLDR_VERSION_END
READ_CONFIG_BLDR_VERSION: # bootloader version
	lw	a5,-1500(gp) # a5 = [0x2000'025c]
	lw	a0,cmd_reply_ptr # a0 = [0x2000'0058]
	lui	a1,0x20000
	li	a2,4
	add	a0,a0,a5
	add	a1,a1,56 # a1 = bootloader version (0x2000'0038, там 0x00090200)
	jal memcpy  # a0 - dst, a1 - src, a2 - count(4)
	lw	a5,-1500(gp) # [0x2000'025c]
	add	a5,a5,4
	sw	a5,-1500(gp) # [0x2000'025c] += 4
READ_CONFIG_BLDR_VERSION_END:
_8c2:	lw	a5,cmd_request_ptr
	lbu	a5,3(a5)
	andi	a5,a5,(1<<4)
	  beqz a5, PARSECMD_END
READ_CONFIG_UniqID:
	li	a4,0x1ffff000
	addi	a3,a4,0x7e8 # a3 = 0x1ffff7e8 # 0x1ffff7e8..0x1ffff7f0
	sb	zero,UniqID_sum # UniqID_sum = 0
	add	a4,a4,0x7f0 # a4 = 0x1FFF'F7F0
read_UniqID_loop:
_8e0:	lw	a0,-1500(gp) # a0 = [0x2000'025c]
	lw	a2,cmd_reply_ptr # a2 = [0x2000'0058]
	lbu	a1,0(a3) # a1 = UniqID[i]
	addi	a3,a3,1
	add	a2,a2,a0 # &reply[i]
	sb	a1,0(a2) # reply[i] = UniqID[i]
	lw	a2,-1500(gp) # a2 = [0x2000'025c]
	lw	a1,cmd_reply_ptr # a1 = [0x2000'0058]
	lbu	a0,UniqID_sum # a0 = UniqID_sum
	add	a1,a1,a2 # &reply[i]
	lbu	a1,0(a1) # a1 = reply[i]
	add	a2,a2,1
	sw	a2,-1500(gp) # [0x2000'025c] = a2
	add	a1,a1,a0
	sb	a1,UniqID_sum # UniqID_sum = a1
	  bne	a3,a4, read_UniqID_loop
	j PARSECMD_END

#first 8 bytes read directly, then [8], [10], [12], [14]
# |       RDPR        |       nRDPR       |       USER        |       nUSER       |
# |       DATA0       |       nDATA0      |       DATA1       |       nDATA1      |
# | WPR0 (skip nWPR0) | WPR1 (skip nWPR1) | WPR2 (skip nWPR2) | WPR3 (skip nWPR3) |
#
# RDPR: 0xA5 - not read protected, other - read protected
# USER: bits 7:6(flash:RAM): 0b00(192:128), 0b01(224:96), 0b10(256:64), 0b11(288:32)
#       bit 2, STANDYRST. System is (0) or not (1) reset when entering Standby mode
#       bit 1, STOPRST. System will (0) or not (1) be reset when entering Stop mode
#       bit 0, IWDG_SW. IWDG hardware enable 1-software, 0-hardware
# WPRx: write protection bits. 1-writeable, 0-blocked
READ_CONFIG_OPTION_BYTES:
_918:	lui	a5,0x20000
	li	a4,0
	add	a5,a5,-2048 # a5 = 0x1ffff800 # user option byte 0
	li	a2,12 # количество Optin bytes?
read_option_bytes_loop:
_924:	lw	a0,-1500(gp) # a0 = [0x2000'025c]
	lw	a3,cmd_reply_ptr # a3 = [0x2000'0058]
	lbu	a1,0(a5) # a1 = opt_byte[i]
	add	a3,a3,a0
	sb	a1,0(a3)
	lw	a3,-1500(gp) # a3 = [0x2000'025c]
	add	a3,a3,1
	sw	a3,-1500(gp) # [0x2000'025c] = a3
	andi	a3,a4,(1<<3)
	  bnez	a3, add_a5_2 # if a4 > 7 
	addi	a5,a5,1
add_a5_2_end:
	addi	a4,a4,1
	  bne	a4,a2, read_option_bytes_loop
	j READ_CONFIG_OPTION_BYTES_END

add_a5_2:
_950:	add	a5,a5,2
	j add_a5_2_end


# a3 = cmd_request_ptr->b[3], reason. 0 for normal, 1 for config set
CMD_ISP_END:
_954:	li	a5,1
	  bne	a3,a5, CMD_ISP_END_NORMAL
	li	a4,-128
	sb	a4,cmd_return_code # [0x2000'0278] = 0x80 (exit and reset)
CMD_ISP_END_NORMAL:
	li	a4,1
	j _590


TEST_PRODSTR_FAIL:
	li	s2,241
	j PARSECMD_END


read_chipID:
_96c:	lui	a5,0x1ffff
	lbu	a0,1798(a5)  # [0x1fff'f706]
	sb	a0,chipID # [0x2000'0270]
	ret


main:
	add	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)

	jal func_0040_div_8M
	
	li	a0,30
	jal SYSTICK_DELAY_54
	jal read_chipID #[0x2000'0270] = [0x1ffff706]
	
	sb	zero,-1495(gp) # [0x2000'0261] = 0
	jal UART_init
	lbu	a4,chipID
	li	a5,0x4F # USB-HS только у v305 (код 0x50) и v307 (код 0x70-0x73)
	  bgeu	a5,a4, skip_USBHD_init # if ChipID <= 0x4f then goto чуть вниз
	jal USBHD_init
	li	a5,0xe000e000
	li	a4,(1<<(85-64)) # (1<<21)
	sw	a4,264(a5) # PFIC_IENR3 = INTEN[85], USBHS
.option norvc
skip_USBHD_init:
	jal	USB_OTG_init
.option rvc
	li	a5,0xe000e000
	li	a4,(1<<(83-64)) # (1<<19)
	sw	a4,264(a5) # PFIC_IENR3 = INTEN[83], OTG_FS
	li	a0,96
	li	s1,0xb000
	li	s0,0xbeef0000
	jal WWDG_CTLR_write #a0=96
	li	s3,0x40003000
	add	s1,s1,-1366 # 0xaaaa
	li	s4,0x40014000
	li	s6,129 # 0x81
	li	s2,0xe000e000
	add	s0,s0,128 # 0xbeef0080
main_loop:
	sw	s1,0(s3) # IWDG_CTLR = 0xaaaa, IWDG reset
	lhu	a5,-2048(s4) # USART1_STATR
	andi	a5,a5,(1<<5) # RXNE
	  beqz	a5, 2f # if(STATR & RXNE == 0), TODO: проверка разрешен ли UART в конфигах?
	jal UART_process
2:	lbu	a5,cmd_return_code # a5 = [0x2000'0278]
	  bne	a5,s6, main_loop # if [0x2000'0278] != 0x81
        ## if cmd_return_code == 0x81 then reset
	sw	s0,72(s2) # PFIC_CFGR = 0xbeef0080 = KEY3 | RSTSYS, system reset
	j main_loop


SystemInit:
	add	sp,sp,-16
	lui	a4,0x5	#a4=0x5000
	sw	s0,8(sp)
	sw	ra,12(sp)
    #WDT
	li a5, 0x40003000 # IWDG
	#allow modify WDT
	add	a4,a4,0x555 # a5=0x5555
	sw	a4,0(a5) # IWDG_CTLR = 0x5555
	#Prescaler = 1/256 = (40 kHz / 256) = 156.25 Hz = 6.4ms
	li	a4,0b110
	sw	a4,4(a5) # IWDG_PSCR = 0x6 -> F_LSI/256
	#RLDR = max value (он 12-битный)
	li	a4, 0xfff
	sw	a4,8(a5) # IWDG_RLDR = 0xfff -> 26s
	#load the RLDR
	li	a4, 0xaaaa
	sw	a4,0(a5)# IWDG_CTLR = 0xaaaa, IWDG reset
	
    #RCC
	li	s0, 0x40021000 # RCC
	lw	a5,0(s0)
	li	a4,0xf8ff0000
	li	a1,0x00280000
	ori	a5,a5,1
	sw	a5,0(s0) # RCC_CTRL |= HSION
	
	lw	a5,4(s0)
	li	a0,0
	and	a5,a5,a4
	sw	a5,4(s0) # RCC_RCC_CFGR0 &=~(MCO_msk | ACDPRE_msk | PPRE2_msk | PPRE1_msk | HPRE_msk | SWS_msk | SW_msk)
	
	lw	a5,0(s0)
	li	a4, ~((1<<24) | (1<<19) | (1<<16))
	and	a5,a5,a4
	sw	a5,0(s0) # RCC_CTRL &=~ (PLLON | CSSON | HSEON)
	
	lw	a5,0(s0)
	li a4,	~(1<<18) # HSEBYP
	and	a5,a5,a4
	sw	a5,0(s0) # RCC_CTRL &=~(HSEBYP)
	
	lw	a5,4(s0)
	li a4, ~((1<<22) | (0b1111<<18) | (1<<17) | (1<<16))
	and	a5,a5,a4
	sw	a5,4(s0) # RCC_RCC_CFGR0 &=~((0b01<<USBPRE) | PLLMUL_msk | PLLXTPRE | PLLSRC))
	
	li	a5,0x009f0000
	li	a4,0x40024000
	sw	a5,8(s0) # RCC_INTR = CSSC | PLLRDYC | HSERDYC | HSIRDYC | LSERDYC | LSIRDYC

	lw	a5,-2048(a4) # 0x40023800
	ori	a5,a5,(1<<4)
	sw	a5,-2048(a4) # EXTEN_CTR |= (HSIPRE)
	
	jal RCC_CFGR_pllconf #a0=0 a1=0x00280000 = (0b1010<<PLLMUL)=input*12

	li	a5, 0x5b8d800
	sw	a5,SystemCoreClock # [0x20000040]

	lw	a5,0(s0)
	li	a4, (1<<24)
	or	a5,a5,a4
	sw	a5,0(s0) #RCC_CTRL |= PLLON
	
	#RCC
	li	a5,0x40021000
PLLRDY_WAIT:
	lw	a4,0(a5)
	slli	a3,a4,6
	  bgez	a3, PLLRDY_WAIT
	
	lw	a4,4(a5)
        lw	ra,12(sp)
        lw	s0,8(sp)
	andi	a4,a4,~(0b11)
	sw	a4,4(a5) # RCC_CFGR0 &=~ SW_msk

        lw	a4,4(a5)
	ori	a4,a4,(0b10)
	sw	a4,4(a5) # RCC_CFGR0 |= (SW_PLL)

	add	sp,sp,16
	ret


UART_getc:
_ac6:	lui	a4,0x40014
WAIT_UART_RXNE:
	lhu	a5,-2048(a4) # 0x40013800, USART1_STATR
	andi	a5,a5,(1<<5) #RXNE
	  beqz	a5, WAIT_UART_RXNE
	lhu	a0,-2044(a4) # 0x40013804, USART1_DATAR
	andi	a0,a0,0xFF
	ret

UART_putc: # a0 - data
_ade:	lui	a4,0x40014
WAIT_UART_TC:
	lhu	a5,-2048(a4) # 0x40013800, USART1_STATR
	and	a5,a5,(1<<6) #TC
	  beqz	a5, WAIT_UART_TC
	sll	a0,a0,16 #занулить старшие 16 бит. WTF?
	srl	a0,a0,16
	sh	a0,-2044(a4) # 0x40013804, USART1_DATAR
	ret


UART_process:
_af6:	add	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	
	jal UART_getc
	li	a5,0x57
	  bne	a0,a5, _ca2
	jal UART_getc
	li	a5,0xAB
	  bne	a0,a5,UART_process_end
	add	a5,gp,-1400 # a5 = 0x2000'02c0
	sw	a5,cmd_request_ptr # cmd_request_ptr = 0x2000'02c0
	jal UART_getc
	lw	s2,cmd_request_ptr
	sb	a0,-1400(gp) # [0x2000'02c0] = UART_getc()
	lbu	s0,0(s2) # s0 = cmd_request_ptr->b[0], cmd
	jal UART_getc
	sb	a0,1(s2) # cmd_request_ptr->b[1] = UART_getc(), size_lo
	lw	s2,cmd_request_ptr
	lbu	a5,1(s2) # a5 = cmd_request_ptr->b[1]
	add	s0,s0,a5 # s0 = cmd + size_lo
	jal UART_getc
	sb	a0,2(s2) # cmd_request_ptr->b[2] = UART_getc(), size_hi
	lw	a5,cmd_request_ptr
	andi	s0,s0,0xFF
	li	s2,0
	lbu	a5,2(a5) # a5 = cmd_request_ptr->b[2], size_hi
	add	s0,s0,a5
	andi	s0,s0,0xFF
_b56:	lw	s3,cmd_request_ptr
	lbu	a5,1(s3) # a5 = cmd_request_ptr->b[1], size_lo
	  bne	a5,s2, _c0e
	jal UART_getc
	  bne a0,s0, _c64
	add	a5,gp,-1464 # a5 = 0x2000'0280
	sw	a5,cmd_reply_ptr # [0x2000'0058] = 0x2000'0280
        jal cmd_parse
	li	a0,0x55
	jal UART_putc
	li	a0,0xAA
	jal UART_putc
	li	s0,0
	li	s1,0
_b82:	lw	a5,-1500(gp) # a5 = [0x2000'025c]
	  bltu	s0,a5, _c30	#0af46563
	mv	a0,s1
	jal UART_putc
	lbu	a3,cmd_return_code # a3 = [0x2000'0278]
	li	a4,128 # 0x80
	  bne	a3,a4, _bb0
	lui	a3,0x40014
USART_WAIT_TC:
	lhu	a4,-2048(a3) # USART1_STATR
	andi	a4,a4,(1<<6) # TC
          beqz a4, USART_WAIT_TC
	li	a4,-127
	sb	a4,cmd_return_code # [0x2000'0278] = 0x81
_bb0:	lbu	s0,-1471(gp) # s0 = [0x2000'0279]
	mv	s1,a5 
	  beqz	s0, UART_process_end_0050_clr
	li	a4,0x40014000
USART_WAIT_TC2:	lhu	a5,-2048(a4) # USART1_STATR
	andi	a5,a5,(1<<6) # TC
	  beqz a5, USART_WAIT_TC2
	lw	a0,SystemCoreClock # [0x2000'0040]
	jal WTF_bitscount_func
	li	a5,1
	mv	s2,a0
	  bne s0,a5, _c54 # [0x2000'0279] != 1
.option norvc
	li	a5,0x2000
.option rvc
	lw	a1,-300(a5) # a1 = [0x1ed4] (=0x49e10000)
_bde:	jal _18e4
	jal _1ca4
	slli	a0,a0,16
	srli	a0,a0,16 # a0 &= 0xFFFF
	slli	a0,a0,4 # a0 <<= 4
	slli	a0,a0,16
	srli	a0,a0,16 # a0 &= 0xFFFF
	lui	a5,0x40014
	sh	a0,-2040(a5) # USART1_BRR = a0
	sb	zero,-1471(gp) # [0x2000'0279] = 0
UART_process_end_0050_clr:
	sb	zero,-2024(gp) # [0x0000'0050] = 0
UART_process_end:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	add	sp,sp,32
	ret

_c0e:	jal UART_getc
	lw	a5,cmd_request_ptr
	add	s3,s3,s2
	sb	a0,3(s3)
	add	a5,a5,s2
	lbu	a5,3(a5)
	add	s2,s2,1
	sll	s2,s2,16
	add	s0,s0,a5
	andi	s0,s0,255
	srli	s2,s2,16
	j _b56
	
	
_c30:	lw	a5,cmd_reply_ptr # a5 = [0x2000'0058]
	add	a5,a5,s0
	lbu	a0,0(a5)
	jal UART_putc
	lw	a5,cmd_reply_ptr # a5 = [0x2000'0058]
	add	a5,a5,s0
	lbu	a5,0(a5)	
	add	s0,s0,1
	slli	s0,s0,16
	add	s1,s1,a5
	andi	s1,s1,255
	srli	s0,s0,16
	j _b82


_c54:	lw	a0,-1468(gp) # a0 = [0x2000'027c]
	slli	a0,a0,4
	jal WTF_bitscount_func
	mv	a1,a0
	mv	a0,s2
	j _bde
	
	
_c64:	li	a0,0x55
	jal UART_putc
	li	a0,0xAA
	jal UART_putc
	lw	a5,cmd_request_ptr
	lbu	a0,0(a5)
	jal UART_putc
	li	a0,0
	jal UART_putc
	li	a0,2
	jal UART_putc
	li	a0,0
	jal UART_putc
	li	a0,0xF2 # 242
	jal UART_putc
	li	a0,0
	jal UART_putc
	lw	a5,cmd_request_ptr
	lbu	a0,0(a5)
	add	a0,a0,-12
	andi	a0,a0,0xFF
	jal UART_putc
	j UART_process_end_0050_clr
	
	
#a0 = uart_getc
_ca2:	add	a4,gp,-2024 # a4 = 0x2000'0050
	lbu	a5,0(a4) # a5 = [0x2000'0050]
	add	a5,a5,1
	andi	a5,a5,0xFF
	sb	a5,0(a4) # inc [0x2000'0050] mod 0xFF
	andi	a5,a5,0xFC # clear bits 0,1
.option norvc
	beqz	a5,UART_process_end
	lw	a0,SystemCoreClock # a0 = [0x2000'0040]
	jal WTF_bitscount_func
	li	a5,0x2000
.option rvc
	lw	a1,-300(a5) # a1 = [0x1ed4] (=0x49e10000)
	jal _18e4
	jal _1ca4
	slli	a0,a0,4
	slli	a0,a0,16
	srli	a0,a0,16
	lui	a5,0x40014
	sh	a0,-2040(a5) # [0x40013808] = a0
	j UART_process_end


UART_init:
_ce4:	lw	a0,SystemCoreClock # 0x2000'0040
	add	sp,sp,-16
	sw	ra,12(sp)
	jal WTF_bitscount_func
.option norvc
	li	a5, 0x2000
.option rvc
	lw	a1,-300(a5) # a1 = [0x1ed4] (=0x49e10000)
	jal _18e4
	jal _1ca4
	li	a3,0x40021000
	lw	a5,24(a3) # RCC_APB2PCENR
	li	a4,(1<<14 | 1<<2)
	or	a5,a5,a4
	sw	a5,24(a3) # RCC_APB2PCENR |= USART1EN | IOPAEN
	li	a5,0x40011000
	lw	a4,-2044(a5) # GPIOA_CFGHR
	li	a3, ~((0b1111<<((UART_RX-8)*4)) | (0b1111<<((UART_TX-8)*4))) # 0xfffff00f
	and	a4,a4,a3
	sw	a4,-2044(a5) # clear GPIOA_CFGHR( UART_TX, UART_RX )
	lw	a4,-2044(a5)
	li	a3,((GPIO_PUP<<((UART_RX-8)*4)) | (GPIO_APP50<<((UART_TX-8)*4))) # 0x8b0
	slli	a0,a0,4
	or	a4,a4,a3
	slli	a0,a0,16
	sw	a4,-2044(a5) #GPIOA config( UART_TX, UART_RX )
	srl	a0,a0,16
	li	a5,0x40014000
	sh	a0,-2040(a5) # USART1_BRR = a0
	lhu	a3,-2036(a5) # USART1_CTLR1
	lui	a4,0x2
	lw	ra,12(sp)
	add	a4,a4,12 # (1<<13 | 1<<3 | 1<<2)
	or	a4,a4,a3
	sh	a4,-2036(a5) # USART1_CTLR1 |= a3 | UE | TE | RE
	add	sp,sp,16
	ret


	
_d52:	lw	a4,SystemCoreClock # a4 = [0x2000'0040]
	add	sp,sp,-16
	li	a5,0x5b8e000
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	add	a5,a5,-2048 # 96M
	  bne a4,a5, SYS_CLOCK_NOT_96M
SYS_CLOCK_96M:
	li	a0,0
	jal RCC_CFGR2_USB_CLOCK_SRC #a0=0 => PLL
	li	a0,1 # a0=1 => 1:2(if F_CPU=69)
_d72:	jal RCC_CFGR0_USBPRE # a0=0 1:1(if F_CPU=48MHz), a0=1 1:2(if F_CPU=69), a0=2 1:3(if F_CPU=144)
_d76:	li	a0,1
	jal RCC_CFGR2_USBPLL_EN # a0=1 - enable
	lui	a0,0x1
	li	a1,1
	add	a0,a0,-2048 # USBHSEN
	jal RCC_AHBPCENR_APPLY_MASK # RCC_AHBPCENR |= USBHSEN
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	li	a1,1
	li	a0,(1<<12)
	add	sp,sp,16
	j RCC_AHBPCENR_APPLY_MASK # RCC_AHBPCENR |= OTG_FSEN
SYS_CLOCK_NOT_96M:
	li a5, 48000000
	  bne a4,a5, SYS_CLOCK_NOT_48M
SYS_CLOCK_48M:
_da4:	li	a0,0
	jal RCC_CFGR2_USB_CLOCK_SRC #a0=1-USB PHY, 0-PLL
	li	a0,0
	j _d72 # RCC_CFGR0_USBPRE, a0=0 => 48 MHz
SYS_CLOCK_NOT_48M:
	lui	s0,0x20000
	lbu	a5,60(s0) # a5 = [0x2000'003c]
	li	s1,3
	remu	a4,a5,s1 # a4 = [0x2000'003c] % 3 # TODO: (253%3) = 1
	  bnez a4, _dda
	li	a0,1
	jal RCC_CFGR2_USB_CLOCK_SRC #a0=0 - PLL
	lbu	a0,60(s0) # a0 = [0x2000'003c]
	divu	a0,a0,s1
	add	a0,a0,-1 # a0 = ([0x2000'003c] / 3) - 1
	jal RCC_CFGR2_USBHSDIV # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
	li	a0,0 # RCC_CFGR2_USBHSCLK, 3 MHz
RCC_CFGR2_USBHSCLK_1:
	jal RCC_CFGR2_USBHSCLK
	j _d76
_dda:	andi	a4,a5,0b11
	  bnez a4, _df6
	li	a0,1
	jal RCC_CFGR2_USB_CLOCK_SRC
	lbu	a0,60(s0) # a0 = [0x2000'003c]
	srli	a0,a0,2
	add	a0,a0,-1
	jal RCC_CFGR2_USBHSDIV # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
	li	a0,1 # RCC_CFGR2_USBHSCLK, 4 MHz
	j RCC_CFGR2_USBHSCLK_1
	
	
_df6:	li	s1,5
	remu	a5,a5,s1 # a5 = [0x2000'003c] % 5 # TODO: (253%5 = 3)
	  bnez a5, SYS_CLOCK_48M
	li	a0,1
	jal RCC_CFGR2_USB_CLOCK_SRC #a0=0 => PLL
	lbu	a0,60(s0) # a0 = [0x2000'003c]
	divu	a0,a0,s1 # a0 /= 5
	add	a0,a0,-1
	jal RCC_CFGR2_USBHSDIV # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
	li	a0,3 # # RCC_CFGR2_USBHSCLK, 5 MHz
	j RCC_CFGR2_USBHSCLK_1



OTG_FS_IRQHandler:
	add	sp,sp,-32
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	sw	s4,12(sp)
	li	s0,0x50000000
	lbu	a5,6(s0) # a5 = USB_INT_FG
	andi	a5,a5,0xFF
	andi	a4,a5,(1<<1) # UIF_TRANSFER
	  beqz	a4, _10ee
OTG_UIF_TRANSFER:
	lbu	a5,7(s0) # USB_INT_ST
	li	a4,(0b10<<4)
	andi	a5,a5,(0b11<<4)
	  beq	a5,a4, OTG_UIS_TOKEN_IN # UIS_TOKEN == 0b10 - IN
	li	a4,(0b11<<4)
	  beq	a5,a4, OTG_UIS_TOKEN_SETUP # UIS_TOKEN == 0b11 - setup
	  bnez	a5, OTG_TOKEN_IGNORE # UIS_TOKEN - SOF
OTG_UIS_TOKEN_OUT:
_e50:	lbu	a5,7(s0) # USB_INT_ST
	li	a4,2
	andi	a5,a5,0b00111111 # ~(MASK_UIS_TOKEN | MASK_UIS_ENDP)
	  bne	a5,a4, OTG_TOKEN_IGNORE # not EP2_OUT
OTG_EP2_OUT:
	lbu	a5,7(s0) # USB_INT_ST
	andi	a5,a5,(1<<6) # UIS_TOG_OK
	  beqz	a5, OTG_TOKEN_IGNORE
	lw	a5,usbotg_ep2_ptr # a5 = [0x2000'030c]
	sw	a5,cmd_request_ptr # cmd_request_ptr = [0x2000'030c]
	add	a5,a5,64
	sw	a5,cmd_reply_ptr # [0x2000'0058] = cmd_request_ptr + 64
	jal cmd_parse
	lhu	a5,-1500(gp) # a5 = [0x2000'025c]
	sh	a5,56(s0) # UEP2_T_LEN = [0x2000'025c]
	lbu	a5,58(s0) # UEP2_TX_CTRL
	andi	a5,a5,0b11111100
	sb	a5,58(s0) # UEP2_TX_CTRL &=~ UEP_T_RES, data is ready
	j OTG_TOKEN_IGNORE


OTG_UIS_TOKEN_SETUP: # s0=0x50000000
_e92:	li	a5,0b110
	sb	a5,50(s0) # UEP0_TX_CTRL = (UEP_T_TOG | ans 'NAK')
	li	a5,4
	sb	a5,51(s0) # UEP0_RX_CTRL = UEP_R_TOG
	lw	a0,usbotg_ep0_ptr # a0 = [0x2000'0310]
	lbu	a4,7(a0)
	lbu	a5,6(a0)
	slli	a4,a4,8
	or	a4,a4,a5 # a4 = setup.wLength
	sh	a4,-1334(gp) # [0x2000'0302] = a4
	lbu	a5,1(a0) # a5 = setup.bRequest
	sb	a5,-1332(gp) # [0x2000'0304] = a5
	lbu	s3,0(a0) # s3 = setup.bmRequestType
	andi	s2,s3,(0b11<<5)
	  bnez	s2, OTG_REQUEST_ERR
OTG_UIS_SETUP_STD: # s2=0
	li	a2,10
	  bltu	a2,a5, OTG_REQUEST_ERR # если номер bRequest > 10 - ошибка
	lui	a2,0x2
	slli	a5,a5,2 # (setup.bRequest * 4)
	add	a2,a2,-296 # a2 = usbotg_std_requests_table
	add	a5,a5,a2
	lw	a5,0(a5) # a5 = usbotg_std_requests_table[bRequest]
	jr	a5
	
OTG_GET_DESCRIPTOR:
_eda:	lbu	a5,3(a0) # a5 = setup.wValue_lo ?
	li	a3,1
	  beq	a5,a3, OTG_GET_DESCRIPTOR_DEVICE
	li	a3,2
	  beq	a5,a3, OTG_GET_DESCRIPTOR_CONFIGURATION

OTG_REQUEST_ERR:
_eea:	lui	a5,0x50000
	li	a4,7 # or 4
_ef0:	sb	a4,50(a5) # UEP0_TX_CTRL = UEP_R_TOG | (ans 'error'(7) or ACK(4))
	sb	a4,51(a5) # UEP0_RX_CTRL = UEP_R_TOG | (ans 'error'(7) or ACK(4))
OTG_TOKEN_IGNORE:
_ef8:	lui	a5,0x50000
	li	a4,(1<<1) # UIF_TRANSFER
	sb	a4,6(a5) # USB_INT_FG |= UIF_TRANSFER
OTG_FS_IRQHandler_end:
_f02:	lw	s0,28(sp)
	lw	s1,24(sp)
	lw	s2,20(sp)
	lw	s3,16(sp)
	lw	s4,12(sp)
	add	sp,sp,32
	mret


OTG_GET_DESCRIPTOR_DEVICE: #a4=setup.wLength
_f12:	li	a5,0x20000020 # USB device descriptor
	sw	a5,-1328(gp) # [0x2000'0308] = 0x2000'0020
	lbu	a5,0(a5) # a5 = descr.bLength or config.TotalLength
OTG_GET_DESCR_TEST_LEN:
	slli	a5,a5,16
	srli	a5,a5,16 # a5 &= 0xFFFF
	  bgeu	a5,a4, OTG_LEN_TRUNCATE #if descr.length > setup.wLength goto ...
	sh	a5,-1334(gp) # [0x2000'0302] = descr.length
OTG_LEN_TRUNCATE:
	lhu	a5,-1334(gp) # a5 = [0x2000'0302]
	li	a4,64
	  bgeu	a4,a5, OTG_64b_SPLIT
	li	a5,64
OTG_64b_SPLIT:
	slli	s1,a5,16
	lw	a1,-1328(gp) # [0x2000'0308]
	srli	s1,s1,16 # s1 = (a5 & 0xFFFF) Зачем? a5 и так максимум 64
	andi	a2,s1,0xFF # a2 = (a5 & 0xFF)
	# a0 = usbotg_ep0_ptr, a1=[0x2000'0308]
	jal memcpy  # a0 - dst, a1 - src, a2 - count
	lw	a5,-1328(gp) # [0x2000'0308]
	add	a5,a5,s1 # EP0_buf_ptr += length
	sw	a5,-1328(gp) # [0x2000'0308]
OTG_SETUP_REPLY:
_f5a:	slli	s3,s3,24 # s3 = bmRequestType
	srai	s3,s3,24
	  bgez s3, OTG_SETUP_END # bmRequestType: OUT, set UEP0_T_LEN=0
        #IN
	lhu	a5,-1334(gp) # a5 = [0x2000'0302], descr.length
	li	a3,64
	mv	a4,a5
	  bgeu	a3,a5, OTG_64b_SPLIT2
	li	a4,64 # if transmission size > 64 then set 64
OTG_64b_SPLIT2:
	slli	a4,a4,16
	srli	a4,a4,16 # a4 &= 0xFFFF
	sub	a5,a5,a4
	andi	s2,a4,0xFF
	sh	a5,-1334(gp) # [0x2000'0302] = a5
OTG_SETUP_END:
	slli	s2,s2,16
	srli	s2,s2,16 # s2 &= 0FFFF (зачем? он и так не больше 64)
	li	a5,0x50000000
	sh	s2,48(a5) # UEP0_T_LEN = count min(length or 64)
	li	a4,4
	j _ef0


OTG_GET_DESCRIPTOR_CONFIGURATION:
_f96:	li	a5,0x20000000
.option norvc
	mv	a5,a5
.option rvc
	sw	a5,-1328(gp) # [0x2000'0308] = 0x2000'0000
	lbu	a5,2(a5) # 0x20000002, wTotalLength_lo?
	j OTG_GET_DESCR_TEST_LEN
	

OTG_SET_ADDRESS:
_fa8:	lbu	a4,2(a0) # a4 = setup.wValue_lo
	sb	a4,-2023(gp) # [0x2000'0051] = setup.wValue
	j OTG_SETUP_REPLY

	
OTG_GET_CONFIGURATION:
_fb2:	lbu	a5,usb_configuration # a5 = [0x2000'0300]
	sb	a5,0(a0)
_fba:	lhu	a4,-1334(gp) # a4 = [0x2000'0302]
	li	a5,1
	  bgeu a5,a4, OTG_SETUP_REPLY
	li	a5,1 # or 2
_fc6:	sh	a5,-1334(gp) # [0x2000'0302] = a5
	j OTG_SETUP_REPLY
	
	
OTG_SET_CONFIGURATION:
_fcc:	lbu	a4,2(a0)
	sb	a4,usb_configuration # [0x2000'0300] = a4
	j OTG_SETUP_REPLY


OTG_CLEAR_FEATURE:
_fd6:	andi	a4,s3,31
	li	a5,2
	  bne	a4,a5, OTG_REQUEST_ERR
	lbu	a5,4(a0) # a5 = setup.wIndex
	  beq	a5,a4, _1006 #
	li	a4,(1<<7 | 2)
	  bne	a5,a4, OTG_REQUEST_ERR
	li	a4,0x50000000
	lbu	a5,58(a4) # UEP2_TX_CTRL
	andi	a5,a5,248 # ~(RB_UEP_T_TOG | MASK_UEP_T_RES)
	ori	a5,a5,2 # 10: Answer NAK or busy
	sb	a5,58(a4) # UEP2_TX_CTRL: DATA0 | NAK
	j OTG_SETUP_REPLY


_1006:	li	a4,0x50000000
	lbu	a5,59(a4) # UEP2_RX_CTRL
	andi	a5,a5,248
	sb	a5,59(a4) # UEP2_RX_CTRL &=~ ~(UEP_R_TOG | UEP_R_RES)
	j OTG_SETUP_REPLY

	
OTG_GET_INTERFACE:
_1018:	sb	zero,0(a0) # return {0}
	j _fba


OTG_GET_STATUS:
_101e:	sb	zero,0(a0)
	lw	a5,usbotg_ep0_ptr # a5 = [0x2000'0310]
	sb	zero,1(a5) # usbotg_ep0_ptr->b[1] = 0
	lhu	a4,-1334(gp) # a4 = [0x2000'0302], setup.wLength
	li	a5,2
	  bgeu a5,a4, OTG_SETUP_REPLY
	j _fc6
	
	
OTG_UIS_TOKEN_IN:
_1036:	lbu	a4,7(s0)
	andi	a4,a4,63
	  beq a4,a5, _1070
	li	a5,34
	  bne a4,a5, OTG_TOKEN_IGNORE
	lbu	a5,58(s0)
	li	a4,128 # 0x80
	andi	a5,a5,252
	ori	a5,a5,2
	sb	a5,58(s0)
	lbu	a3,cmd_return_code # a3 = [0x2000'0278]
	  bne a3,a4, OTG_TOKEN_IGNORE
	li	a4,-127
	sb	a4,cmd_return_code # [0x2000'0278] = 0x81
	j OTG_TOKEN_IGNORE


_1070:	lbu	a5,-1332(gp) # a5 = [0x2000'0304]
	li	a4,5
	  beq a5,a4, _10d4
	li	a4,6
	  bne a5,a4, _10e6
	lhu	s1,-1334(gp) # s1 = [0x2000'0302]
	li	a5,64
	  bgeu a5,s1, _1090
	li	s1,64
_1090:	lw	a0,usbotg_ep0_ptr # a0 = [0x2000'0310]
	slli	s3,s1,16
	lw	a1,-1328(gp) # a1 = [0x2000'0308]
	srli	s3,s3,16
	andi a2,s3,0xFF
	jal memcpy  # a0 - dst, a1 - src, a2 - count
	lhu	a5,-1334(gp) # a5 = [0x2000'0302]
	sub	a5,a5,s3
	sh	a5,-1334(gp) # [0x2000'0302] = a5
	lw	a5,-1328(gp) # a5 = [0x2000'0308]
	add	a5,a5,s3
	sw	a5,-1328(gp) # [0x2000'0308] = a5
	li	a5,0x50000000
	sh	s1,48(a5) # 0x50000030, UEP0_T_LEN
	lbu	a4,50(a5) # 0x50000032, UEP0_TX_CTRL
	xori	a4,a4,4
	sb	a4,50(a5) # 0x50000032, UEP0_TX_CTRL
	j OTG_TOKEN_IGNORE


_10d4:	lbu	a5,3(s0)
	lbu	a4,-2023(gp) # a4 = [0x2000'0051]
	andi	a5,a5,128
	or	a5,a5,a4
	sb	a5,3(s0)
_10e6:	li	a5,2
	sb	a5,50(s0)
_10ec:	 j OTG_TOKEN_IGNORE


_10ee:	andi	a4,a5,1
	  beqz a4, _111c
	sb	zero,3(s0)
	sb	zero,51(s0)
	li	a5,8
	sb	a5,59(s0)
	li	a5,2
	sb	a5,50(s0)
	li	a5,10
	sb	a5,58(s0)
	lbu	a5,6(s0)
	ori	a5,a5,1
_1116:	sb	a5,6(s0)
	j OTG_FS_IRQHandler_end


_111c:	and	a4,a5,4
	beqz a4, _1116
	li	a5,4
	j _1116
	

USB_OTG_init:
_1126:	add	sp,sp,-16
	sw	ra,12(sp)
	jal _d52
	li	a0,100
.option norvc
	jal	SYSTICK_DELAY_56
.option rvc
	li	a5,0x50000000
	sb	zero,0(a5) # 0x50000000, USB_CTRL
	li	a4,12
	sb	a4,13(a5)
	add	a3,gp,-1316
	sw	a3,usbotg_ep0_ptr # [0x2000'0310] = a3
	add	a4,gp,-1252
	sw	a4,usbotg_ep2_ptr # [0x2000'030c] = 0x2000'0354
	sw	a3,16(a5) # UEP0_DMA = 0x2000'0314
	sw	a4,24(a5) # UEP2_DMA = 0x2000'0354
	sb	zero,51(a5) # UEP0_RX_CTRL = 0
	sb	zero,59(a5) # UEP2_RX_CTRL = 0 
	li	a4,2
	sb	a4,50(a5) # UEP0_TX_CTRL = 2 
	li	a4,8
	sb	a4,58(a5) # UEP2_TX_CTRL = 8 
	li	a4,-1
	sb	a4,6(a5)  # USB_INT_FG = 0xFF -clear all flags 
	li	a4,7
	sb	a4,2(a5) # USB_INT_EN = 0b111 = int en, transfer, suspend 
	sb	zero,3(a5) # USB_DEV_AD = 0
	li	a4,41
	sb	a4,0(a5) # USB_CTRL = UC_DEV_PU_EN | UC_INT_BUSY | UC_DMA_EN
	li	a4,-127 # (1<<0 | 1<<7)
	sb	a4,1(a5) # UDEV_CTRL = UD_PD_DIS | UD_PORT_EN
	li	a4,0x40024000
	lw	a5,-2048(a4) # EXTEN_CTR
	lw	ra,12(sp)
	ori	a5,a5,(1<<1)
	sw	a5,-2048(a4) # EXTEN_CTR |= USBDPU
	add	sp,sp,16
	ret


_11a0:	add	sp,sp,-16
	sw	s0,8(sp)
	lui	s0,0x20000
	lbu	a5,60(s0) # a5 = [0x2000'003c]
	sw	s1,4(sp)
	li	s1,3
	remu	a4,a5,s1 # a4 = a5 % 3
	sw	ra,12(sp)
	  bnez	a4, _11f0
	li	a0,0
	jal RCC_CFGR2_USBHSPLLSRC # a0=0 HSE
	lbu	a0,60(s0)
	divu	a0,a0,s1
	add	a0,a0,-1
	jal RCC_CFGR2_USBHSDIV # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
	li	a0,0 # RCC_CFGR2_USBHSCLK, 3 MHz
RCC_CFGR2_USBHSCLK_2:
	jal RCC_CFGR2_USBHSCLK
	li	a5,0x40021000
	lw	a4,44(a5) # RCC_CFGR2
	li	a3,(1<<30)
	lw	ra,12(sp)
	or	a4,a4,a3
	sw	a4,44(a5) # RCC_CFGR2 |= USBHSPLL, USB PHY internal PLL enabled
	lw	a4,20(a5) # RCC_AHBPCENR
	li	a3,0x1000
	lw	s0,8(sp)
	add	a3,a3,-2048 # 0x800 = (1<<11)
	or	a4,a4,a3
	sw	a4,20(a5) # RCC_AHBPCENR |= USBHSEN
	lw	s1,4(sp)
	add	sp,sp,16
	ret


_11f0:	and	a4,a5,3
	  bnez a4, _1208
	li	a0,0
	jal RCC_CFGR2_USBHSPLLSRC # a0=0 HSE
	lbu	a0,60(s0)
	srli	a0,a0,2
	addi	a0,a0,-1
_1202:	jal RCC_CFGR2_USBHSDIV # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
	li	a0,1 # RCC_CFGR2_USBHSCLK, 4 MHz
	j RCC_CFGR2_USBHSCLK_2


_1208:	li	s1,5
	remu	a5,a5,s1
	  bnez a5, _1224
	li	a0,0
	jal RCC_CFGR2_USBHSPLLSRC # a0=0 HSE
	lbu	a0,60(s0)
	divu	a0,a0,s1
	add	a0,a0,-1
	jal RCC_CFGR2_USBHSDIV # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
	li	a0,3 # RCC_CFGR2_USBHSCLK, 5 MHz
	j RCC_CFGR2_USBHSCLK_2


_1224:	li	a0,1
	jal RCC_CFGR2_USBHSPLLSRC # a0=1 HSI
	li	a0,1
	j _1202


#TODO: usb set device address?
_122c:	lui	a4,0x40023
	lw	a5,1024(a4) # a5 = (uint32_t)USB_CTRL
	slli	a0,a0,24
	slli	a5,a5,8
	srli	a5,a5,8
	sw	a5,1024(a4) # clear USB_DEV_AD (device address)?
	lw	a5,1024(a4)
	or	a0,a0,a5
	sw	a0,1024(a4) # USB_DEV_AD = a0
	ret


USBHS_IRQHandler:
	add	sp,sp,-32
	sw	s0,28(sp)
	li	s0,0x40023400
	lw	a5,8(s0) # a5 = (uint32_t)USB_SPEED_TYPE
	sw	s1,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	sw	s4,12(sp)
	slli	a4,a5,14
	li	s1,(1<<17)
	  bgez a4, _1390 #bit 1 cleared, видимо, USB_INT_FG.UIF_TRANSFER
        #transfer complete
	li	a4,(0b11<<28) # 0x30000000
	and	a4,a4,a5
	li	a3,(0b10<<28) # 0x20000000
	  bne a4,a3, _134e # if USB_INT_ST & MASK_UIS_TOKEN != 0b10
        # USB_INT_ST & MASK_UIS_TOKEN == 0b10
	li	a3,0x3f000000 # clear bits 6, 7 = UIS_IS_NAK, UIS_TOG_OK
	and	a5,a5,a3
	  beq a5,a4, _12ac # UIS_ENDP==0 => EPnum == 0
	li	a4,0x22000000 # (1<<29|0b0010<<24)->(1<<5|2)
	  beq a5,a4, _1326 # MASK_UIS_TOKEN != 0b10 && EPnum == 2
	  
_128c:	lui	a5,0x40023
	li	a4,(1<<17) #or (1<<21)   #USB_INT_FG: -16= (1<<1) / (1<<5)
_1294:  # USB_SPEED_TYPE восьмибитный, то есть попадаем куда-то в USB_INT_FG
	# тогда это (1<<1) или (1<<5), то есть
	# UIF_TRANSFER - clear USB transfer completion flag
	# UIF_SETUP_ACT - clear SETUP transaction completion flag
	sw	a4,1032(a5) # USB_SPEED_TYPE=a4
	add	a5,a5,1024
USBHS_IRQHandler_end:
_129c:	lw	s0,28(sp)
	lw	s1,24(sp)
	lw	s2,20(sp)
	lw	s3,16(sp)
	lw	s4,12(sp)
	add	sp,sp,32
	mret


_12ac:	lbu	a5,-1332(gp) # a5 = [0x2000'0304]
	li	a4,5
	andi a5,a5,0xFF
	  beq a5,a4, _131a
	li	a4,6
	  bne a5,a4, _1320
	lhu	s0,-1334(gp) # s0 = [0x2000'0302]
	li	a5,64
	  bgeu a5,s0, _12d0
	li	s0,64
_12d0:	lw	a0,usbhs_ep0_ptr # a0 = [0x2000'03E4]
	sll	s0,s0,16
	lw	a1,-1328(gp) # a1 = [0x2000'0308]
	srli	s0,s0,16
	andi a2,s0,0xFF
	jal memcpy  # a0 - dst, a1 - src, a2 - count
	lhu	a5,-1334(gp)
	li	a3,0xffff0000
	sub	a5,a5,s0
	sh	a5,-1334(gp) # [0x2000'0302] -= s0
	lw	a5,-1328(gp)
	add	a5,a5,s0
	sw	a5,-1328(gp) # [0x2000'0308] += s0
	lui	a5,0x40023
	lw	a4,1240(a5) # UEP0_T_LEN
	and	a4,a4,a3
	or	s0,s0,a4
	sw	s0,1240(a5)
	lw	a4,1240(a5)
	lui	a3,0x80
	xor	a4,a4,a3
	sw	a4,1240(a5)
	j _128c


_131a:	lbu	a0,-2022(gp) # a0 = [0x2000'0052]
	jal _122c
_1320:	sw	s1,216(s0)
	j _128c


_1326:	lw	a5,224(s0)
	li	a4,0xfffcffff
	and	a5,a5,a4
	or	a5,a5,s1
	sw	a5,224(s0)
	lbu	a3,cmd_return_code # a3 = [0x2000'0278]
	li	a4,128 # 0x80
	  bne a3,a4, _128c
	li	a4,-127
	sb	a4,cmd_return_code # [0x2000'0x278] = 0x81
	j _128c


_134e:	bnez a4, _128c
	li	a4,0x3f000000
	and	a4,a4,a5
	li	a3,0x2000000
	  bne a4,a3, _128c
	slli	a4,a5,1
	  bgez a4, _128c
	lw	a5,usbhs_ep2rx_ptr # a5 = [0x2000'03e0]
	sw	a5,cmd_request_ptr # cmd_request_ptr = [0x2000'03e0]
	add	a5,a5,64
	sw	a5,cmd_reply_ptr # [0x2000'0058] = var + 64
	jal cmd_parse
	lw	a5,224(s0)
	li	a4,0xfffc0000
	and	a5,a5,a4
	lw	a4,-1500(gp) # a4 = [0x2000'025c]
	or	a5,a5,a4
	sw	a5,224(s0)
	j _128c


_1390:	slli	a4,a5,10
	  bgez a4, _153a
	li	a5,0x80a0000
	sw	a5,216(s0)
	lw	a0,usbhs_ep0_ptr # a0 = [0x2000'03E4]
	lbu	a4,7(a0)
	lbu	a3,6(a0)
	slli	a4,a4,8
	or	a4,a4,a3 # setup.wLength
	sh	a4,-1334(gp) # [0x2000'0302] = a4
	lbu	a3,1(a0)
	sb	a3,-1332(gp) # [0x2000'0304] = a3
	lbu	s3,0(a0)
	mv	a3,a5
	and	s2,s3,96
	  bnez s2, USBFS_REQUEST_ERR
	lbu	a5,-1332(gp) # a5 = [0x2000'0304]
	li	a2,10
	andi	a5,a5,0xFF
	  bltu a2,a5, USBFS_REQUEST_ERR
	lui	a2,0x2
	slli	a5,a5,2 # a5 = [0x2000'0304] * 4
	add	a2,a2,-252 # 0x1f04, usbhs_std_requests_table
	add	a5,a5,a2 # a5 = usbhs_std_requests_table[bRequest]
	lw	a5,0(a5)
	jr	a5
	
	
USBFS_GET_DESCRIPTOR:
_13e6:	lbu	a5,3(a0) # setup.wValue
	li	a3,1
	  beq a5,a3, _140c
	li	a3,2
	  beq a5,a3, _1490
	  
USBFS_REQUEST_ERR:
_13f6:	lui	a5,0x40023
	li	a4,0xb0b0000
	sw	a4,1240(a5) # 0x400234d8 TX_CTRL=RX_CTRL = Data1 | ans 'stall/error'
_1402:	lui	a5,0x40023
	li	a4,(1<<21)
	j _1294


#TODO: usb get device descriptor?
_140c:	li	a5,0x20000000
	add	a2,a5,32 # 0x20000020 # usb device descriptor
	lbu	a5,32(a5)
	sw	a2,-1328(gp) # [0x2000'0308] = 0x20000020
_141c:	slli	a5,a5,16
	srli	a5,a5,16
	  bgeu a5,a4, _1428
	sh	a5,-1334(gp) # [0x2000'0302] = a5
_1428:	lhu	a5,-1334(gp) # a5 = [0x2000'0302]
	li	a4,64
	  bgeu a4,a5, _1438
	li	a5,64
_1438:	slli	s1,a5,16
	lw	a1,-1328(gp) # a1 = [0x2000'0308]
	srli	s1,s1,16
	andi	a2,s1,0xFF
	jal memcpy  # a0 - dst, a1 - src, a2 - count
	lw	a5,-1328(gp) # a5 = [0x2000'0308]
	add	a5,a5,s1
	sw	a5,-1328(gp) # [0x2000'0308] = a5
_1454:	slli	s3,s3,24
	srai	s3,s3,24
	  bgez s3, _147e
	lhu	a5,-1334(gp) # a5 = [0x2000'0302]
	li	a3,64
	mv	a4,a5
	  bgeu a3,a5, _1470
	li	a4,64
_1470:	slli	a4,a4,16
	srli	a4,a4,16
	sub	a5,a5,a4
	andi s2,a4,0xFF
	sh	a5,-1334(gp) # [0x2000'0302] = a5
_147e:	li	a5,0x8080000
	or	s2,s2,a5
	li	a5,0x40023000
	sw	s2,1240(a5) # UEP0_T_LEN = s2
	j _1402


#TODO: usb get configuration descriptor?
_1490:	li	a5,0x20000000
.option norvc
	mv a5,a5
.option rvc
	sw	a5,-1328(gp) # 0x[0x2000'0308] = 0x2000'0000
	lbu	a5,2(a5) # a5 = [0x20000002]
	j _141c


USBFS_SET_ADDRESS:
_14a2:	lbu	a4,2(a0)
	sb	a4,-2022(gp) # [0x2000'0052] = a4
	j _1454


USBFS_GET_CONFIGURATION:
_14ac:	lbu	a5,usb_configuration # a5 = [0x2000'0300]
	sb	a5,0(a0)
_14b4:	lhu	a4,-1334(gp) # a4 = [0x2000'0302]
	li	a5,1
	  bgeu	a5,a4, _1454
	li	a5,1
_14c0:	sh	a5,-1334(gp) # [0x2000'0302] = 1
	j _1454


USBFS_SET_CONFIGURATION:
_14c6:	lbu	a4,2(a0)
	sb	a4,usb_configuration # [0x2000'0300] = a4
	j _1454


USBFS_CLEAR_FEATURE:
_14d0:	and	a4,s3,31
	li	a5,2
	  bne	a4,a5, _1518
	lbu	a3,4(a0)
	li	a5,0x40023400
	  beq	a3,a4, _150a
	li	a4,130
	  bne a3,a4, USBFS_REQUEST_ERR
	lw	a4,224(a5)
	li	a3,0xffe4ffff
	and	a4,a4,a3
	li	a3,0x20000
	or	a4,a4,a3
_1504:	sw	a4,224(a5)
	j _1454


_150a:	lw	a4,224(a5)
	li	a3,0xe4ffffff
	and	a4,a4,a3
	j _1504


_1518:	beqz a4, _1454
	j USBFS_REQUEST_ERR


USBFS_GET_INTERFACE:
_151c:	sb	zero,0(a0)
	j _14b4
	

USBFS_GET_STATUS:
_1522:	sb	zero,0(a0)
	lw	a5,usbhs_ep0_ptr # a5 = [0x2000'03E4]
	sb	zero,1(a5)
	lhu	a4,-1334(gp) # a4 = [0x2000'0302]
	li	a5,2
	  bgeu a5,a4, _1454
	j _14c0


_153a:	slli	a4,a5,15
	  bgez a4, _1562
	add	a5,gp,-2022 # a5 = 0x2000'0052
	sb	zero,0(a5) # [0x2000'0052] = 0
	lbu	a0,0(a5) # a0 = 0, WTF?
	jal _122c
	li	a5,0x20220000
	sw	s1,216(s0)
	sw	a5,224(s0)
	li	a5,0x10000
_155e:	sw	a5,8(s0)
	j USBHS_IRQHandler_end


_1562:	slli	a4,a5,13
	  bgez	a4, _155e
	li	a5,0x40000
	j _155e


USBHD_init:
_1570:	add	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	jal _11a0
	li	a0,200
	jal SYSTICK_DELAY_56
	li	a5,0x40023000
	sw	zero,1024(a5) # USB_CTRL
	li	a4,0x40021000
	lw	a4,44(a4) # RCC_CFGR2
	slli	a3,a4,4
	li	a4,0x271000
	  bgez a3, USB_CTRL_speed_high # if USBHSPLLSRC==HSE then usb high-speed' else: usb low-speed
	add	a4,a4,9 # 0x271009 or 0x271029
USB_CTRL_speed_set:
	sw	a4,1024(a5) # USB_CTRL = (full/high) speed + DMA
                            # USB_INT_EN = SETUP + RESET + Transfer + Suspend
	lui	s0,0x40023
	li	a4,-1
	sw	a4,1040(s0) # UEP_CONFIG = 0xFFFFFFFF
	li	a4,0x50005
	sw	a4,1040(s0) # UEP_CONFIG = 0x0005'0005: EP2_TX en, EP2_RX en, EP0_TX en, EP0_RX en
	sw	zero,1044(s0) # UEP_TYPE = 0
	sw	zero,1048(s0) # UEP_BUF_MOD = 0
	li	a4,64 # 
	sw	a4,1176(s0) # UEP0_MAX_LEN = 64
	sw	a4,1184(s0) # UEP2_MAX_LEN = 64
	add	a3,gp,-1096
	sw	a3,usbhs_ep0_ptr # [0x2000'03e4] = 0x2000'03f0
	add	a4,gp,-1032
	sw	a4,usbhs_ep2rx_ptr # [0x2000'03e0] = 0x2000'0430
	sw	a3,1052(s0) # UEP0_DMA = 0x2000'03f0
	sw	a4,1060(s0) # UEP2_RX_DMA = 0x2000'0430
	add	a4,gp,-968
	sw	a4,1120(s0) # UEP2_TX_DMA = 0x2000'0470
	li	a4,0x20000 # (1<<17)
	sw	a4,1240(s0) # UEP0_T_LEN=0, UEPn_TX_CTRL = 'ans NAK'
	li	a4,0x20220000 # 
	sw	a4,1248(s0) # 0x400234E0, UEP2_T_LEN=0
	                    # UEP2_TX_CTRL = UEP_T_TOG_AUTO | ans 'NAK'
	                    # UEP2_RX_CTRL = UEP_R_TOG_AUTO
	li	a0,10
	jal SYSTICK_DELAY_56
	lw	a5,1024(s0) # USB_CTRL
	lw	ra,12(sp)
	ori	a5,a5,(1<<4)
	sw	a5,1024(s0) # USB_CTRL |= UC_DEV_PUP_EN, pullup
	lw	s0,8(sp)
	add	sp,sp,16
	ret


USB_CTRL_speed_high:	add	a4,a4,41
	j USB_CTRL_speed_set

/*  Default IRQ handlers */

	_weak_NMI_Handler:1:	j 1b
	_weak_HardFault_Handler:1:	j 1b
Ecall_M_Mode_Handler:	1:	j 1b
Ecall_U_Mode_Handler:	1:	j 1b
Break_Point_Handler:	1:	j 1b
SysTick_Handler:	1:	j 1b
SW_Handler:		1:	j 1b

/* Externam interrupts */
WWDG_IRQHandler:	1:	j 1b
PVD_IRQHandler:		1:	j 1b
TAMPER_IRQHandler:	1:	j 1b
RTC_IRQHandler:		1:	j 1b
FLASH_IRQHandler:	1:	j 1b
RCC_IRQHandler:		1:	j 1b
EXTI0_IRQHandler:	1:	j 1b
EXTI1_IRQHandler:	1:	j 1b
EXTI2_IRQHandler:	1:	j 1b
EXTI3_IRQHandler:	1:	j 1b
EXTI4_IRQHandler:	1:	j 1b
DMA1_Channel1_IRQHandler:1:	j 1b
DMA1_Channel2_IRQHandler:1:	j 1b
DMA1_Channel3_IRQHandler:1:	j 1b
DMA1_Channel4_IRQHandler:1:	j 1b
DMA1_Channel5_IRQHandler:1:	j 1b
DMA1_Channel6_IRQHandler:1:	j 1b
DMA1_Channel7_IRQHandler:1:	j 1b
ADC1_2_IRQHandler:	1:	j 1b
USB_HP_CAN1_TX_IRQHandler:1:	j 1b
USB_LP_CAN1_RX0_IRQHandler:1:	j 1b
CAN1_RX1_IRQHandler:	1:	j 1b
CAN1_SCE_IRQHandler:	1:	j 1b
EXTI9_5_IRQHandler:	1:	j 1b
TIM1_BRK_IRQHandler:	1:	j 1b
TIM1_UP_IRQHandler:	1:	j 1b
TIM1_TRG_COM_IRQHandler:1:	j 1b
TIM1_CC_IRQHandler:	1:	j 1b
TIM2_IRQHandler:	1:	j 1b
TIM3_IRQHandler:	1:	j 1b
TIM4_IRQHandler:	1:	j 1b
I2C1_EV_IRQHandler:	1:	j 1b
I2C1_ER_IRQHandler:	1:	j 1b
I2C2_EV_IRQHandler:	1:	j 1b
I2C2_ER_IRQHandler:	1:	j 1b
SPI1_IRQHandler:	1:	j 1b
SPI2_IRQHandler:	1:	j 1b
USART1_IRQHandler:	1:	j 1b
USART2_IRQHandler:	1:	j 1b
USART3_IRQHandler:	1:	j 1b
EXTI15_10_IRQHandler:	1:	j 1b
RTCAlarm_IRQHandler:	1:	j 1b
USBWakeUp_IRQHandler:	1:	j 1b
TIM8_BRK_IRQHandler:	1:	j 1b
TIM8_UP_IRQHandler:	1:	j 1b
TIM8_TRG_COM_IRQHandler:1:	j 1b
TIM8_CC_IRQHandler:	1:	j 1b
RNG_IRQHandler:		1:	j 1b
FSMC_IRQHandler:	1:	j 1b
SDIO_IRQHandler:	1:	j 1b
TIM5_IRQHandler:	1:	j 1b
SPI3_IRQHandler:	1:	j 1b
UART4_IRQHandler:	1:	j 1b
UART5_IRQHandler:	1:	j 1b
TIM6_IRQHandler:	1:	j 1b
TIM7_IRQHandler:	1:	j 1b
DMA2_Channel1_IRQHandler:1:	j 1b
DMA2_Channel2_IRQHandler:1:	j 1b
DMA2_Channel3_IRQHandler:1:	j 1b
DMA2_Channel4_IRQHandler:1:	j 1b
DMA2_Channel5_IRQHandler:1:	j 1b
ETH_IRQHandler:		1:	j 1b
ETH_WKUP_IRQHandler:	1:	j 1b
CAN2_TX_IRQHandler:	1:	j 1b
CAN2_RX0_IRQHandler:	1:	j 1b
CAN2_RX1_IRQHandler:	1:	j 1b
CAN2_SCE_IRQHandler:	1:	j 1b
	_weak_OTG_FS_IRQHandler:	1:	j 1b
USBHSWakeup_IRQHandler:	1:	j 1b
	_weak_USBHS_IRQHandler:		1:	j 1b
DVP_IRQHandler:		1:	j 1b
UART6_IRQHandler:	1:	j 1b
UART7_IRQHandler:	1:	j 1b
UART8_IRQHandler:	1:	j 1b
TIM9_BRK_IRQHandler:	1:	j 1b
TIM9_UP_IRQHandler:	1:	j 1b
TIM9_TRG_COM_IRQHandler:1:	j 1b
TIM9_CC_IRQHandler:	1:	j 1b
TIM10_BRK_IRQHandler:	1:	j 1b
TIM10_UP_IRQHandler:	1:	j 1b
TIM10_TRG_COM_IRQHandler:1:	j 1b
TIM10_CC_IRQHandler:	1:	j 1b
DMA2_Channel6_IRQHandler:1:	j 1b
DMA2_Channel7_IRQHandler:1:	j 1b
DMA2_Channel8_IRQHandler:1:	j 1b
DMA2_Channel9_IRQHandler:1:	j 1b
DMA2_Channel10_IRQHandler:1:	j 1b
DMA2_Channel11_IRQHandler:1:	j 1b



handle_reset:
_16d2:
	auipc	gp,0x1ffff
	add	gp,gp,358 # 0x20000838
1:
	la sp, _eusrstack # 0x20002000, RAMSIZE = 8K
2:

	/* Load data section */
	la a0, _data_lma # 0x20b0
	la a1, _data_vma #0x20000000
	add	a2,gp,-2032 # a2 = _edata, 0x20000048
	bgeu a1,a2, 2f
1:
	lw	t0,0(a0)
	sw	t0,0(a1)
	addi	a0,a0,4
	addi	a1,a1,4
	bltu	a1,a2, 1b
2:
	/* clear bss section */
	add	a0,gp,-2024 # la a0, _sbss = 0x2000'0050
	add	a1,gp,-904  # la a1, _ebss = 0x2000'04b0
	bgeu	a0,a1,2f
1:
	sw	zero,0(a0)
	addi	a0,a0,4
	bltu	a0,a1,1b
2:
	li	t0, 0x1F
	csrw	corecfgr,t0
	/* Enable nested and hardware stack */
	li	t0, 0x1B
	csrw	intsyscr, t0
	
	.option norvc
	li t0, (0b11<<MSTATUS_FS) | (1<<MSTATUS_MPIE) | (1<<MSTATUS_MIE) #0x6088
	.option rvc
	csrs	mstatus,t0
	
	la t0, _vector_base
	ori	t0,t0,3
	csrw	mtvec,t0
	
	jal SystemInit
	la t0, main
	csrw	mepc,t0
	mret


FLASH_STATR_write:
_175c:	lui	a5,0x40022
	sw	a0,12(a5) # FLASH_STATR = a0
	ret

#RCC_CFGR_pllconf(a0, a1) -> CFGR0 = CFGR0~(PLLSRC| (PLLXTPRE=0/1) |PLLMUL) | a0 | a1
RCC_CFGR_pllconf:
_1764:	lui	a4,0x1ffff
	lw	a4,1804(a4) # a4 = [0x1ffff70c] (TODO:??? )
	lui	a5,0x40021
	lw	a5,4(a5) #a5 = RCC_CFGR0
	slli	a3,a4,17 #test [0x1ffff70c].b14, if 0 then goto
	##if [0x1ffff70c].b14==0 then a4=0xffc10000; else a4=0xffc30000
	li	a4,0xffc10000
	  bgez a3, RCC_CFGR_pllconf_fi
	li	a4,0xffc30000
RCC_CFGR_pllconf_fi:
	addi	a4,a4,-1 # 0xFFC0FFFF or 0xFFC2FFFF (1<<17)
	and	a5,a5,a4 # RCC_CFGR0 &=~(PLLSRC| (PLLXTPRE=0/1) |PLLMUL)
	or	a0,a0,a1 #a0 |= a1
	or	a0,a0,a5 #a0 |= RCC_CFGR0
	lui	a5,0x40021
	sw	a0,4(a5) # RCC_CFGR0 = a0
	ret
	

RCC_AHBPCENR_APPLY_MASK: #a0-mask, (a1=0-clear by mask, a1=1-set by mask)
_1792:	beqz a1, RCC_AHBPCENR_CLR_MASK # if a1==0 goto; else:
	li	a4,0x40021000
	lw	a5,20(a4) # RCC_AHBPCENR
	or	a0,a0,a5
	sw	a0,20(a4) # RCC_AHBPCENR |= a0
	ret
RCC_AHBPCENR_CLR_MASK:
	li	a5,0x40021000
	lw	a4,20(a5)
	not	a0,a0
	and	a0,a0,a4
	sw	a0,20(a5) # # RCC_AHBPCENR &=~ a0
	ret

RCC_CFGR0_USBPRE: # a0=0 1:1(if F_CPU=48MHz), a0=1 1:2(if F_CPU=69), a0=2 1:3(if F_CPU=144)
_17b0:	li	a5,0x40021000
	lw	a4,4(a5) # RCC_CFGR0
	li	a3,~(0b11<<22) # USBPRE
	and	a4,a4,a3
	sw	a4,4(a5) # RCC_CFGR0 &=~ USBPRE
	lw	a4,4(a5)
	sll	a0,a0,22
	or	a0,a0,a4
	sw	a0,4(a5) # RCC_CFGR0 |= (a0 << USBPRE_pos)
	ret
	
	
#TODO: пройтись по коду и нарисовать точные делители
RCC_CFGR2_USBHSDIV: # a0: F / (a0+1) # a0=0=>1:1, a0=1=>1:2, ..., a0=7=>1:8
_17ca:	li	a5,0x40021000
	lw	a4,44(a5) # RCC_CFGR2
	li	a3,~(0b111<<24)
	and	a4,a4,a3
	sw	a4,44(a5) # RCC_CFGR2 &=~ USBHSDIV
	lw	a4,44(a5)
	slli	a0,a0,24
	or	a0,a0,a4
	sw	a0,44(a5) # RCC_CFGR2 |= (a0 << USBHSDIV)
	ret

RCC_CFGR2_USBHSPLLSRC: # a0=0 HSE, a0=1 HSI
_17e4:	li	a5,0x40021000
	lw	a4,44(a5) # RCC_CFGR2
	li	a3,~(1<<27)
	and	a4,a4,a3
	sw	a4,44(a5) # RCC_CFGR2 &=~ USBHSPLLSRC
	lw	a4,44(a5)
	sll	a0,a0,27
	or	a0,a0,a4
	sw	a0,44(a5) # RCC_CFGR2 |= (a0 << USBHSPLLSRC_pos)
	ret

	
RCC_CFGR2_USBHSCLK: # a0: 0=3 MHz, 1=4 MHz, 2=8 MHz, 3=5 MHz
_17fe:	li	a5,0x40021000
	lw	a4,44(a5) # RCC_CFGR2
	li a3, ~(0b11<<28)
	and	a4,a4,a3
	sw	a4,44(a5) # RCC_CFGR2 &=~ USBHSCLK
	lw	a4,44(a5)
	slli	a0,a0,28
	or	a0,a0,a4
	sw	a0,44(a5) # RCC_CFGR2 |= (a0 << USBHSCLK_pos)
	ret


RCC_CFGR2_USBPLL_EN: #a0=1 - enable, a0=0 - disable
_1818:	beqz	a0,RCC_CFGR2_USBPLL_DIS
	li	a4,0x40021000
	lw	a5,44(a4) # RCC_CFGR2
	li	a3,(1<<30)
	or	a5,a5,a3
	sw	a5,44(a4) # RCC_CFGR2 |= USBHSPLL 
	ret
RCC_CFGR2_USBPLL_DIS:
	li	a3,0x40021000
	lw	a5,44(a3) # RCC_CFGR2
	li	a4,~(1<<30)
	and	a5,a5,a4
	sw	a5,44(a3) # RCC_CFGR2 &=~ USBHSPLL
	ret
	

RCC_CFGR2_USB_CLOCK_SRC: #a0=1-USB PHY, 0-PLL
_183c:	li	a4,0x40021000
	lw	a5,44(a4) # RCC_CFGR2
	slli	a0,a0,31 # (a0<<31)
	slli	a5,a5,1
	srli	a5,a5,1 # clear bit 31
	sw	a5,44(a4) # RCC_CFGR2 &=~ USBHSSRC
	lw	a5,44(a4)
	or	a0,a0,a5
	sw	a0,44(a4)# RCC_CFGR2 |= (a0<<USBHSSRC), USBHS clock source (1=PHY, 0=PLL)
	ret

WWDG_CTLR_write:
_1852:	or	a0,a0,(1<<7) #WDGA, activation bit
	lui	a5,0x40003
	sw	a0,-1024(a5) # WWDG_CTLR = a0 | WDGA
	ret

func_0040_div_8M:
_1860:	lw	a5,SystemCoreClock # a5 = [0x2000'0040]
	li	a4, 8000000
	divu	a5,a5,a4
	andi	a5,a5,0xFF #a5 = low(a5 / 8000000)
	sb	a5,-2018(gp) # [0x2000'0056] = a5
	li	a4,1000
	mul	a5,a5,a4 # a5 = low(a5 / 8000000) * 1000
	sh	a5,-2020(gp) # [0x2000'0054] = a5
	ret

SYSTICK_DELAY_56: #a0 - time
_1886:	li	a5,0xe000f000
	lw	a4,4(a5) # STK_SR
	li	a3,0
	andi	a4,a4,~(1<<0)
	sw	a4,4(a5) # STK_SR &=~ CNTIF
	lbu	a4,-2018(gp) # a4 = [0x2000'0056]
	mul	a2,a4,a0
	sw	a2,16(a5) # STK_CMPLR = a0*[0x2000'0056]
	sw	a3,20(a5) # STK_CMPHR = 0
	lw	a4,0(a5) # STK_CTLR
	or	a4,a4,49
	sw	a4,0(a5) # STK_CTLR |= INIT | MODE | STE;
WAIT_STK_SR_CNTIF:
	lw	a4,4(a5)
	andi	a4,a4,(1<<0)
	  beqz	a4,WAIT_STK_SR_CNTIF
	lw	a4,0(a5)
	and	a4,a4,~(1<<0)
	sw	a4,0(a5) #STK_CTLR &=~ STE
	ret


SYSTICK_DELAY_54: # a0 - time
_18b4:	li	a5,0xe000f000 # STK
	lw	a4,4(a5) 
	li	a3,0
	andi	a4,a4,~(1<<0)
	sw	a4,4(a5) # STK_SR &=~CNTIF
	lhu	a4,-2020(gp) #a4 = [0x2000'0054]
	mul	a2,a4,a0
	sw	a2,16(a5) # STK_CMPLR = a0*[0x2000'0054]
	sw	a3,20(a5) # STK_CMPHR = 0
	lw	a4,0(a5)
	ori	a4,a4,49
	sw	a4,0(a5)# STK_CTLR |= INIT | MODE | STE;
WAIT_STK_SR_CNTIF2:
	lw	a4,4(a5)
	andi	a4,a4,(1<<0)
	  beqz	a4,WAIT_STK_SR_CNTIF2
	lw	a4,0(a5)
	andi	a4,a4,~(1<<0)
	sw	a4,0(a5) #STK_CTLR &=~ STE
	ret


.half 0x0000 # align?

.option norvc
# a0 - SystemCoreClock
# a1 = [0x1ed4] ?= 0x49e10000
_18e4:	add	sp,sp,-64
	srli	a5,a0,23
	sw	s2,48(sp)
	sw	s5,36(sp)
	sw	s7,28(sp)
	slli	s5,a0,9
	srli	s2,a0,31
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	andi	a5,a5,0xFF
	srli	s5,s5,9
	mv	s7,s2
	  beqz	a5,_1ab4
	li	a4,0xFF
	  beq	a5,a4,_1ac8
	slli	s5,s5,3
	li	a4,0x4000000 # (1<<26)
	or	s5,s5,a4
	add	s4,a5,-127
	li	s0,0
	li	s6,0
_1948:	srli	a5,a1,23
	slli	s1,a1,9
	andi a5,a5,255
	srl	s1,s1,9
	srli	s3,a1,31
	  beqz	a5,_1aa8
	li	a4,255
	  beq	a5,a4,_19a4
	sll	s1,s1,0x3
	add	a5,a5,-127
_1970:	li	a4,0x4000000 # (1<<26)
	or	s1,s1,a4
	sub	s4,s4,a5
	li	a3,0
_1980:	or	s0,a3,s0
	la	a4, _1f30
	slli	s0,s0,0x2 # s0 *= 4
	add	s0,s0,a4 # s0 += table_1f30
	lw	a5,0(s0) # a5 = table_1f30[?]
	xor	s2,s2,s3
	add	a5,a5,a4 # a5 = table_1f30 + table_1f30[?]
	jr	a5
	
_19a4:	add	s4,s4,-255
	  bnez	s1,_1adc
	li	a3,2
_19b0:	or	s0,a3,s0
	la a4, _1f70
	slli	s0,s0,2
	add	s0,s0,a4
	lw	a5,0(s0)
	xor	s2,s2,s3
	add	a5,a5,a4
	jr	a5
	
	
_19d4:	li	s2,0
	li	a4,255
	li	a5,0x400000
_19e0:	slli	a0,a5,9
	lw	ra,60(sp)
	lw	s0,56(sp)
	slli	a5,a4,23
	srli	a0,a0,9
	slli	s2,s2,31
	or	a0,a0,a5
	or	a0,a0,s2
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	add	sp,sp,64
	ret

    
_1a24:	li	a4,255
	li	a5,0
	j	_19e0


_1a30:	mv	s5,s1
	mv	s7,s3
	mv	s6,a3
_1a3c:	li	a5,2
	  beq	s6,a5,_1c94
	li	a5,3
	  beq	s6,a5,_19d4
	li	a5,1
	  beq	s6,a5,_1b40
_1a54:	addi	a4,s4,127
	andi	s2,s7,1
	  blez	a4,_1bf0
	andi	a5,s5,7
	  beqz	a5,_1a78
	andi	a5,s5,15
	li	a3,4
	  beq	a5,a3,_1a78
	add	s5,s5,4
_1a78:	slli	a5,s5,4
	  bgez	a5,_1a90
	li	a5,~(1<<27)
	and	s5,s5,a5
	add	a4,s4,128
_1a90:	li	a5,254
	  blt	a5,a4,_1a24
	sll	a5,s5,0x6
	srl	a5,a5,0x9
	andi	a4,a4,0xFF
	j	_19e0



_1aa8:	bnez	s1,_1b20
	li	a3,1
	j	_19b0



_1ab4:	bnez	s5,_1af4
	li	s0,4
	li	s4,0
	li	s6,1
	j	_1948



_1ac8:	bnez	s5,_1ae4
	li	s0,8
	li	s4,255
	li	s6,2
	j	_1948


_1adc:	li	a3,3
	j	_1980


_1ae4:	li	s0,12
	li	s4,255
	li	s6,3
	j	_1948


_1af4:	mv	a0,s5
	sw	a1,12(sp)
	jal	_1e2c
	add	a5,a0,-5
	sll	s5,s5,a5
	li	a5,-118
	sub	s4,a5,a0
	li	s0,0
	li	s6,0
	lw	a1,12(sp)
	j	_1948


_1b20:	mv	a0,s1
	jal	_1e2c
	add	a4,a0,-5
	add	a5,s4,a0
	sll	s1,s1,a4
	add	s4,a5,118
	li	a3,0
	j	_1980


_1b40:	and	s2,s7,1
_1b44:	li	a4,0
	li	a5,0
	j	_19e0


_1b50:	lui	a2,0x10
	slli	a0,s1,5
	add	a2,a2,-1 # 0xffff
	srli	a5,a0,16
	and	a2,a0,a2
_1b64:	  bgeu	s5,s1,_1c50
	divu	a1,s5,a5
	add	s4,s4,-1
	mv	a3,s5
	li	a4,0
	mul	a6,a1,a2
_1b7c:	remu	a3,a3,a5
	sll	a3,a3,0x10
	or	a4,a3,a4
	  bgeu	a4,a6,_1ba4
	add	a4,a4,a0
	add	a3,a1,-1
	  bltu	a4,a0,_1c80
	  bgeu	a4,a6,_1c80
	add	a1,a1,-2
	add	a4,a4,a0
_1ba4:	sub	a4,a4,a6
	divu	a3,a4,a5
	remu	a4,a4,a5
	mul	s5,a3,a2
	sll	a5,a4,0x10
	  bgeu	a5,s5,_1bd4
	add	a5,a5,a0
	add	a4,a3,-1
	  bltu	a5,a0,_1c78
	  bgeu	a5,s5,_1c78
	add	a3,a3,-2
	add	a5,a5,a0
_1bd4:	sll	a1,a1,0x10
	sub	s5,a5,s5
	or	a1,a1,a3
	snez	s5,s5
	or	s5,a1,s5
	mv	s7,s2
	j	_1a54


_1bf0:	li	a3,1
	sub	a3,a3,a4
	  beqz	a4,_1c0c
	li	a2,27
	li	a4,0
	li	a5,0
	  blt	a2,a3,_19e0
_1c0c:	add	s4,s4,158
	sll	s4,s5,s4
	srl	a5,s5,a3
	snez	s5,s4
	or	a5,a5,s5
	and	a4,a5,7
	  beqz	a4,_1c38
	and	a4,a5,15
	li	a3,4
	  beq	a4,a3,_1c38
	add	a5,a5,4
_1c38:	sll	a4,a5,0x5
	  bltz	a4,_1c88
	sll	a5,a5,0x6
	srl	a5,a5,0x9
	li	a4,0
	j	_19e0


_1c50:	srl	a3,s5,0x1
	divu	a1,a3,a5
	sll	a4,s5,0x1f
	srl	a4,a4,0x10
	mul	a6,a1,a2
	j	_1b7c


_1c68:	mv	s7,s3
	mv	s6,a3
	li	s5,0
	j	_1a3c


_1c78:	mv	a3,a4
	j	_1bd4


_1c80:	mv	a1,a3
	j	_1ba4


_1c88:	li	a4,1
	li	a5,0
	j	_19e0


_1c94:	and	s2,s7,1
	li	a4,255
	li	a5,0
	j	_19e0

#return value (a0) - uart_brr_mantissa
_1ca4:	srli	a4,a0,23
	li	a2,0x800000
	add	a5,a2,-1 # 0x7fffff
	andi	a4,a4,255
	li	a1,126
	and	a3,a5,a0
	srli	a5,a0,31
	li	a0,0
	  bgeu	a1,a4,_1ca4_ret
	  beqz	a5,_1cd4
_1ca4_ret2:	ret
_1ca4_ret:	ret
	
	
_1cd4:	li	a5,158
	li	a0,-1
	  bltu	a5,a4,_1ca4_ret2
	li	a1,149
	or	a5,a3,a2
	  bge	a1,a4,_1cf8
	add	a4,a4,-150
	sll	a0,a5,a4
	ret


_1cf8:	li	a0,150
	sub	a4,a0,a4
	srl	a0,a5,a4
	ret
	

.option norvc
WTF_bitscount_func:
_1d08:	add	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	##if a0=0 then goto 
	  beqz	a0,WTF_clr_s0_a0_a5#Странный код, зануляющий s0, a0 и a5
	mv	s0,a0
	  jal	leading_zeros # подсчет количества ведущих нулей в a0. Результат в a0
	li	a5,158
	sub	a4,a5,a0 #a4 = 158-zeros = [126..158]
	li	a5,150
	  blt	a5,a4,_1d94 # if a4 >= 150 (zeros=[0..9], 23-32-битное число)
	li	a3,8
	andi	a5,a4,255 #WTF? Оно и так меньше 255
	  bge	a3,a0,_WTF_zeros_less8 # if a0 < 8 (zeros=[0..7]), сюда код не попадает!
	add	a0,a0,-8
	sll	s0,s0,a0
_WTF_zeros_less8:
	slli	s0,s0,9 #WTF?! Зануляются 9 старших битов s0
	srli	s0,s0,9
	slli	s0,s0,9 #А потом зануляются еще раз и присваиваются a0
	srli	a0,s0,9 #в a0 все равно количество ведущих нулей [0..32]
	lw	ra,12(sp)
	lw	s0,8(sp)
	sll	a5,a5,23
	or	a0,a0,a5
	add	sp,sp,16
	ret

WTF_clr_s0_a0_a5:
_1d6c:	li	s0,0
	slli	s0,s0,9
	srli	a0,s0,9
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,0
	slli	a5,a5,23
	or	a0,a0,a5
	add	sp,sp,16
	ret

	#a4 = 158-zeros = [127..158]
_1d94:	li	a5,153
	  bge	a5,a4,_1db8_ # if a4 < 153 (zeros=[0..5], 26-битное число)
	add	a5,a0,27
	li	a3,5
	sll	a5,s0,a5
	sub	a3,a3,a0
    	snez	a5,a5 #sltu a5,zero,a5 = set not equal zero
	srl	s0,s0,a3
	or	s0,a5,s0
_1db8_: li	a5,5
	bge	a5,a0,_1dc8_
	add	a5,a0,-5
	sll	s0,s0,a5
_1dc8_: li a3, ~(1<<26)
	and	a5,s0,7
	and	a2,s0,a3
	beqz	a5,_1e00_
	and	a5,s0,15
	li	a1,4
	beq	a5,a1,_1e00_
	add	a2,a2,4
	sll	a5,a2,0x5
	bgez	a5,_1e00_
	li	a5,159
	and	a2,a2,a3
	sub	a4,a5,a0
_1e00_: sll	s0,a2,0x6
	srl	s0,s0,0x9
	sll	s0,s0,0x9
	srl	a0,s0,0x9
	lw	ra,12(sp)
	lw	s0,8(sp)
	andi	a5,a4,255
	sll	a5,a5,0x17
	or	a0,a0,a5
	add	sp,sp,16
	ret

leading_zeros:
_1e2c:	li	a5,(1<<16)
	bgeu	a0,a5,leading_zeros_24_32 #if a0 >= (1<<16)
	li	a5,255
	li	a4,32
	bltu	a5,a0,leading_zeros_16 #if a0 > 255
leading_zeros_8:
	la	a5, log2p1_table
	add	a5,a5,a0
	lbu	a0,0(a5)
	sub	a0,a4,a0 # 32-[0..8] = [24..32]
	ret
leading_zeros_16:
_1e58:	srl	a0,a0,8 #a0 = (a0>>8)
	la	a5, log2p1_table
	add	a5,a5,a0
	lbu	a0,0(a5) #a0 = table[a0]
	li	a4,24
	sub	a0,a4,a0 # 24-[1..8] = [16..23]
	ret
leading_zeros_24_32:
_1e78:	li	a5,(1<<24)
	bltu	a0,a5,leading_zeros_24 #a0 < (1<<24)
	#32-битное
	srl	a0,a0,24 #a0 = (a0>>24) = [0...255]
	la	a5, log2p1_table
	add	a5,a5,a0
	lbu	a0,0(a5) #a0 = table[a0]
	li	a4,8
	sub	a0,a4,a0 # 8-[1..8] = [0..7]
	ret
#24-битное
leading_zeros_24:
_1ea0:	srl	a0,a0,16 # a0 = (a0>>16) = [0..255]
	la	a5, log2p1_table
	add	a5,a5,a0
	lbu	a0,0(a5) #a0 = table[a0]
	li	a4,16
	sub	a0,a4,a0 # 16-[1..8] = [8..15]
	ret
.option rvc
    
prodstring:
_1ec0: .ascii "MCU ISP & WCH.CN" # 16 bytes
.word 0x00000000
_1ed4: .word 0x49e10000

usbotg_std_requests_table:
_1ed8:
.word OTG_GET_STATUS # 0
.word OTG_CLEAR_FEATURE # 1
.word OTG_REQUEST_ERR # 2
.word OTG_REQUEST_ERR # 3 (set feature)
.word OTG_REQUEST_ERR # 4
.word OTG_SET_ADDRESS	# 5
.word OTG_GET_DESCRIPTOR # 6
.word OTG_REQUEST_ERR # 7
.word OTG_GET_CONFIGURATION # 8
.word OTG_SET_CONFIGURATION # 9
.word OTG_GET_INTERFACE	# 10
usbhs_std_requests_table:
_1f04:
.word USBFS_GET_STATUS # 0
.word USBFS_CLEAR_FEATURE # 1
.word USBFS_REQUEST_ERR # 2
.word USBFS_REQUEST_ERR # 3 (set feature)
.word USBFS_REQUEST_ERR # 4
.word USBFS_SET_ADDRESS	# 5
.word USBFS_GET_DESCRIPTOR # 6
.word USBFS_REQUEST_ERR # 7
.word USBFS_GET_CONFIGURATION # 8
.word USBFS_SET_CONFIGURATION # 9
.word USBFS_GET_INTERFACE # 10

_1f30:	.word (_1b50 - _1f30) # 0xfffffc20
	.word (_1a24 - _1f30) # 0xfffffaf4
	.word (_1b44 - _1f30) # 0xfffffc14
	.word (_1a30 - _1f30) # 0xfffffb00
	.word (_1b44 - _1f30) # 0xfffffc14
	.word (_19d4 - _1f30) # 0xfffffaa4
	.word (_1b44 - _1f30) # 0xfffffc14
	.word (_1a30 - _1f30) # 0xfffffb00
	.word (_1a24 - _1f30) # 0xfffffaf4
	.word (_1a24 - _1f30) # 0xfffffaf4
	.word (_19d4 - _1f30) # 0xfffffaa4
	.word (_1a30 - _1f30) # 0xfffffb00
	.word (_1a3c - _1f30) # 0xfffffb0c
	.word (_1a3c - _1f30) # 0xfffffb0c
	.word (_1a3c - _1f30) # 0xfffffb0c
	.word (_19d4 - _1f30) # 0xfffffaa4

_1f70:	.word (_1a24 - _1f70) # 0xfffffab4
	.word (_1a24 - _1f70) # 0xfffffab4
	.word (_1b44 - _1f70) # 0xfffffbd4
	.word (_1c68 - _1f70) # 0xfffffcf8
	.word (_1b44 - _1f70) # 0xfffffbd4
	.word (_19d4 - _1f70) # 0xfffffa64
	.word (_1b44 - _1f70) # 0xfffffbd4
	.word (_1c68 - _1f70) # 0xfffffcf8
	.word (_1a24 - _1f70) # 0xfffffab4
	.word (_1a24 - _1f70) # 0xfffffab4
	.word (_19d4 - _1f70) # 0xfffffa64
	.word (_1c68 - _1f70) # 0xfffffcf8
	.word (_1a3c - _1f70) # 0xfffffacc
	.word (_1a3c - _1f70) # 0xfffffacc
	.word (_1a3c - _1f70) # 0xfffffacc
	.word (_19d4 - _1f70) # 0xfffffa64

.macro _arrbyte b, N
  .rept \N
    .byte \b
  .endr
.endm
log2p1_table: #arr[i] = log2(i)+1
_1fb0:	_arrbyte 0, 1
	_arrbyte 1, 1
	_arrbyte 2, 2
	_arrbyte 3, 4
	_arrbyte 4, 8
	_arrbyte 5, 16
	_arrbyte 6, 32
	_arrbyte 7, 64
	_arrbyte 8, 128

_data_lma:
.align 1
# copy to 0x2000'0000 - 0x2000'001F
_20b0:	.byte 9		# bLength (9)
	.byte 0x02	# bDescriptorType (Configuration)
	.half 32	# wTotalLength (32 = 0x0020)
	.byte 1		# bNumInterfaces (1)
	.byte 1		# bConfigurationValue (1)
	.byte 0		# iConfiguration (0)
	.byte 0x80	# bmAttributes (0x80, bus powered)
	.byte 0x32	# MaxPower (100 mA)
	#interface
	.byte 9		# bLength (9)
	.byte 4		# bDescriptorType (interface)
	.byte 0		# bInterfaceNumber (0)
	.byte 0		# bAlternateSetting (0)
	.byte 2		# bNumEndpoints (2)
	.byte 0xFF	# bInterfaceClass (0xFF = Vendor)
	.byte 0x80	# bInterfaceSubClass (0x80)
	.byte 0x55	# bInterfaceProtocol
	.byte 0		# iInterface
	#Endpoint
	.byte 7		# bLength (7)
	.byte 5		# bDescriptorType (Endpoint)
	.byte 0x82	# bEndpointAddress (EP 2 IN)
	.byte 0x02	# bmAttributes (0x02 = Bulk)
	.half 64	# wMaxPacketSize (64 bytes)
	.byte 0		# bInterval
	#Endpoint
	.byte 7		# bLength (7)
	.byte 5		# bDescriptorType (Endpoint)
	.byte 0x02	# bEndpointAddress (EP 2 OUT)
	.byte 0x02	# bmAttributes (0x02 = Bulk)
	.half 64	# wMaxPacketSize (64 bytes)
	.byte 0		# bInterval
#usb device descriptor
#copy to 0x2000'0020 - 0x2000'0031
_20d0:	.byte 18	# bLength
	.byte 0x01	# bDescriptorType (device)
	.half 0x0110	# bcdUSB (1.10)
	.byte 0xFF	# Class (0xFF = Vendor)
	.byte 0x80	# Subclass (0x80)
	.byte 0x55	# Protocol
	.byte 64	# EP0 size (64 bytes)
	.half 0x4348	# VID
	.half 0x55e0	# PID
	.half 0x2900	# SN (29.00)
	.byte 0		# iManufacturer (0)
	.byte 0		# iProduct (0)
	.byte 0		# iSerial (0)
	.byte 1		# bNumConfigurations (1)

#[0x2000'0032] #align?
_2032: .byte 0,0,0,0,0,0
#[0x2000'0038]
.word 0x00090200 # Bootloader version
#[0x2000'003c]
_20ec: .byte 0xfd
.byte 0,0,0
#[0x2000'0040]
_20f0: .word 8000000 # SystemCoreClock
.word 0
#[0x2000'0046]
_data_end:

_20f8:	.half 0xe339
_20fa:	.half 0xe339
_20fc:	.half 0xe339
_20fe:	.half 0xe339