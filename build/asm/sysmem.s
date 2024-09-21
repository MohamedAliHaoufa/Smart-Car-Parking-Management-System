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
	.file	"sysmem.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "Src/sysmem.c"
	.bss
	.align	2
__sbrk_heap_end:
	.space	4
	.size	__sbrk_heap_end, 4
	.text
	.align	1
	.global	_sbrk
	.syntax unified
	.thumb
	.thumb_func
	.type	_sbrk, %function
_sbrk:
.LFB0:
	.loc 1 54 1
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
	.loc 1 58 32
	ldr	r2, .L5
	.loc 1 58 53
	ldr	r3, .L5+4
	.loc 1 58 18
	subs	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 59 18
	ldr	r3, [r7, #20]
	str	r3, [r7, #16]
	.loc 1 63 12
	ldr	r3, .L5+8
	ldr	r3, [r3]
	.loc 1 63 6
	cmp	r3, #0
	bne	.L2
	.loc 1 65 21
	ldr	r3, .L5+8
	ldr	r2, .L5+12
	str	r2, [r3]
.L2:
	.loc 1 69 23
	ldr	r3, .L5+8
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	.loc 1 69 6
	ldr	r2, [r7, #16]
	cmp	r2, r3
	bcs	.L3
	.loc 1 71 5
	bl	__errno
	mov	r3, r0
	.loc 1 71 11
	movs	r2, #12
	str	r2, [r3]
	.loc 1 72 12
	mov	r3, #-1
	b	.L4
.L3:
	.loc 1 75 17
	ldr	r3, .L5+8
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 76 19
	ldr	r3, .L5+8
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	ldr	r2, .L5+8
	str	r3, [r2]
	.loc 1 78 10
	ldr	r3, [r7, #12]
.L4:
	.loc 1 79 1
	mov	r0, r3
	adds	r7, r7, #24
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	_estack
	.word	_Min_Stack_Size
	.word	__sbrk_heap_end
	.word	_end
	.cfi_endproc
.LFE0:
	.size	_sbrk, .-_sbrk
.Letext0:
	.file 2 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/lib/gcc/arm-none-eabi/12.3.1/include/stddef.h"
	.file 3 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h"
	.file 4 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_stdint.h"
	.file 5 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/errno.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x160
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x1d
	.4byte	.LASF24
	.4byte	.LASF25
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0x91
	.byte	0x1a
	.4byte	0x26
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
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
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2b
	.byte	0x18
	.4byte	0x61
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x3
	.byte	0x4f
	.byte	0x19
	.4byte	0x89
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x9
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x55
	.uleb128 0x6
	.4byte	0xa0
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x7d
	.uleb128 0x6
	.4byte	0xb1
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x1e
	.byte	0x11
	.4byte	0xd3
	.uleb128 0x5
	.byte	0x3
	.4byte	__sbrk_heap_end
	.uleb128 0x4
	.4byte	0xa0
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x5
	.byte	0x13
	.byte	0xd
	.4byte	0xe4
	.uleb128 0x4
	.4byte	0x26
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0x35
	.byte	0x7
	.4byte	0x97
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15e
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x1
	.byte	0x35
	.byte	0x17
	.4byte	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x37
	.byte	0x12
	.4byte	0xa0
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x38
	.byte	0x12
	.4byte	0xa0
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x39
	.byte	0x13
	.4byte	0xb1
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x3a
	.byte	0x12
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x3b
	.byte	0x12
	.4byte	0x15e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x3c
	.byte	0xc
	.4byte	0xd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.4byte	0xac
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xc
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
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
.LASF1:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"short unsigned int\000"
.LASF17:
	.ascii	"_estack\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"prev_heap_end\000"
.LASF21:
	.ascii	"max_heap\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF4:
	.ascii	"ptrdiff_t\000"
.LASF11:
	.ascii	"long unsigned int\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF18:
	.ascii	"_Min_Stack_Size\000"
.LASF14:
	.ascii	"uint8_t\000"
.LASF6:
	.ascii	"unsigned char\000"
.LASF28:
	.ascii	"incr\000"
.LASF13:
	.ascii	"char\000"
.LASF19:
	.ascii	"__sbrk_heap_end\000"
.LASF15:
	.ascii	"uint32_t\000"
.LASF9:
	.ascii	"long int\000"
.LASF25:
	.ascii	"/home/mohamed/Downloads/test/corrected4/corrected/S"
	.ascii	"mart Car Parking Managment System\000"
.LASF16:
	.ascii	"_end\000"
.LASF26:
	.ascii	"__errno\000"
.LASF3:
	.ascii	"signed char\000"
.LASF27:
	.ascii	"_sbrk\000"
.LASF2:
	.ascii	"long double\000"
.LASF20:
	.ascii	"stack_limit\000"
.LASF7:
	.ascii	"short int\000"
.LASF24:
	.ascii	"Src/sysmem.c\000"
.LASF23:
	.ascii	"GNU C11 12.3.1 20230626 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0 -std=gnu11\000"
	.ident	"GCC: (GNU Tools for STM32 12.3.rel1.20240612-1315) 12.3.1 20230626"
