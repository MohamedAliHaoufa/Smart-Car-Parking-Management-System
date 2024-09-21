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
	.file	"system_stm32f4xx.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "Src/system_stm32f4xx.c"
	.global	SystemCoreClock
	.data
	.align	2
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	84000000
	.global	AHBPrescTable
	.align	2
	.type	AHBPrescTable, %object
	.size	AHBPrescTable, 16
AHBPrescTable:
	.ascii	"\000\000\000\000\000\000\000\000\001\002\003\004\006"
	.ascii	"\007\010\011"
	.text
	.align	1
	.global	SystemInit
	.syntax unified
	.thumb
	.thumb_func
	.type	SystemInit, %function
SystemInit:
.LFB123:
	.loc 1 484 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 494 6
	ldr	r3, .L2
	.loc 1 494 13
	mov	r2, #134217728
	str	r2, [r3, #8]
	.loc 1 496 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	-536810240
	.cfi_endproc
.LFE123:
	.size	SystemInit, .-SystemInit
	.align	1
	.global	SystemInit_Old
	.syntax unified
	.thumb
	.thumb_func
	.type	SystemInit_Old, %function
SystemInit_Old:
.LFB124:
	.loc 1 499 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 507 6
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, .L5
	.loc 1 507 11
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 510 6
	ldr	r3, .L5
	.loc 1 510 13
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 513 6
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, .L5
	.loc 1 513 11
	bic	r3, r3, #17301504
	bic	r3, r3, #65536
	str	r3, [r2]
	.loc 1 516 6
	ldr	r3, .L5
	.loc 1 516 16
	ldr	r2, .L5+4
	str	r2, [r3, #4]
	.loc 1 519 6
	ldr	r3, .L5
	ldr	r3, [r3]
	ldr	r2, .L5
	.loc 1 519 11
	bic	r3, r3, #262144
	str	r3, [r2]
	.loc 1 522 6
	ldr	r3, .L5
	.loc 1 522 12
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 530 3
	bl	SetSysClock
	.loc 1 536 6
	ldr	r3, .L5+8
	.loc 1 536 13
	mov	r2, #134217728
	str	r2, [r3, #8]
	.loc 1 538 1
	nop
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	1073887232
	.word	603992080
	.word	-536810240
	.cfi_endproc
.LFE124:
	.size	SystemInit_Old, .-SystemInit_Old
	.align	1
	.global	SystemCoreClockUpdate
	.syntax unified
	.thumb
	.thumb_func
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
.LFB125:
	.loc 1 577 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 578 12
	movs	r3, #0
	str	r3, [r7, #16]
	.loc 1 578 21
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 578 33
	movs	r3, #2
	str	r3, [r7, #12]
	.loc 1 578 43
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 578 58
	movs	r3, #2
	str	r3, [r7, #4]
	.loc 1 583 12
	ldr	r3, .L15
	ldr	r3, [r3, #8]
	.loc 1 583 7
	and	r3, r3, #12
	str	r3, [r7, #16]
	.loc 1 585 3
	ldr	r3, [r7, #16]
	cmp	r3, #8
	beq	.L8
	ldr	r3, [r7, #16]
	cmp	r3, #8
	bhi	.L9
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r7, #16]
	cmp	r3, #4
	beq	.L11
	b	.L9
.L10:
	.loc 1 588 23
	ldr	r3, .L15+4
	ldr	r2, .L15+8
	str	r2, [r3]
	.loc 1 589 7
	b	.L12
.L11:
	.loc 1 591 23
	ldr	r3, .L15+4
	ldr	r2, .L15+12
	str	r2, [r3]
	.loc 1 592 7
	b	.L12
.L8:
	.loc 1 597 23
	ldr	r3, .L15
	ldr	r3, [r3, #4]
	.loc 1 597 55
	lsrs	r3, r3, #22
	.loc 1 597 17
	and	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 598 17
	ldr	r3, .L15
	ldr	r3, [r3, #4]
	.loc 1 598 12
	and	r3, r3, #63
	str	r3, [r7, #4]
	.loc 1 601 10
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L13
	.loc 1 604 29
	ldr	r2, .L15+12
	ldr	r3, [r7, #4]
	udiv	r3, r2, r3
	.loc 1 604 44
	ldr	r2, .L15
	ldr	r2, [r2, #4]
	.loc 1 604 74
	lsrs	r2, r2, #6
	ubfx	r2, r2, #0, #9
	.loc 1 604 16
	mul	r3, r2, r3
	str	r3, [r7, #20]
	b	.L14
.L13:
	.loc 1 609 29
	ldr	r2, .L15+8
	ldr	r3, [r7, #4]
	udiv	r3, r2, r3
	.loc 1 609 44
	ldr	r2, .L15
	ldr	r2, [r2, #4]
	.loc 1 609 74
	lsrs	r2, r2, #6
	ubfx	r2, r2, #0, #9
	.loc 1 609 16
	mul	r3, r2, r3
	str	r3, [r7, #20]
.L14:
	.loc 1 626 20
	ldr	r3, .L15
	ldr	r3, [r3, #4]
	.loc 1 626 50
	lsrs	r3, r3, #16
	and	r3, r3, #3
	.loc 1 626 56
	adds	r3, r3, #1
	.loc 1 626 12
	lsls	r3, r3, #1
	str	r3, [r7, #12]
	.loc 1 627 31
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #12]
	udiv	r3, r2, r3
	.loc 1 627 23
	ldr	r2, .L15+4
	str	r3, [r2]
	.loc 1 628 7
	b	.L12
.L9:
	.loc 1 652 23
	ldr	r3, .L15+4
	ldr	r2, .L15+8
	str	r2, [r3]
	.loc 1 653 7
	nop
.L12:
	.loc 1 657 28
	ldr	r3, .L15
	ldr	r3, [r3, #8]
	.loc 1 657 52
	lsrs	r3, r3, #4
	and	r3, r3, #15
	.loc 1 657 22
	ldr	r2, .L15+16
	ldrb	r3, [r2, r3]
	uxtb	r3, r3
	.loc 1 657 7
	str	r3, [r7, #16]
	.loc 1 659 19
	ldr	r3, .L15+4
	ldr	r2, [r3]
	ldr	r3, [r7, #16]
	lsr	r3, r2, r3
	ldr	r2, .L15+4
	str	r3, [r2]
	.loc 1 660 1
	nop
	adds	r7, r7, #28
	.cfi_def_cfa_offset 4
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
	.word	1073887232
	.word	SystemCoreClock
	.word	16000000
	.word	25000000
	.word	AHBPrescTable
	.cfi_endproc
.LFE125:
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	SetSysClock, %function
SetSysClock:
.LFB126:
	.loc 1 671 1
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
	.loc 1 676 17
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 676 37
	movs	r3, #0
	str	r3, [r7]
	.loc 1 679 6
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, .L26
	.loc 1 679 11
	orr	r3, r3, #65536
	str	r3, [r2]
.L19:
	.loc 1 684 20 discriminator 2
	ldr	r3, .L26
	ldr	r3, [r3]
	.loc 1 684 25 discriminator 2
	and	r3, r3, #131072
	.loc 1 684 15 discriminator 2
	str	r3, [r7]
	.loc 1 685 19 discriminator 2
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 686 22 discriminator 2
	ldr	r3, [r7]
	.loc 1 686 28 discriminator 2
	cmp	r3, #0
	bne	.L18
	.loc 1 686 47 discriminator 1
	ldr	r3, [r7, #4]
	.loc 1 686 28 discriminator 1
	cmp	r3, #20480
	bne	.L19
.L18:
	.loc 1 688 11
	ldr	r3, .L26
	ldr	r3, [r3]
	.loc 1 688 16
	and	r3, r3, #131072
	.loc 1 688 6
	cmp	r3, #0
	beq	.L20
	.loc 1 690 15
	movs	r3, #1
	str	r3, [r7]
	b	.L21
.L20:
	.loc 1 694 15
	movs	r3, #0
	str	r3, [r7]
.L21:
	.loc 1 697 17
	ldr	r3, [r7]
	.loc 1 697 6
	cmp	r3, #1
	bne	.L25
	.loc 1 700 8
	ldr	r3, .L26
	ldr	r3, [r3, #64]
	ldr	r2, .L26
	.loc 1 700 18
	orr	r3, r3, #268435456
	str	r3, [r2, #64]
	.loc 1 701 8
	ldr	r3, .L26+4
	ldr	r3, [r3]
	ldr	r2, .L26+4
	.loc 1 701 13
	orr	r3, r3, #49152
	str	r3, [r2]
	.loc 1 704 8
	ldr	r3, .L26
	ldr	r2, .L26
	ldr	r3, [r3, #8]
	.loc 1 704 15
	str	r3, [r2, #8]
	.loc 1 716 8
	ldr	r3, .L26
	ldr	r2, .L26
	ldr	r3, [r3, #8]
	.loc 1 716 15
	str	r3, [r2, #8]
	.loc 1 719 8
	ldr	r3, .L26
	ldr	r3, [r3, #8]
	ldr	r2, .L26
	.loc 1 719 15
	orr	r3, r3, #4096
	str	r3, [r2, #8]
	.loc 1 724 8
	ldr	r3, .L26
	.loc 1 724 18
	ldr	r2, .L26+8
	str	r2, [r3, #4]
	.loc 1 735 8
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, .L26
	.loc 1 735 13
	orr	r3, r3, #16777216
	str	r3, [r2]
	.loc 1 738 10
	nop
.L23:
	.loc 1 738 15 discriminator 1
	ldr	r3, .L26
	ldr	r3, [r3]
	.loc 1 738 20 discriminator 1
	and	r3, r3, #33554432
	.loc 1 738 37 discriminator 1
	cmp	r3, #0
	beq	.L23
	.loc 1 768 10
	ldr	r3, .L26+12
	.loc 1 768 16
	movw	r2, #1794
	str	r2, [r3]
	.loc 1 772 8
	ldr	r3, .L26
	ldr	r3, [r3, #8]
	ldr	r2, .L26
	.loc 1 772 15
	bic	r3, r3, #3
	str	r3, [r2, #8]
	.loc 1 773 8
	ldr	r3, .L26
	ldr	r3, [r3, #8]
	ldr	r2, .L26
	.loc 1 773 15
	orr	r3, r3, #2
	str	r3, [r2, #8]
	.loc 1 776 11
	nop
.L24:
	.loc 1 776 16 discriminator 1
	ldr	r3, .L26
	ldr	r3, [r3, #8]
	.loc 1 776 23 discriminator 1
	and	r3, r3, #12
	.loc 1 776 50 discriminator 1
	cmp	r3, #8
	bne	.L24
.L25:
	.loc 1 891 1
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
.L27:
	.align	2
.L26:
	.word	1073887232
	.word	1073770496
	.word	121721881
	.word	1073888256
	.cfi_endproc
.LFE126:
	.size	SetSysClock, .-SetSysClock
.Letext0:
	.file 2 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "CMSIS/Inc/core_cm4.h"
	.file 5 "CMSIS/Inc/stm32f4xx.h"
	.file 6 "CMSIS/Inc/system_stm32f4xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x600
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xc
	.4byte	.LASF79
	.byte	0x1d
	.4byte	.LASF80
	.4byte	.LASF81
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x39
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x39
	.byte	0x19
	.4byte	0x53
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x6d
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x2d
	.uleb128 0x4
	.4byte	0x90
	.uleb128 0x8
	.4byte	0x9c
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x47
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x4
	.4byte	0xb2
	.uleb128 0x8
	.4byte	0xbe
	.uleb128 0xa
	.byte	0x8c
	.byte	0x4
	.2byte	0x1c3
	.4byte	0x1e3
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x1c5
	.4byte	0xc3
	.byte	0
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x1c6
	.4byte	0xbe
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x1c7
	.4byte	0xbe
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1c8
	.4byte	0xbe
	.byte	0xc
	.uleb128 0x2
	.ascii	"SCR\000"
	.byte	0x4
	.2byte	0x1c9
	.4byte	0xbe
	.byte	0x10
	.uleb128 0x2
	.ascii	"CCR\000"
	.byte	0x4
	.2byte	0x1ca
	.4byte	0xbe
	.byte	0x14
	.uleb128 0x2
	.ascii	"SHP\000"
	.byte	0x4
	.2byte	0x1cb
	.4byte	0x1f3
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1cc
	.4byte	0xbe
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1cd
	.4byte	0xbe
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x1ce
	.4byte	0xbe
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x1cf
	.4byte	0xbe
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x1d0
	.4byte	0xbe
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x1d1
	.4byte	0xbe
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x1d2
	.4byte	0xbe
	.byte	0x3c
	.uleb128 0x2
	.ascii	"PFR\000"
	.byte	0x4
	.2byte	0x1d3
	.4byte	0x20d
	.byte	0x40
	.uleb128 0x2
	.ascii	"DFR\000"
	.byte	0x4
	.2byte	0x1d4
	.4byte	0xc3
	.byte	0x48
	.uleb128 0x2
	.ascii	"ADR\000"
	.byte	0x4
	.2byte	0x1d5
	.4byte	0xc3
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1d6
	.4byte	0x227
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x1d7
	.4byte	0x241
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x1d8
	.4byte	0x246
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x1d9
	.4byte	0xbe
	.byte	0x88
	.byte	0
	.uleb128 0x5
	.4byte	0x9c
	.4byte	0x1f3
	.uleb128 0x6
	.4byte	0x89
	.byte	0xb
	.byte	0
	.uleb128 0x4
	.4byte	0x1e3
	.uleb128 0x5
	.4byte	0xc3
	.4byte	0x208
	.uleb128 0x6
	.4byte	0x89
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.4byte	0x1f8
	.uleb128 0x4
	.4byte	0x208
	.uleb128 0x5
	.4byte	0xc3
	.4byte	0x222
	.uleb128 0x6
	.4byte	0x89
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.4byte	0x212
	.uleb128 0x4
	.4byte	0x222
	.uleb128 0x5
	.4byte	0xc3
	.4byte	0x23c
	.uleb128 0x6
	.4byte	0x89
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.4byte	0x22c
	.uleb128 0x4
	.4byte	0x23c
	.uleb128 0x5
	.4byte	0xb2
	.4byte	0x256
	.uleb128 0x6
	.4byte	0x89
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x1da
	.4byte	0xc8
	.uleb128 0x5
	.4byte	0xb2
	.4byte	0x272
	.uleb128 0x6
	.4byte	0x89
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.4byte	.LASF69
	.byte	0x6
	.byte	0x3b
	.byte	0x11
	.4byte	0xb2
	.uleb128 0xf
	.byte	0x7
	.byte	0x1
	.4byte	0x39
	.byte	0x5
	.2byte	0x35b
	.byte	0xe
	.4byte	0x29a
	.uleb128 0x10
	.4byte	.LASF31
	.byte	0
	.uleb128 0x11
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.byte	0x1c
	.byte	0x5
	.2byte	0x52b
	.4byte	0x2fd
	.uleb128 0x2
	.ascii	"ACR\000"
	.byte	0x5
	.2byte	0x52d
	.4byte	0xbe
	.byte	0
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x52e
	.4byte	0xbe
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x52f
	.4byte	0xbe
	.byte	0x8
	.uleb128 0x2
	.ascii	"SR\000"
	.byte	0x5
	.2byte	0x530
	.4byte	0xbe
	.byte	0xc
	.uleb128 0x2
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x531
	.4byte	0xbe
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x532
	.4byte	0xbe
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x533
	.4byte	0xbe
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x534
	.4byte	0x29a
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.2byte	0x658
	.4byte	0x32c
	.uleb128 0x2
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x65a
	.4byte	0xbe
	.byte	0
	.uleb128 0x2
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x65b
	.4byte	0xbe
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x65c
	.4byte	0x309
	.uleb128 0xa
	.byte	0x98
	.byte	0x5
	.2byte	0x662
	.4byte	0x4fb
	.uleb128 0x2
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x664
	.4byte	0xbe
	.byte	0
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x665
	.4byte	0xbe
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x666
	.4byte	0xbe
	.byte	0x8
	.uleb128 0x2
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x667
	.4byte	0xbe
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x668
	.4byte	0xbe
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x669
	.4byte	0xbe
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x66a
	.4byte	0xbe
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x66b
	.4byte	0xb2
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x66c
	.4byte	0xbe
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x66d
	.4byte	0xbe
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x5
	.2byte	0x66e
	.4byte	0x262
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x66f
	.4byte	0xbe
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x5
	.2byte	0x670
	.4byte	0xbe
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x5
	.2byte	0x671
	.4byte	0xbe
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x5
	.2byte	0x672
	.4byte	0xb2
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x673
	.4byte	0xbe
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x5
	.2byte	0x674
	.4byte	0xbe
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x5
	.2byte	0x675
	.4byte	0x262
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x676
	.4byte	0xbe
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x677
	.4byte	0xbe
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x678
	.4byte	0xbe
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x5
	.2byte	0x679
	.4byte	0xb2
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x5
	.2byte	0x67a
	.4byte	0xbe
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x5
	.2byte	0x67b
	.4byte	0xbe
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x5
	.2byte	0x67c
	.4byte	0x262
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x5
	.2byte	0x67d
	.4byte	0xbe
	.byte	0x70
	.uleb128 0x2
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x67e
	.4byte	0xbe
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x5
	.2byte	0x67f
	.4byte	0x262
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x5
	.2byte	0x680
	.4byte	0xbe
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x5
	.2byte	0x681
	.4byte	0xbe
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x5
	.2byte	0x682
	.4byte	0xbe
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x683
	.4byte	0xbe
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x684
	.4byte	0xbe
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x685
	.4byte	0xbe
	.byte	0x94
	.byte	0
	.uleb128 0xb
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x687
	.4byte	0x338
	.uleb128 0x12
	.4byte	0x272
	.byte	0x1
	.2byte	0x1bd
	.byte	0xc
	.uleb128 0x5
	.byte	0x3
	.4byte	SystemCoreClock
	.uleb128 0x5
	.4byte	0xa1
	.4byte	0x526
	.uleb128 0x6
	.4byte	0x89
	.byte	0xf
	.byte	0
	.uleb128 0x8
	.4byte	0x516
	.uleb128 0x4
	.4byte	0x526
	.uleb128 0x13
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x1c4
	.byte	0xd
	.4byte	0x52b
	.uleb128 0x5
	.byte	0x3
	.4byte	AHBPrescTable
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x29e
	.byte	0xd
	.4byte	.LFB126
	.4byte	.LFE126-.LFB126
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x579
	.uleb128 0x9
	.4byte	.LASF71
	.2byte	0x2a4
	.byte	0x11
	.4byte	0xbe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.4byte	.LASF72
	.2byte	0x2a4
	.byte	0x25
	.4byte	0xbe
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x240
	.byte	0x6
	.4byte	.LFB125
	.4byte	.LFE125-.LFB125
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5dd
	.uleb128 0x16
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x242
	.byte	0xc
	.4byte	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.4byte	.LASF73
	.2byte	0x242
	.byte	0x15
	.4byte	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.4byte	.LASF74
	.2byte	0x242
	.byte	0x21
	.4byte	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.4byte	.LASF75
	.2byte	0x242
	.byte	0x2b
	.4byte	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.4byte	.LASF76
	.2byte	0x242
	.byte	0x3a
	.4byte	0xb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x17
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x1f2
	.byte	0x6
	.4byte	.LFB124
	.4byte	.LFE124-.LFB124
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x1e3
	.byte	0x6
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 17
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 17
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x34
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x7a
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
.LASF53:
	.ascii	"AHB1LPENR\000"
.LASF43:
	.ascii	"APB1RSTR\000"
.LASF47:
	.ascii	"AHB2ENR\000"
.LASF71:
	.ascii	"StartUpCounter\000"
.LASF60:
	.ascii	"BDCR\000"
.LASF16:
	.ascii	"ICSR\000"
.LASF66:
	.ascii	"CKGATENR\000"
.LASF63:
	.ascii	"PLLI2SCFGR\000"
.LASF37:
	.ascii	"PWR_TypeDef\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF62:
	.ascii	"SSCGR\000"
.LASF72:
	.ascii	"HSEStatus\000"
.LASF15:
	.ascii	"CPUID\000"
.LASF32:
	.ascii	"KEYR\000"
.LASF28:
	.ascii	"RESERVED0\000"
.LASF39:
	.ascii	"CFGR\000"
.LASF55:
	.ascii	"AHB3LPENR\000"
.LASF52:
	.ascii	"RESERVED3\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF50:
	.ascii	"APB1ENR\000"
.LASF81:
	.ascii	"/home/mohamed/Downloads/test/corrected4/corrected/S"
	.ascii	"mart Car Parking Managment System\000"
.LASF65:
	.ascii	"DCKCFGR\000"
.LASF48:
	.ascii	"AHB3ENR\000"
.LASF33:
	.ascii	"OPTKEYR\000"
.LASF9:
	.ascii	"long long int\000"
.LASF24:
	.ascii	"BFAR\000"
.LASF6:
	.ascii	"long int\000"
.LASF68:
	.ascii	"RCC_TypeDef\000"
.LASF67:
	.ascii	"DCKCFGR2\000"
.LASF2:
	.ascii	"short int\000"
.LASF44:
	.ascii	"APB2RSTR\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF20:
	.ascii	"CFSR\000"
.LASF77:
	.ascii	"SystemInit_Old\000"
.LASF41:
	.ascii	"AHB2RSTR\000"
.LASF75:
	.ascii	"pllsource\000"
.LASF76:
	.ascii	"pllm\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF74:
	.ascii	"pllp\000"
.LASF18:
	.ascii	"AIRCR\000"
.LASF30:
	.ascii	"SCB_Type\000"
.LASF51:
	.ascii	"APB2ENR\000"
.LASF0:
	.ascii	"signed char\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF19:
	.ascii	"SHCSR\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF23:
	.ascii	"MMFAR\000"
.LASF38:
	.ascii	"PLLCFGR\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF57:
	.ascii	"APB1LPENR\000"
.LASF73:
	.ascii	"pllvco\000"
.LASF17:
	.ascii	"VTOR\000"
.LASF83:
	.ascii	"SystemCoreClockUpdate\000"
.LASF27:
	.ascii	"ISAR\000"
.LASF22:
	.ascii	"DFSR\000"
.LASF69:
	.ascii	"SystemCoreClock\000"
.LASF21:
	.ascii	"HFSR\000"
.LASF54:
	.ascii	"AHB2LPENR\000"
.LASF26:
	.ascii	"MMFR\000"
.LASF70:
	.ascii	"AHBPrescTable\000"
.LASF45:
	.ascii	"RESERVED1\000"
.LASF49:
	.ascii	"RESERVED2\000"
.LASF82:
	.ascii	"SetSysClock\000"
.LASF56:
	.ascii	"RESERVED4\000"
.LASF59:
	.ascii	"RESERVED5\000"
.LASF61:
	.ascii	"RESERVED6\000"
.LASF46:
	.ascii	"AHB1ENR\000"
.LASF31:
	.ascii	"RESET\000"
.LASF78:
	.ascii	"SystemInit\000"
.LASF79:
	.ascii	"GNU C11 12.3.1 20230626 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0 -std=gnu11\000"
.LASF40:
	.ascii	"AHB1RSTR\000"
.LASF25:
	.ascii	"AFSR\000"
.LASF80:
	.ascii	"Src/system_stm32f4xx.c\000"
.LASF42:
	.ascii	"AHB3RSTR\000"
.LASF36:
	.ascii	"FLASH_TypeDef\000"
.LASF64:
	.ascii	"PLLSAICFGR\000"
.LASF29:
	.ascii	"CPACR\000"
.LASF58:
	.ascii	"APB2LPENR\000"
.LASF34:
	.ascii	"OPTCR\000"
.LASF35:
	.ascii	"OPTCR1\000"
	.ident	"GCC: (GNU Tools for STM32 12.3.rel1.20240612-1315) 12.3.1 20230626"
