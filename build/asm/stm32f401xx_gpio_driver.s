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
	.file	"stm32f401xx_gpio_driver.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "drivers/Src/stm32f401xx_gpio_driver.c"
	.align	1
	.global	MCAL_GPIO_Init
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_Init, %function
MCAL_GPIO_Init:
.LFB3:
	.loc 1 30 71
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 31 32
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	.loc 1 31 11
	strb	r3, [r7, #23]
	.loc 1 34 18
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 34 8
	cmp	r3, #3
	bhi	.L2
	.loc 1 35 14
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	.loc 1 35 45
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	lsls	r2, r2, #1
	.loc 1 35 31
	movs	r1, #3
	lsl	r2, r1, r2
	.loc 1 35 25
	mvns	r2, r2
	.loc 1 35 22
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 36 14
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	.loc 1 36 35
	ldr	r2, [r7]
	ldrb	r2, [r2]	@ zero_extendqisi2
	mov	r1, r2
	.loc 1 36 61
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	lsls	r2, r2, #1
	.loc 1 36 47
	lsl	r2, r1, r2
	.loc 1 36 22
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	b	.L3
.L2:
.LBB2:
	.loc 1 39 22
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 39 12
	cmp	r3, #4
	bne	.L4
	.loc 1 40 17
	ldr	r3, .L20
	ldr	r3, [r3, #12]
	.loc 1 40 31
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	mov	r1, r2
	.loc 1 40 17
	ldr	r2, .L20
	.loc 1 40 24
	orrs	r3, r3, r1
	str	r3, [r2, #12]
	.loc 1 41 17
	ldr	r3, .L20
	ldr	r3, [r3, #8]
	.loc 1 41 31
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	.loc 1 41 27
	mvns	r2, r2
	mov	r1, r2
	.loc 1 41 17
	ldr	r2, .L20
	.loc 1 41 24
	ands	r3, r3, r1
	str	r3, [r2, #8]
	b	.L5
.L4:
	.loc 1 42 29
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 42 19
	cmp	r3, #5
	bne	.L6
	.loc 1 43 17
	ldr	r3, .L20
	ldr	r3, [r3, #8]
	.loc 1 43 31
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	mov	r1, r2
	.loc 1 43 17
	ldr	r2, .L20
	.loc 1 43 24
	orrs	r3, r3, r1
	str	r3, [r2, #8]
	.loc 1 44 17
	ldr	r3, .L20
	ldr	r3, [r3, #12]
	.loc 1 44 31
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	.loc 1 44 27
	mvns	r2, r2
	mov	r1, r2
	.loc 1 44 17
	ldr	r2, .L20
	.loc 1 44 24
	ands	r3, r3, r1
	str	r3, [r2, #12]
	b	.L5
.L6:
	.loc 1 45 29
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 45 19
	cmp	r3, #6
	bne	.L5
	.loc 1 46 17
	ldr	r3, .L20
	ldr	r3, [r3, #12]
	.loc 1 46 31
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	mov	r1, r2
	.loc 1 46 17
	ldr	r2, .L20
	.loc 1 46 24
	orrs	r3, r3, r1
	str	r3, [r2, #12]
	.loc 1 47 17
	ldr	r3, .L20
	ldr	r3, [r3, #8]
	.loc 1 47 31
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	mov	r1, r2
	.loc 1 47 17
	ldr	r2, .L20
	.loc 1 47 24
	orrs	r3, r3, r1
	str	r3, [r2, #8]
.L5:
	.loc 1 51 34
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	lsrs	r3, r3, #2
	uxtb	r3, r3
	.loc 1 51 16
	str	r3, [r7, #16]
	.loc 1 52 24
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 1 52 16
	and	r3, r3, #3
	strh	r3, [r7, #14]	@ movhi
	.loc 1 53 16
	ldr	r3, [r7, #4]
	ldr	r2, .L20+4
	cmp	r3, r2
	beq	.L7
	.loc 1 53 16 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, .L20+8
	cmp	r3, r2
	beq	.L8
	.loc 1 53 16 discriminator 3
	ldr	r3, [r7, #4]
	ldr	r2, .L20+12
	cmp	r3, r2
	beq	.L9
	.loc 1 53 16 discriminator 5
	ldr	r3, [r7, #4]
	ldr	r2, .L20+16
	cmp	r3, r2
	beq	.L10
	.loc 1 53 16 discriminator 7
	ldr	r3, [r7, #4]
	ldr	r2, .L20+20
	cmp	r3, r2
	bne	.L11
	.loc 1 53 16 discriminator 9
	movs	r3, #4
	b	.L16
.L11:
	.loc 1 53 16 discriminator 10
	movs	r3, #0
	b	.L16
.L10:
	.loc 1 53 16 discriminator 8
	movs	r3, #3
	b	.L16
.L9:
	.loc 1 53 16 discriminator 6
	movs	r3, #2
	b	.L16
.L8:
	.loc 1 53 16 discriminator 4
	movs	r3, #1
	b	.L16
.L7:
	.loc 1 53 16 discriminator 2
	movs	r3, #0
.L16:
	.loc 1 53 16 discriminator 20
	strh	r3, [r7, #12]	@ movhi
	.loc 1 54 9 is_stmt 1 discriminator 20
	movs	r0, #17
	bl	MCAL_RCC_Enable_Peripheral
	.loc 1 55 33 discriminator 20
	ldrh	r2, [r7, #12]
	.loc 1 55 56 discriminator 20
	ldrh	r3, [r7, #14]
	lsls	r3, r3, #2
	.loc 1 55 15 discriminator 20
	ldr	r1, .L20+24
	.loc 1 55 50 discriminator 20
	lsls	r2, r2, r3
	.loc 1 55 31 discriminator 20
	ldr	r3, [r7, #16]
	adds	r3, r3, #2
	str	r2, [r1, r3, lsl #2]
	.loc 1 58 13 discriminator 20
	ldr	r3, .L20
	ldr	r3, [r3]
	.loc 1 58 26 discriminator 20
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	mov	r1, r2
	.loc 1 58 13 discriminator 20
	ldr	r2, .L20
	.loc 1 58 19 discriminator 20
	orrs	r3, r3, r1
	str	r3, [r2]
.L3:
.LBE2:
	.loc 1 62 10
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	.loc 1 62 28
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	movs	r1, #1
	lsl	r2, r1, r2
	.loc 1 62 22
	mvns	r2, r2
	.loc 1 62 19
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 63 10
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	.loc 1 63 32
	ldr	r3, [r7]
	ldr	r1, [r3, #8]
	.loc 1 63 49
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	lsl	r3, r1, r3
	.loc 1 63 19
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 66 10
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	.loc 1 66 43
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	lsls	r2, r2, #1
	.loc 1 66 29
	movs	r1, #3
	lsl	r2, r1, r2
	.loc 1 66 23
	mvns	r2, r2
	.loc 1 66 20
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 67 10
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	.loc 1 67 33
	ldr	r2, [r7]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	mov	r1, r2
	.loc 1 67 63
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	lsls	r2, r2, #1
	.loc 1 67 49
	lsl	r2, r1, r2
	.loc 1 67 20
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 70 10
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	.loc 1 70 41
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	lsls	r2, r2, #1
	.loc 1 70 27
	movs	r1, #3
	lsl	r2, r1, r2
	.loc 1 70 21
	mvns	r2, r2
	.loc 1 70 18
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 71 10
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	.loc 1 71 31
	ldr	r3, [r7]
	ldr	r1, [r3, #4]
	.loc 1 71 67
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	lsls	r3, r3, #1
	.loc 1 71 53
	lsl	r3, r1, r3
	.loc 1 71 18
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 74 18
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 74 8
	cmp	r3, #2
	bne	.L19
	.loc 1 75 12
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	cmp	r3, #7
	bhi	.L18
	.loc 1 76 23
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	.loc 1 76 50
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	lsls	r2, r2, #2
	.loc 1 76 36
	movs	r1, #15
	lsl	r2, r1, r2
	.loc 1 76 30
	mvns	r2, r2
	.loc 1 76 27
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	.loc 1 77 23
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #32]
	.loc 1 77 40
	ldr	r3, [r7]
	ldr	r1, [r3, #12]
	.loc 1 77 75
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	lsls	r3, r3, #2
	.loc 1 77 61
	lsl	r3, r1, r3
	.loc 1 77 27
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	.loc 1 83 1
	b	.L19
.L18:
	.loc 1 79 23
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	.loc 1 79 51
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	subs	r2, r2, #8
	.loc 1 79 56
	lsls	r2, r2, #2
	.loc 1 79 36
	movs	r1, #15
	lsl	r2, r1, r2
	.loc 1 79 30
	mvns	r2, r2
	.loc 1 79 27
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #36]
	.loc 1 80 23
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #36]
	.loc 1 80 40
	ldr	r3, [r7]
	ldr	r1, [r3, #12]
	.loc 1 80 76
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	subs	r3, r3, #8
	.loc 1 80 81
	lsls	r3, r3, #2
	.loc 1 80 61
	lsl	r3, r1, r3
	.loc 1 80 27
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #36]
.L19:
	.loc 1 83 1
	nop
	adds	r7, r7, #24
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	1073822720
	.word	1073872896
	.word	1073873920
	.word	1073874944
	.word	1073875968
	.word	1073876992
	.word	1073821696
	.cfi_endproc
.LFE3:
	.size	MCAL_GPIO_Init, .-MCAL_GPIO_Init
	.align	1
	.global	MCAL_GPIO_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_DeInit, %function
MCAL_GPIO_DeInit:
.LFB4:
	.loc 1 96 44
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
	.loc 1 97 8
	ldr	r3, [r7, #4]
	ldr	r2, .L29
	cmp	r3, r2
	bne	.L23
	.loc 1 98 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 98 23
	orr	r3, r3, #1
	str	r3, [r2, #16]
	.loc 1 99 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 99 23
	bic	r3, r3, #1
	str	r3, [r2, #16]
	.loc 1 113 1
	b	.L28
.L23:
	.loc 1 100 15
	ldr	r3, [r7, #4]
	ldr	r2, .L29+8
	cmp	r3, r2
	bne	.L25
	.loc 1 101 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 101 23
	orr	r3, r3, #2
	str	r3, [r2, #16]
	.loc 1 102 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 102 23
	bic	r3, r3, #2
	str	r3, [r2, #16]
	.loc 1 113 1
	b	.L28
.L25:
	.loc 1 103 15
	ldr	r3, [r7, #4]
	ldr	r2, .L29+12
	cmp	r3, r2
	bne	.L26
	.loc 1 104 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 104 23
	orr	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 105 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 105 23
	bic	r3, r3, #4
	str	r3, [r2, #16]
	.loc 1 113 1
	b	.L28
.L26:
	.loc 1 106 15
	ldr	r3, [r7, #4]
	ldr	r2, .L29+16
	cmp	r3, r2
	bne	.L27
	.loc 1 107 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 107 23
	orr	r3, r3, #8
	str	r3, [r2, #16]
	.loc 1 108 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 108 23
	bic	r3, r3, #8
	str	r3, [r2, #16]
	.loc 1 113 1
	b	.L28
.L27:
	.loc 1 109 15
	ldr	r3, [r7, #4]
	ldr	r2, .L29+20
	cmp	r3, r2
	bne	.L28
	.loc 1 110 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 110 23
	orr	r3, r3, #16
	str	r3, [r2, #16]
	.loc 1 111 12
	ldr	r3, .L29+4
	ldr	r3, [r3, #16]
	ldr	r2, .L29+4
	.loc 1 111 23
	bic	r3, r3, #16
	str	r3, [r2, #16]
.L28:
	.loc 1 113 1
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
.L30:
	.align	2
.L29:
	.word	1073872896
	.word	1073887232
	.word	1073873920
	.word	1073874944
	.word	1073875968
	.word	1073876992
	.cfi_endproc
.LFE4:
	.size	MCAL_GPIO_DeInit, .-MCAL_GPIO_DeInit
	.align	1
	.global	MCAL_GPIO_ReadPin
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_ReadPin, %function
MCAL_GPIO_ReadPin:
.LFB5:
	.loc 1 127 64
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	.loc 1 129 30
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	.loc 1 129 37
	ldrh	r3, [r7, #2]
	lsr	r3, r2, r3
	.loc 1 129 13
	uxtb	r3, r3
	.loc 1 129 11
	and	r3, r3, #1
	strb	r3, [r7, #15]
	.loc 1 130 12
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	.loc 1 131 1
	mov	r0, r3
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE5:
	.size	MCAL_GPIO_ReadPin, .-MCAL_GPIO_ReadPin
	.align	1
	.global	MCAL_GPIO_ReadPort
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_ReadPort, %function
MCAL_GPIO_ReadPort:
.LFB6:
	.loc 1 144 48
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 145 38
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	.loc 1 145 12
	strh	r3, [r7, #14]	@ movhi
	.loc 1 146 12
	ldrh	r3, [r7, #14]
	.loc 1 147 1
	mov	r0, r3
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE6:
	.size	MCAL_GPIO_ReadPort, .-MCAL_GPIO_ReadPort
	.align	1
	.global	MCAL_GPIO_WritePin
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_WritePin, %function
MCAL_GPIO_WritePin:
.LFB7:
	.loc 1 162 77
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
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	mov	r3, r2
	strb	r3, [r7, #1]
	.loc 1 163 8
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L36
	.loc 1 164 14
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	.loc 1 164 36
	ldrh	r2, [r7, #2]
	movs	r1, #1
	lsl	r2, r1, r2
	.loc 1 164 20
	orrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 168 1
	b	.L38
.L36:
	.loc 1 166 14
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #20]
	.loc 1 166 37
	ldrh	r3, [r7, #2]
	movs	r1, #1
	lsl	r3, r1, r3
	.loc 1 166 23
	mvns	r3, r3
	.loc 1 166 20
	ands	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
.L38:
	.loc 1 168 1
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
	.cfi_endproc
.LFE7:
	.size	MCAL_GPIO_WritePin, .-MCAL_GPIO_WritePin
	.align	1
	.global	MCAL_GPIO_WritePort
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_WritePort, %function
MCAL_GPIO_WritePort:
.LFB8:
	.loc 1 182 61
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
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	.loc 1 183 18
	ldrh	r2, [r7, #2]
	.loc 1 183 16
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 184 1
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
	.cfi_endproc
.LFE8:
	.size	MCAL_GPIO_WritePort, .-MCAL_GPIO_WritePort
	.align	1
	.global	MCAL_GPIO_TogglePin
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_TogglePin, %function
MCAL_GPIO_TogglePin:
.LFB9:
	.loc 1 198 65
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
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	.loc 1 199 10
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	.loc 1 199 22
	ldrh	r2, [r7, #2]
	movs	r1, #1
	lsl	r2, r1, r2
	.loc 1 199 16
	eors	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 200 1
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
	.cfi_endproc
.LFE9:
	.size	MCAL_GPIO_TogglePin, .-MCAL_GPIO_TogglePin
	.align	1
	.global	MCAL_GPIO_TogglePort
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_TogglePort, %function
MCAL_GPIO_TogglePort:
.LFB10:
	.loc 1 213 47
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
	.loc 1 214 7
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	.loc 1 214 13
	eor	r3, r3, #65280
	eor	r3, r3, #255
	ldr	r2, [r7, #4]
	str	r3, [r2, #20]
	.loc 1 215 1
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
	.cfi_endproc
.LFE10:
	.size	MCAL_GPIO_TogglePort, .-MCAL_GPIO_TogglePort
	.align	1
	.global	MCAL_GPIO_LockPin
	.syntax unified
	.thumb
	.thumb_func
	.type	MCAL_GPIO_LockPin, %function
MCAL_GPIO_LockPin:
.LFB11:
	.loc 1 237 64
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	mov	r3, r1
	strh	r3, [r7, #2]	@ movhi
	.loc 1 244 38
	ldrh	r3, [r7, #2]
	orr	r3, r3, #65536
	.loc 1 244 21
	str	r3, [r7, #12]
	.loc 1 247 17
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	.loc 1 250 17
	ldrh	r2, [r7, #2]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	.loc 1 253 17
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	.loc 1 256 17
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	.loc 1 256 10
	str	r3, [r7, #12]
	.loc 1 259 23
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	.loc 1 259 9
	and	r3, r3, #65536
	.loc 1 259 8
	cmp	r3, #0
	beq	.L43
	.loc 1 260 16
	movs	r3, #1
	b	.L44
.L43:
	.loc 1 262 16
	movs	r3, #0
.L44:
	.loc 1 264 1
	mov	r0, r3
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE11:
	.size	MCAL_GPIO_LockPin, .-MCAL_GPIO_LockPin
.Letext0:
	.file 2 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "drivers/Inc/Platform_Types.h"
	.file 5 "drivers/Inc/stm32f401xx.h"
	.file 6 "drivers/Inc/stm32f401xx_gpio_driver.h"
	.file 7 "drivers/Inc/stm32f401xx_rcc_driver.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x699
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x1d
	.4byte	.LASF90
	.4byte	.LASF91
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x55
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x7d
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xa
	.4byte	0x7d
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x49
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x71
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x4
	.byte	0x45
	.byte	0x1d
	.4byte	0x55
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x47
	.byte	0x1d
	.4byte	0x63
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x4
	.byte	0x4a
	.byte	0x1d
	.4byte	0x7d
	.uleb128 0xa
	.4byte	0xc7
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.4byte	.LASF19
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x4
	.byte	0x70
	.byte	0x21
	.4byte	0x84
	.uleb128 0xb
	.byte	0x28
	.byte	0x5
	.byte	0xe8
	.4byte	0x16a
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x5
	.byte	0xe9
	.byte	0xf
	.4byte	0xe6
	.byte	0
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x5
	.byte	0xea
	.byte	0xf
	.4byte	0xe6
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x5
	.byte	0xeb
	.byte	0xf
	.4byte	0xe6
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x5
	.byte	0xec
	.byte	0xf
	.4byte	0xe6
	.byte	0xc
	.uleb128 0x7
	.ascii	"IDR\000"
	.byte	0xed
	.4byte	0xe6
	.byte	0x10
	.uleb128 0x7
	.ascii	"ODR\000"
	.byte	0xee
	.4byte	0xe6
	.byte	0x14
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x5
	.byte	0xef
	.byte	0xf
	.4byte	0xe6
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF26
	.byte	0x5
	.byte	0xf0
	.byte	0xf
	.4byte	0xe6
	.byte	0x1c
	.uleb128 0x7
	.ascii	"AFR\000"
	.byte	0xf1
	.4byte	0x17a
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	0xe6
	.4byte	0x17a
	.uleb128 0xd
	.4byte	0x26
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.4byte	0x16a
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0x5
	.byte	0xf2
	.byte	0x3
	.4byte	0xf2
	.uleb128 0xb
	.byte	0x90
	.byte	0x5
	.byte	0xf9
	.4byte	0x307
	.uleb128 0x7
	.ascii	"CR\000"
	.byte	0xfa
	.4byte	0xe6
	.byte	0
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x5
	.byte	0xfb
	.byte	0xf
	.4byte	0xe6
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x5
	.byte	0xfc
	.byte	0xf
	.4byte	0xe6
	.byte	0x8
	.uleb128 0x7
	.ascii	"CIR\000"
	.byte	0xfd
	.4byte	0xe6
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x5
	.byte	0xfe
	.byte	0xf
	.4byte	0xe6
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x5
	.byte	0xff
	.byte	0xf
	.4byte	0xe6
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF32
	.2byte	0x100
	.byte	0xd
	.4byte	0x307
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x101
	.byte	0xf
	.4byte	0xe6
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF34
	.2byte	0x102
	.byte	0xf
	.4byte	0xe6
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x103
	.byte	0xd
	.4byte	0x307
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF36
	.2byte	0x104
	.byte	0xf
	.4byte	0xe6
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x105
	.byte	0xf
	.4byte	0xe6
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x106
	.byte	0xd
	.4byte	0x307
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x107
	.byte	0xf
	.4byte	0xe6
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF40
	.2byte	0x108
	.byte	0xf
	.4byte	0xe6
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF41
	.2byte	0x109
	.byte	0xd
	.4byte	0x307
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF42
	.2byte	0x10a
	.byte	0xf
	.4byte	0xe6
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF43
	.2byte	0x10b
	.byte	0xf
	.4byte	0xe6
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF44
	.2byte	0x10c
	.byte	0xd
	.4byte	0x307
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF45
	.2byte	0x10d
	.byte	0xf
	.4byte	0xe6
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF46
	.2byte	0x10e
	.byte	0xf
	.4byte	0xe6
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF47
	.2byte	0x10f
	.byte	0xd
	.4byte	0x307
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x110
	.byte	0xf
	.4byte	0xe6
	.byte	0x70
	.uleb128 0x8
	.ascii	"CSR\000"
	.2byte	0x111
	.4byte	0xe6
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF49
	.2byte	0x112
	.byte	0xd
	.4byte	0x307
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF50
	.2byte	0x113
	.byte	0xf
	.4byte	0xe6
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x114
	.byte	0xf
	.4byte	0xe6
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x115
	.byte	0xd
	.4byte	0xc7
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF53
	.2byte	0x116
	.byte	0xf
	.4byte	0xe6
	.byte	0x8c
	.byte	0
	.uleb128 0xc
	.4byte	0xc7
	.4byte	0x317
	.uleb128 0xd
	.4byte	0x26
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.4byte	.LASF54
	.2byte	0x117
	.4byte	0x18b
	.uleb128 0x10
	.byte	0x18
	.2byte	0x11e
	.4byte	0x375
	.uleb128 0x8
	.ascii	"IMR\000"
	.2byte	0x11f
	.4byte	0xe6
	.byte	0
	.uleb128 0x8
	.ascii	"EMR\000"
	.2byte	0x120
	.4byte	0xe6
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF55
	.2byte	0x121
	.byte	0xf
	.4byte	0xe6
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF56
	.2byte	0x122
	.byte	0xf
	.4byte	0xe6
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF57
	.2byte	0x123
	.byte	0xf
	.4byte	0xe6
	.byte	0x10
	.uleb128 0x8
	.ascii	"PR\000"
	.2byte	0x124
	.4byte	0xe6
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.4byte	.LASF58
	.2byte	0x125
	.4byte	0x322
	.uleb128 0x10
	.byte	0x30
	.2byte	0x12c
	.4byte	0x3e3
	.uleb128 0x1
	.4byte	.LASF59
	.2byte	0x12d
	.byte	0xf
	.4byte	0xe6
	.byte	0
	.uleb128 0x8
	.ascii	"PMC\000"
	.2byte	0x12e
	.4byte	0xe6
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF60
	.2byte	0x12f
	.byte	0xf
	.4byte	0x3f3
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x130
	.byte	0xf
	.4byte	0x307
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF61
	.2byte	0x131
	.byte	0xf
	.4byte	0xe6
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x132
	.byte	0xf
	.4byte	0x307
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF29
	.2byte	0x133
	.byte	0xf
	.4byte	0xe6
	.byte	0x2c
	.byte	0
	.uleb128 0xc
	.4byte	0xe6
	.4byte	0x3f3
	.uleb128 0xd
	.4byte	0x26
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.4byte	0x3e3
	.uleb128 0xe
	.4byte	.LASF62
	.2byte	0x134
	.4byte	0x380
	.uleb128 0xb
	.byte	0x10
	.byte	0x6
	.byte	0x28
	.4byte	0x45a
	.uleb128 0x2
	.4byte	.LASF63
	.byte	0x6
	.byte	0x29
	.byte	0xb
	.4byte	0xaf
	.byte	0
	.uleb128 0x2
	.4byte	.LASF64
	.byte	0x6
	.byte	0x2b
	.byte	0xb
	.4byte	0xaf
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF65
	.byte	0x6
	.byte	0x2d
	.byte	0xc
	.4byte	0xbb
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF66
	.byte	0x6
	.byte	0x2f
	.byte	0xc
	.4byte	0xc7
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF67
	.byte	0x6
	.byte	0x30
	.byte	0xc
	.4byte	0xc7
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF68
	.byte	0x6
	.byte	0x31
	.byte	0xc
	.4byte	0xc7
	.byte	0xc
	.byte	0
	.uleb128 0x5
	.4byte	.LASF69
	.byte	0x6
	.byte	0x32
	.byte	0x3
	.4byte	0x403
	.uleb128 0x14
	.4byte	.LASF92
	.byte	0x7
	.byte	0x5f
	.byte	0x6
	.4byte	0x478
	.uleb128 0x15
	.4byte	0x97
	.byte	0
	.uleb128 0xf
	.4byte	.LASF77
	.byte	0xed
	.byte	0x7
	.4byte	0xaf
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4bc
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0xed
	.byte	0x27
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.4byte	.LASF71
	.byte	0xed
	.byte	0x35
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x6
	.4byte	.LASF79
	.byte	0xf4
	.byte	0x15
	.4byte	0xd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	0x17f
	.uleb128 0x9
	.4byte	.LASF72
	.byte	0xd5
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e4
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0xd5
	.byte	0x29
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF73
	.byte	0xc6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x515
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0xc6
	.byte	0x28
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF71
	.byte	0xc6
	.byte	0x36
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0xb6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x546
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0xb6
	.byte	0x28
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0xb6
	.byte	0x36
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.4byte	.LASF76
	.byte	0xa2
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x585
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0xa2
	.byte	0x27
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF71
	.byte	0xa2
	.byte	0x35
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0xa2
	.byte	0x46
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0xf
	.4byte	.LASF78
	.byte	0x90
	.byte	0x8
	.4byte	0xbb
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5bb
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0x90
	.byte	0x29
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.4byte	.LASF80
	.byte	0x91
	.byte	0xc
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0xf
	.4byte	.LASF81
	.byte	0x7f
	.byte	0x7
	.4byte	0xaf
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ff
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0x7f
	.byte	0x27
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.4byte	.LASF71
	.byte	0x7f
	.byte	0x35
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x80
	.byte	0xd
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x9
	.4byte	.LASF83
	.byte	0x60
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x622
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0x60
	.byte	0x25
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF84
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x697
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0x1e
	.byte	0x23
	.4byte	0x4bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.4byte	.LASF85
	.byte	0x1e
	.byte	0x3c
	.4byte	0x697
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x1f
	.byte	0xb
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x6
	.4byte	.LASF86
	.byte	0x33
	.byte	0x10
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x6
	.4byte	.LASF87
	.byte	0x34
	.byte	0x10
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x35
	.byte	0x10
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	0x45a
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 15
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
.LASF42:
	.ascii	"AHB1LPENR\000"
.LASF10:
	.ascii	"long unsigned int\000"
.LASF23:
	.ascii	"OSPEEDR\000"
.LASF77:
	.ascii	"MCAL_GPIO_LockPin\000"
.LASF33:
	.ascii	"APB1RSTR\000"
.LASF37:
	.ascii	"AHB2ENR\000"
.LASF64:
	.ascii	"GPIO_PinSpeed\000"
.LASF79:
	.ascii	"temp\000"
.LASF5:
	.ascii	"short int\000"
.LASF48:
	.ascii	"BDCR\000"
.LASF51:
	.ascii	"PLLI2SCFGR\000"
.LASF1:
	.ascii	"long long int\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF81:
	.ascii	"MCAL_GPIO_ReadPin\000"
.LASF76:
	.ascii	"MCAL_GPIO_WritePin\000"
.LASF50:
	.ascii	"SSCGR\000"
.LASF90:
	.ascii	"drivers/Src/stm32f401xx_gpio_driver.c\000"
.LASF88:
	.ascii	"portcode\000"
.LASF82:
	.ascii	"value\000"
.LASF29:
	.ascii	"CFGR\000"
.LASF16:
	.ascii	"uint16\000"
.LASF92:
	.ascii	"MCAL_RCC_Enable_Peripheral\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF60:
	.ascii	"EXTICR\000"
.LASF39:
	.ascii	"APB1ENR\000"
.LASF15:
	.ascii	"uint8\000"
.LASF30:
	.ascii	"AHB1RSTR\000"
.LASF78:
	.ascii	"MCAL_GPIO_ReadPort\000"
.LASF22:
	.ascii	"OTYPER\000"
.LASF53:
	.ascii	"DCKCFGR\000"
.LASF18:
	.ascii	"float\000"
.LASF59:
	.ascii	"MEMRMP\000"
.LASF24:
	.ascii	"PUPDR\000"
.LASF58:
	.ascii	"EXTI_TypeDef\000"
.LASF85:
	.ascii	"PinConfig\000"
.LASF54:
	.ascii	"RCC_TypeDef\000"
.LASF25:
	.ascii	"BSRR\000"
.LASF21:
	.ascii	"MODER\000"
.LASF34:
	.ascii	"APB2RSTR\000"
.LASF8:
	.ascii	"__uint8_t\000"
.LASF83:
	.ascii	"MCAL_GPIO_DeInit\000"
.LASF84:
	.ascii	"MCAL_GPIO_Init\000"
.LASF61:
	.ascii	"CMPCR\000"
.LASF2:
	.ascii	"long double\000"
.LASF75:
	.ascii	"Value\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF68:
	.ascii	"GPIO_PinAltFunMode\000"
.LASF40:
	.ascii	"APB2ENR\000"
.LASF3:
	.ascii	"signed char\000"
.LASF73:
	.ascii	"MCAL_GPIO_TogglePin\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF31:
	.ascii	"AHB2RSTR\000"
.LASF71:
	.ascii	"PinNumber\000"
.LASF56:
	.ascii	"FTSR\000"
.LASF65:
	.ascii	"GPIO_PinNumber\000"
.LASF28:
	.ascii	"PLLCFGR\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF74:
	.ascii	"MCAL_GPIO_WritePort\000"
.LASF45:
	.ascii	"APB1LPENR\000"
.LASF12:
	.ascii	"char\000"
.LASF7:
	.ascii	"long int\000"
.LASF55:
	.ascii	"RTSR\000"
.LASF43:
	.ascii	"AHB2LPENR\000"
.LASF20:
	.ascii	"vuint32_t\000"
.LASF41:
	.ascii	"RESERVED3\000"
.LASF32:
	.ascii	"RESERVED0\000"
.LASF35:
	.ascii	"RESERVED1\000"
.LASF38:
	.ascii	"RESERVED2\000"
.LASF17:
	.ascii	"uint32\000"
.LASF44:
	.ascii	"RESERVED4\000"
.LASF47:
	.ascii	"RESERVED5\000"
.LASF49:
	.ascii	"RESERVED6\000"
.LASF52:
	.ascii	"RESERVED7\000"
.LASF19:
	.ascii	"double\000"
.LASF63:
	.ascii	"GPIO_MODE\000"
.LASF70:
	.ascii	"GPIOx\000"
.LASF36:
	.ascii	"AHB1ENR\000"
.LASF80:
	.ascii	"port_value\000"
.LASF72:
	.ascii	"MCAL_GPIO_TogglePort\000"
.LASF69:
	.ascii	"GPIO_PinConfig_t\000"
.LASF67:
	.ascii	"GPIO_PinOPType\000"
.LASF89:
	.ascii	"GNU C11 12.3.1 20230626 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0 -std=gnu11\000"
.LASF86:
	.ascii	"temp1\000"
.LASF87:
	.ascii	"temp2\000"
.LASF62:
	.ascii	"SYSCFG_RegDef_t\000"
.LASF66:
	.ascii	"GPIO_PinPuPdControl\000"
.LASF27:
	.ascii	"GPIO_TypeDef\000"
.LASF91:
	.ascii	"/home/mohamed/Downloads/test/corrected4/corrected/S"
	.ascii	"mart Car Parking Managment System\000"
.LASF26:
	.ascii	"LCKR\000"
.LASF46:
	.ascii	"APB2LPENR\000"
.LASF57:
	.ascii	"SWIER\000"
	.ident	"GCC: (GNU Tools for STM32 12.3.rel1.20240612-1315) 12.3.1 20230626"
