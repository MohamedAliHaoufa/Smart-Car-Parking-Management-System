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
	.file	"stm32f401xx_timer_driver.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "drivers/Src/stm32f401xx_timer_driver.c"
	.align	1
	.global	Timer2_init
	.syntax unified
	.thumb
	.thumb_func
	.type	Timer2_init, %function
Timer2_init:
.LFB3:
	.loc 1 33 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 35 8
	ldr	r3, .L3
	ldr	r3, [r3, #64]
	ldr	r2, .L3
	.loc 1 35 18
	orr	r3, r3, #1
	str	r3, [r2, #64]
	.loc 1 38 9
	mov	r3, #1073741824
	.loc 1 38 15
	movs	r2, #7
	str	r2, [r3, #40]
	.loc 1 41 9
	mov	r3, #1073741824
	.loc 1 41 15
	movw	r2, #50000
	str	r2, [r3, #44]
	.loc 1 44 9
	mov	r3, #1073741824
	ldr	r3, [r3]
	mov	r2, #1073741824
	.loc 1 44 15
	orr	r3, r3, #1
	str	r3, [r2]
	.loc 1 47 11
	nop
.L2:
	.loc 1 47 19 discriminator 1
	mov	r3, #1073741824
	ldr	r3, [r3, #16]
	.loc 1 47 25 discriminator 1
	and	r3, r3, #1
	.loc 1 47 12 discriminator 1
	cmp	r3, #0
	beq	.L2
	.loc 1 48 1
	nop
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	1073887232
	.cfi_endproc
.LFE3:
	.size	Timer2_init, .-Timer2_init
	.align	1
	.global	dus
	.syntax unified
	.thumb
	.thumb_func
	.type	dus, %function
dus:
.LFB4:
	.loc 1 62 1
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
	.loc 1 64 9
	mov	r3, #1073741824
	.loc 1 64 15
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 67 11
	nop
.L6:
	.loc 1 67 16 discriminator 1
	mov	r3, #1073741824
	ldr	r2, [r3, #36]
	.loc 1 67 22 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L6
	.loc 1 68 1
	nop
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
.LFE4:
	.size	dus, .-dus
	.align	1
	.global	dms
	.syntax unified
	.thumb
	.thumb_func
	.type	dms, %function
dms:
.LFB5:
	.loc 1 81 1
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
	.loc 1 82 9
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 83 12
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 83 5
	b	.L8
.L9:
	.loc 1 85 9 discriminator 3
	mov	r0, #1000
	bl	dus
	.loc 1 83 26 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L8:
	.loc 1 83 19 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L9
	.loc 1 87 1
	nop
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE5:
	.size	dms, .-dms
.Letext0:
	.file 2 "drivers/Inc/Platform_Types.h"
	.file 3 "drivers/Inc/stm32f401xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3bb
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x1d
	.4byte	.LASF55
	.4byte	.LASF56
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0xb
	.4byte	0x65
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x4a
	.byte	0x1d
	.4byte	0x65
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x70
	.byte	0x21
	.4byte	0x6c
	.uleb128 0xc
	.byte	0x90
	.byte	0x3
	.byte	0xf9
	.byte	0x9
	.4byte	0x219
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0xfa
	.4byte	0x98
	.byte	0
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0xfb
	.4byte	0x98
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0xfc
	.4byte	0x98
	.byte	0x8
	.uleb128 0x6
	.ascii	"CIR\000"
	.byte	0xfd
	.4byte	0x98
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0xfe
	.4byte	0x98
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0xff
	.4byte	0x98
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF19
	.2byte	0x100
	.byte	0xd
	.4byte	0x219
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF20
	.2byte	0x101
	.byte	0xf
	.4byte	0x98
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF21
	.2byte	0x102
	.byte	0xf
	.4byte	0x98
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF22
	.2byte	0x103
	.byte	0xd
	.4byte	0x219
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF23
	.2byte	0x104
	.byte	0xf
	.4byte	0x98
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF24
	.2byte	0x105
	.byte	0xf
	.4byte	0x98
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF25
	.2byte	0x106
	.byte	0xd
	.4byte	0x219
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF26
	.2byte	0x107
	.byte	0xf
	.4byte	0x98
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF27
	.2byte	0x108
	.byte	0xf
	.4byte	0x98
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF28
	.2byte	0x109
	.byte	0xd
	.4byte	0x219
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF29
	.2byte	0x10a
	.byte	0xf
	.4byte	0x98
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF30
	.2byte	0x10b
	.byte	0xf
	.4byte	0x98
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x10c
	.byte	0xd
	.4byte	0x219
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF32
	.2byte	0x10d
	.byte	0xf
	.4byte	0x98
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF33
	.2byte	0x10e
	.byte	0xf
	.4byte	0x98
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF34
	.2byte	0x10f
	.byte	0xd
	.4byte	0x219
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF35
	.2byte	0x110
	.byte	0xf
	.4byte	0x98
	.byte	0x70
	.uleb128 0x3
	.ascii	"CSR\000"
	.2byte	0x111
	.byte	0xf
	.4byte	0x98
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF36
	.2byte	0x112
	.byte	0xd
	.4byte	0x219
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF37
	.2byte	0x113
	.byte	0xf
	.4byte	0x98
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF38
	.2byte	0x114
	.byte	0xf
	.4byte	0x98
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x115
	.byte	0xd
	.4byte	0x7f
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF40
	.2byte	0x116
	.byte	0xf
	.4byte	0x98
	.byte	0x8c
	.byte	0
	.uleb128 0xd
	.4byte	0x7f
	.4byte	0x229
	.uleb128 0xe
	.4byte	0x26
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF41
	.2byte	0x117
	.4byte	0xa3
	.uleb128 0xf
	.byte	0x54
	.byte	0x3
	.2byte	0x17b
	.byte	0x9
	.4byte	0x34e
	.uleb128 0x3
	.ascii	"CR1\000"
	.2byte	0x17c
	.byte	0xc
	.4byte	0x7f
	.byte	0
	.uleb128 0x3
	.ascii	"CR2\000"
	.2byte	0x17d
	.byte	0xc
	.4byte	0x7f
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF42
	.2byte	0x17e
	.byte	0xc
	.4byte	0x7f
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF43
	.2byte	0x17f
	.byte	0xc
	.4byte	0x7f
	.byte	0xc
	.uleb128 0x3
	.ascii	"SR\000"
	.2byte	0x180
	.byte	0xc
	.4byte	0x7f
	.byte	0x10
	.uleb128 0x3
	.ascii	"EGR\000"
	.2byte	0x181
	.byte	0xc
	.4byte	0x7f
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF44
	.2byte	0x182
	.byte	0xc
	.4byte	0x7f
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF45
	.2byte	0x183
	.byte	0xc
	.4byte	0x7f
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF46
	.2byte	0x184
	.byte	0xc
	.4byte	0x7f
	.byte	0x20
	.uleb128 0x3
	.ascii	"CNT\000"
	.2byte	0x185
	.byte	0xc
	.4byte	0x7f
	.byte	0x24
	.uleb128 0x3
	.ascii	"PSC\000"
	.2byte	0x186
	.byte	0xc
	.4byte	0x7f
	.byte	0x28
	.uleb128 0x3
	.ascii	"ARR\000"
	.2byte	0x187
	.byte	0xc
	.4byte	0x7f
	.byte	0x2c
	.uleb128 0x3
	.ascii	"RCR\000"
	.2byte	0x188
	.byte	0xc
	.4byte	0x7f
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF47
	.2byte	0x189
	.byte	0xc
	.4byte	0x7f
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x18a
	.byte	0xc
	.4byte	0x7f
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF49
	.2byte	0x18b
	.byte	0xc
	.4byte	0x7f
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF50
	.2byte	0x18c
	.byte	0xc
	.4byte	0x7f
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x18d
	.byte	0xc
	.4byte	0x7f
	.byte	0x44
	.uleb128 0x3
	.ascii	"DCR\000"
	.2byte	0x18e
	.byte	0xc
	.4byte	0x7f
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x18f
	.byte	0xc
	.4byte	0x7f
	.byte	0x4c
	.uleb128 0x3
	.ascii	"OR\000"
	.2byte	0x190
	.byte	0xc
	.4byte	0x7f
	.byte	0x50
	.byte	0
	.uleb128 0x7
	.4byte	.LASF53
	.2byte	0x191
	.4byte	0x234
	.uleb128 0x10
	.ascii	"dms\000"
	.byte	0x1
	.byte	0x50
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x389
	.uleb128 0x8
	.ascii	"ms\000"
	.byte	0x50
	.4byte	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x52
	.byte	0x9
	.4byte	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.ascii	"dus\000"
	.byte	0x1
	.byte	0x3d
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ac
	.uleb128 0x8
	.ascii	"us\000"
	.byte	0x3d
	.4byte	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x1
	.byte	0x20
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
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
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 14
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x11
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
.LASF29:
	.ascii	"AHB1LPENR\000"
.LASF46:
	.ascii	"CCER\000"
.LASF20:
	.ascii	"APB1RSTR\000"
.LASF24:
	.ascii	"AHB2ENR\000"
.LASF52:
	.ascii	"DMAR\000"
.LASF44:
	.ascii	"CCMR1\000"
.LASF45:
	.ascii	"CCMR2\000"
.LASF5:
	.ascii	"short int\000"
.LASF35:
	.ascii	"BDCR\000"
.LASF38:
	.ascii	"PLLI2SCFGR\000"
.LASF53:
	.ascii	"TIM1_TypeDef\000"
.LASF37:
	.ascii	"SSCGR\000"
.LASF17:
	.ascii	"AHB1RSTR\000"
.LASF16:
	.ascii	"CFGR\000"
.LASF28:
	.ascii	"RESERVED3\000"
.LASF26:
	.ascii	"APB1ENR\000"
.LASF55:
	.ascii	"drivers/Src/stm32f401xx_timer_driver.c\000"
.LASF40:
	.ascii	"DCKCFGR\000"
.LASF11:
	.ascii	"float\000"
.LASF1:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"char\000"
.LASF47:
	.ascii	"CCR1\000"
.LASF7:
	.ascii	"long int\000"
.LASF49:
	.ascii	"CCR3\000"
.LASF50:
	.ascii	"CCR4\000"
.LASF41:
	.ascii	"RCC_TypeDef\000"
.LASF21:
	.ascii	"APB2RSTR\000"
.LASF2:
	.ascii	"long double\000"
.LASF42:
	.ascii	"SMCR\000"
.LASF48:
	.ascii	"CCR2\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF27:
	.ascii	"APB2ENR\000"
.LASF3:
	.ascii	"signed char\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"AHB2RSTR\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF43:
	.ascii	"DIER\000"
.LASF15:
	.ascii	"PLLCFGR\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF32:
	.ascii	"APB1LPENR\000"
.LASF57:
	.ascii	"Timer2_init\000"
.LASF51:
	.ascii	"BDTR\000"
.LASF30:
	.ascii	"AHB2LPENR\000"
.LASF14:
	.ascii	"vuint32_t\000"
.LASF19:
	.ascii	"RESERVED0\000"
.LASF22:
	.ascii	"RESERVED1\000"
.LASF25:
	.ascii	"RESERVED2\000"
.LASF13:
	.ascii	"uint32\000"
.LASF31:
	.ascii	"RESERVED4\000"
.LASF34:
	.ascii	"RESERVED5\000"
.LASF36:
	.ascii	"RESERVED6\000"
.LASF39:
	.ascii	"RESERVED7\000"
.LASF12:
	.ascii	"double\000"
.LASF23:
	.ascii	"AHB1ENR\000"
.LASF54:
	.ascii	"GNU C11 12.3.1 20230626 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0 -std=gnu11\000"
.LASF56:
	.ascii	"/home/mohamed/Downloads/test/corrected4/corrected/S"
	.ascii	"mart Car Parking Managment System\000"
.LASF33:
	.ascii	"APB2LPENR\000"
	.ident	"GCC: (GNU Tools for STM32 12.3.rel1.20240612-1315) 12.3.1 20230626"
