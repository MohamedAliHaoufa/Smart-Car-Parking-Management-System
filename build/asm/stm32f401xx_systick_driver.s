	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"stm32f401xx_systick_driver.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "drivers/Src/stm32f401xx_systick_driver.c"
	.bss
	.align	2
STK_Callback:
	.space	4
	.size	STK_Callback, 4
Running_Mode:
	.space	1
	.size	Running_Mode, 1
	.text
	.align	1
	.global	MCAL_STK_Config
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_Config, %function
MCAL_STK_Config:
.LFB3:
	.loc 1 33 41
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 37 9
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 37 28
	and	r3, r3, #2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #2]
	.loc 1 38 9
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 1 38 24
	and	r3, r3, #4
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #1]
	.loc 1 41 21
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	.loc 1 41 48
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 1 41 41
	orrs	r3, r3, r2
	uxtb	r3, r3
	.loc 1 41 14
	str	r3, [r7, #12]
	.loc 1 42 8
	ldr	r2, .L3
	.loc 1 42 15
	ldr	r3, [r7, #12]
	str	r3, [r2]
	.loc 1 45 5
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	MCAL_STK_SetReload
	.loc 1 48 37
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 48 7
	cmp	r3, #2
	bne	.L2
	.loc 1 49 9
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	MCAL_STK_SetCallback
.L2:
	.loc 1 53 24
	ldr	r3, [r7, #4]
	ldrb	r2, [r3]	@ zero_extendqisi2
	.loc 1 53 18
	ldr	r3, .L3+4
	strb	r2, [r3]
	.loc 1 54 1
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	-536813552
	.word	Running_Mode
	.cfi_endproc
.LFE3:
	.size	MCAL_STK_Config, .-MCAL_STK_Config
	.align	1
	.global	MCAL_STK_SetReload
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_SetReload, %function
MCAL_STK_SetReload:
.LFB4:
	.loc 1 65 38
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 67 11
	ldr	r3, [r7, #4]
	bic	r3, r3, #-16777216
	str	r3, [r7, #4]
	.loc 1 69 22
	movs	r3, #1
	str	r3, [r7, #4]
	.loc 1 69 8
	ldr	r2, .L6
	.loc 1 69 15
	ldr	r3, [r7, #4]
	str	r3, [r2, #4]
	.loc 1 70 1
	nop
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L7:
	.align	2
.L6:
	.word	-536813552
	.cfi_endproc
.LFE4:
	.size	MCAL_STK_SetReload, .-MCAL_STK_SetReload
	.align	1
	.global	MCAL_STK_SetCallback
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_SetCallback, %function
MCAL_STK_SetCallback:
.LFB5:
	.loc 1 82 52
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 83 18
	ldr	r2, .L9
	ldr	r3, [r7, #4]
	str	r3, [r2]
	.loc 1 84 1
	nop
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L10:
	.align	2
.L9:
	.word	STK_Callback
	.cfi_endproc
.LFE5:
	.size	MCAL_STK_SetCallback, .-MCAL_STK_SetCallback
	.align	1
	.global	MCAL_STK_StartTimer
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_StartTimer, %function
MCAL_STK_StartTimer:
.LFB6:
	.loc 1 99 27
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 101 8
	ldr	r3, .L12
	.loc 1 101 14
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 104 8
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, .L12
	.loc 1 104 15
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 105 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	-536813552
	.cfi_endproc
.LFE6:
	.size	MCAL_STK_StartTimer, .-MCAL_STK_StartTimer
	.align	1
	.global	MCAL_STK_StopTimer
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_StopTimer, %function
MCAL_STK_StopTimer:
.LFB7:
	.loc 1 116 26
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 118 8
	ldr	r3, .L15
	ldr	r3, [r3]
	ldr	r2, .L15
	.loc 1 118 15
	bic	r3, r3, #1
	str	r3, [r2]
	.loc 1 119 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L16:
	.align	2
.L15:
	.word	-536813552
	.cfi_endproc
.LFE7:
	.size	MCAL_STK_StopTimer, .-MCAL_STK_StopTimer
	.align	1
	.global	MCAL_STK_Delay
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_Delay, %function
MCAL_STK_Delay:
.LFB8:
	.loc 1 132 40
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 134 29
	ldr	r3, .L19
	.loc 1 134 12
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 137 26
	ldr	r3, .L19
	.loc 1 137 12
	ldr	r3, [r3]
	str	r3, [r7, #8]
	.loc 1 140 8
	ldr	r3, .L19
	.loc 1 140 15
	movs	r2, #0
	str	r2, [r3]
	.loc 1 143 8
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r2, .L19
	.loc 1 143 15
	and	r3, r3, #65536
	str	r3, [r2]
	.loc 1 146 5
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	mov	r0, r3
	bl	MCAL_STK_SetReload
	.loc 1 149 8
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r2, .L19
	.loc 1 149 15
	orr	r3, r3, #4
	str	r3, [r2]
	.loc 1 152 5
	bl	MCAL_STK_StartTimer
	.loc 1 155 11
	nop
.L18:
	.loc 1 155 17 discriminator 1
	ldr	r3, .L19
	ldr	r3, [r3]
	.loc 1 155 41 discriminator 1
	and	r3, r3, #65536
	cmp	r3, #0
	beq	.L18
	.loc 1 158 5
	bl	MCAL_STK_StopTimer
	.loc 1 161 8
	ldr	r2, .L19
	.loc 1 161 15
	ldr	r3, [r7, #12]
	str	r3, [r2, #4]
	.loc 1 162 8
	ldr	r2, .L19
	.loc 1 162 15
	ldr	r3, [r7, #8]
	str	r3, [r2]
	.loc 1 163 1
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	-536813552
	.cfi_endproc
.LFE8:
	.size	MCAL_STK_Delay, .-MCAL_STK_Delay
	.align	1
	.global	MCAL_STK_Delay1ms
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_STK_Delay1ms, %function
MCAL_STK_Delay1ms:
.LFB9:
	.loc 1 177 40
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 179 12
	movw	r3, #7999
	str	r3, [r7, #8]
	.loc 1 180 15
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 180 5
	b	.L22
.L23:
	.loc 1 181 9 discriminator 3
	ldr	r0, [r7, #8]
	bl	MCAL_STK_Delay
	.loc 1 180 43 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L22:
	.loc 1 180 26 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L23
	.loc 1 183 1
	nop
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE9:
	.size	MCAL_STK_Delay1ms, .-MCAL_STK_Delay1ms
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	SysTick_Handler, %function
SysTick_Handler:
.LFB10:
	.loc 1 196 27
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 198 26
	ldr	r3, .L28
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 198 7
	cmp	r3, #0
	bne	.L25
	.loc 1 199 9
	bl	MCAL_STK_StopTimer
.L25:
	.loc 1 203 13
	ldr	r3, .L28+4
	ldr	r3, [r3]
	.loc 1 203 7
	cmp	r3, #0
	beq	.L27
	.loc 1 204 9
	ldr	r3, .L28+4
	ldr	r3, [r3]
	blx	r3
.LVL0:
.L27:
	.loc 1 206 1
	nop
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	Running_Mode
	.word	STK_Callback
	.cfi_endproc
.LFE10:
	.size	SysTick_Handler, .-SysTick_Handler
.Letext0:
	.file 2 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "drivers/Inc/Platform_Types.h"
	.file 5 "drivers/Inc/stm32f401xx.h"
	.file 6 "drivers/Inc/stm32f401xx_systick_driver.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2b9
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x1d
	.4byte	.LASF48
	.4byte	.LASF49
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x71
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0xd
	.4byte	0x71
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x7
	.4byte	0x89
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x65
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x45
	.byte	0x1d
	.4byte	0x49
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x4
	.byte	0x4a
	.byte	0x1d
	.4byte	0x71
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x70
	.byte	0x21
	.4byte	0x78
	.uleb128 0x8
	.byte	0x10
	.byte	0x5
	.byte	0xdc
	.4byte	0x10c
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x5
	.byte	0xdd
	.byte	0xf
	.4byte	0xc3
	.byte	0
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x5
	.byte	0xde
	.byte	0xf
	.4byte	0xc3
	.byte	0x4
	.uleb128 0xf
	.ascii	"VAL\000"
	.byte	0x5
	.byte	0xdf
	.byte	0xf
	.4byte	0xc3
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x5
	.byte	0xe0
	.byte	0xf
	.4byte	0xc3
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x5
	.byte	0xe1
	.byte	0x3
	.4byte	0xcf
	.uleb128 0x8
	.byte	0xc
	.byte	0x6
	.byte	0x30
	.4byte	0x162
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x6
	.byte	0x31
	.byte	0xb
	.4byte	0x9d
	.byte	0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x6
	.byte	0x32
	.byte	0xb
	.4byte	0x9d
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x6
	.byte	0x33
	.byte	0xb
	.4byte	0x9d
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x6
	.byte	0x34
	.byte	0xc
	.4byte	0xa9
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF26
	.byte	0x6
	.byte	0x35
	.byte	0xc
	.4byte	0x84
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x6
	.byte	0x36
	.byte	0x3
	.4byte	0x118
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x11
	.byte	0xf
	.4byte	0x84
	.uleb128 0x5
	.byte	0x3
	.4byte	STK_Callback
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x12
	.byte	0xe
	.4byte	0x9d
	.uleb128 0x5
	.byte	0x3
	.4byte	Running_Mode
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x1
	.byte	0xc4
	.byte	0x6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0xb1
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e1
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0xb1
	.byte	0x1f
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0xb2
	.byte	0xc
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0xb3
	.byte	0xc
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x84
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x220
	.uleb128 0x5
	.4byte	.LASF35
	.byte	0x84
	.byte	0x1c
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x86
	.byte	0xc
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x89
	.byte	0xc
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x74
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x63
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x52
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x263
	.uleb128 0x5
	.4byte	.LASF41
	.byte	0x52
	.byte	0x22
	.4byte	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x41
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x286
	.uleb128 0x5
	.4byte	.LASF43
	.byte	0x41
	.byte	0x20
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x21
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b7
	.uleb128 0x5
	.4byte	.LASF45
	.byte	0x21
	.byte	0x24
	.4byte	0x2b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.4byte	.LASF46
	.byte	0x22
	.byte	0xc
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.4byte	0x162
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF45:
	.ascii	"_cfg\000"
.LASF43:
	.ascii	"value\000"
.LASF24:
	.ascii	"interrupt_config\000"
.LASF50:
	.ascii	"SysTick_Handler\000"
.LASF47:
	.ascii	"GNU C11 12.3.1 20230626 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0 -std=gnu11\000"
.LASF23:
	.ascii	"clock_config\000"
.LASF36:
	.ascii	"prev_reload\000"
.LASF37:
	.ascii	"prev_cfg\000"
.LASF27:
	.ascii	"STK_config_t\000"
.LASF21:
	.ascii	"STK_TypeDef\000"
.LASF15:
	.ascii	"float\000"
.LASF31:
	.ascii	"ms_delay_time\000"
.LASF28:
	.ascii	"STK_Callback\000"
.LASF33:
	.ascii	"MCAL_STK_Delay\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF34:
	.ascii	"delay_ms\000"
.LASF11:
	.ascii	"__uint32_t\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF25:
	.ascii	"reload_value\000"
.LASF20:
	.ascii	"CALIB\000"
.LASF38:
	.ascii	"MCAL_STK_StopTimer\000"
.LASF48:
	.ascii	"drivers/Src/stm32f401xx_systick_driver.c\000"
.LASF40:
	.ascii	"MCAL_STK_SetCallback\000"
.LASF16:
	.ascii	"double\000"
.LASF5:
	.ascii	"short int\000"
.LASF42:
	.ascii	"MCAL_STK_SetReload\000"
.LASF14:
	.ascii	"uint32\000"
.LASF32:
	.ascii	"MCAL_STK_Delay1ms\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF41:
	.ascii	"pfCallback\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF39:
	.ascii	"MCAL_STK_StartTimer\000"
.LASF44:
	.ascii	"MCAL_STK_Config\000"
.LASF3:
	.ascii	"signed char\000"
.LASF49:
	.ascii	"/home/mohamed/Downloads/test/corrected4/corrected/S"
	.ascii	"mart Car Parking Managment System\000"
.LASF46:
	.ascii	"reg_copy\000"
.LASF1:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"char\000"
.LASF30:
	.ascii	"index\000"
.LASF29:
	.ascii	"Running_Mode\000"
.LASF17:
	.ascii	"vuint32_t\000"
.LASF19:
	.ascii	"LOAD\000"
.LASF22:
	.ascii	"running_mode\000"
.LASF13:
	.ascii	"uint8\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF18:
	.ascii	"CTRL\000"
.LASF2:
	.ascii	"long double\000"
.LASF35:
	.ascii	"delay_ticks\000"
.LASF26:
	.ascii	"Callback_Function\000"
	.ident	"GCC: (GNU Tools for STM32 12.3.rel1.20240612-1315) 12.3.1 20230626"
