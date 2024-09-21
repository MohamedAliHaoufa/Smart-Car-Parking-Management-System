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
	.file	"syscall.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "Src/syscall.c"
	.global	__env
	.bss
	.align	2
	.type	__env, %object
	.size	__env, 4
__env:
	.space	4
	.global	environ
	.data
	.align	2
	.type	environ, %object
	.size	environ, 4
environ:
	.word	__env
	.text
	.align	1
	.global	initialise_monitor_handles
	.syntax unified
	.thumb
	.thumb_func
	.type	initialise_monitor_handles, %function
initialise_monitor_handles:
.LFB25:
	.loc 1 45 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 46 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE25:
	.size	initialise_monitor_handles, .-initialise_monitor_handles
	.align	1
	.global	_getpid
	.syntax unified
	.thumb
	.thumb_func
	.type	_getpid, %function
_getpid:
.LFB26:
	.loc 1 49 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 50 10
	movs	r3, #1
	.loc 1 51 1
	mov	r0, r3
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE26:
	.size	_getpid, .-_getpid
	.align	1
	.global	_kill
	.syntax unified
	.thumb
	.thumb_func
	.type	_kill, %function
_kill:
.LFB27:
	.loc 1 54 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 57 3
	bl	__errno
	mov	r3, r0
	.loc 1 57 9
	movs	r2, #22
	str	r2, [r3]
	.loc 1 58 10
	mov	r3, #-1
	.loc 1 59 1
	mov	r0, r3
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE27:
	.size	_kill, .-_kill
	.align	1
	.global	_exit
	.syntax unified
	.thumb
	.thumb_func
	.type	_exit, %function
_exit:
.LFB28:
	.loc 1 62 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 63 3
	mov	r1, #-1
	ldr	r0, [r7, #4]
	bl	_kill
.L7:
	.loc 1 64 9 discriminator 1
	nop
	b	.L7
	.cfi_endproc
.LFE28:
	.size	_exit, .-_exit
	.align	1
	.weak	_read
	.syntax unified
	.thumb
	.thumb_func
	.type	_read, %function
_read:
.LFB29:
	.loc 1 68 1
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
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 72 16
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 72 3
	b	.L9
.L10:
	.loc 1 74 14 discriminator 3
	bl	__io_getchar
	mov	r1, r0
	.loc 1 74 9 discriminator 3
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	.loc 1 74 12 discriminator 3
	uxtb	r2, r1
	strb	r2, [r3]
	.loc 1 72 43 discriminator 3
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L9:
	.loc 1 72 29 discriminator 1
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L10
	.loc 1 77 10
	ldr	r3, [r7, #4]
	.loc 1 78 1
	mov	r0, r3
	adds	r7, r7, #24
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE29:
	.size	_read, .-_read
	.align	1
	.weak	_write
	.syntax unified
	.thumb
	.thumb_func
	.type	_write, %function
_write:
.LFB30:
	.loc 1 81 1
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
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 85 16
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 85 3
	b	.L13
.L14:
	.loc 1 87 22 discriminator 3
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	.loc 1 87 18 discriminator 3
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 87 5 discriminator 3
	mov	r0, r3
	bl	__io_putchar
	.loc 1 85 43 discriminator 3
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L13:
	.loc 1 85 29 discriminator 1
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L14
	.loc 1 89 10
	ldr	r3, [r7, #4]
	.loc 1 90 1
	mov	r0, r3
	adds	r7, r7, #24
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE30:
	.size	_write, .-_write
	.align	1
	.global	_close
	.syntax unified
	.thumb
	.thumb_func
	.type	_close, %function
_close:
.LFB31:
	.loc 1 93 1
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
	.loc 1 95 10
	mov	r3, #-1
	.loc 1 96 1
	mov	r0, r3
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
.LFE31:
	.size	_close, .-_close
	.align	1
	.global	_fstat
	.syntax unified
	.thumb
	.thumb_func
	.type	_fstat, %function
_fstat:
.LFB32:
	.loc 1 100 1
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
	str	r1, [r7]
	.loc 1 102 15
	ldr	r3, [r7]
	mov	r2, #8192
	str	r2, [r3, #4]
	.loc 1 103 10
	movs	r3, #0
	.loc 1 104 1
	mov	r0, r3
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
.LFE32:
	.size	_fstat, .-_fstat
	.align	1
	.global	_isatty
	.syntax unified
	.thumb
	.thumb_func
	.type	_isatty, %function
_isatty:
.LFB33:
	.loc 1 107 1
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
	.loc 1 109 10
	movs	r3, #1
	.loc 1 110 1
	mov	r0, r3
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
.LFE33:
	.size	_isatty, .-_isatty
	.align	1
	.global	_lseek
	.syntax unified
	.thumb
	.thumb_func
	.type	_lseek, %function
_lseek:
.LFB34:
	.loc 1 113 1
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
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 117 10
	movs	r3, #0
	.loc 1 118 1
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
.LFE34:
	.size	_lseek, .-_lseek
	.align	1
	.global	_open
	.syntax unified
	.thumb
	.thumb_func
	.type	_open, %function
_open:
.LFB35:
	.loc 1 121 1
	.cfi_startproc
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	@ link register save eliminated.
	push	{r1, r2, r3}
	.cfi_def_cfa_offset 12
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	push	{r7}
	.cfi_def_cfa_offset 16
	.cfi_offset 7, -16
	sub	sp, sp, #8
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 125 10
	mov	r3, #-1
	.loc 1 126 1
	mov	r0, r3
	adds	r7, r7, #8
	.cfi_def_cfa_offset 16
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 12
	add	sp, sp, #12
	.cfi_restore 3
	.cfi_restore 2
	.cfi_restore 1
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE35:
	.size	_open, .-_open
	.align	1
	.global	_wait
	.syntax unified
	.thumb
	.thumb_func
	.type	_wait, %function
_wait:
.LFB36:
	.loc 1 129 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 131 3
	bl	__errno
	mov	r3, r0
	.loc 1 131 9
	movs	r2, #10
	str	r2, [r3]
	.loc 1 132 10
	mov	r3, #-1
	.loc 1 133 1
	mov	r0, r3
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE36:
	.size	_wait, .-_wait
	.align	1
	.global	_unlink
	.syntax unified
	.thumb
	.thumb_func
	.type	_unlink, %function
_unlink:
.LFB37:
	.loc 1 136 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 138 3
	bl	__errno
	mov	r3, r0
	.loc 1 138 9
	movs	r2, #2
	str	r2, [r3]
	.loc 1 139 10
	mov	r3, #-1
	.loc 1 140 1
	mov	r0, r3
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE37:
	.size	_unlink, .-_unlink
	.align	1
	.global	_times
	.syntax unified
	.thumb
	.thumb_func
	.type	_times, %function
_times:
.LFB38:
	.loc 1 143 1
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
	.loc 1 145 10
	mov	r3, #-1
	.loc 1 146 1
	mov	r0, r3
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
.LFE38:
	.size	_times, .-_times
	.align	1
	.global	_stat
	.syntax unified
	.thumb
	.thumb_func
	.type	_stat, %function
_stat:
.LFB39:
	.loc 1 149 1
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
	str	r1, [r7]
	.loc 1 151 15
	ldr	r3, [r7]
	mov	r2, #8192
	str	r2, [r3, #4]
	.loc 1 152 10
	movs	r3, #0
	.loc 1 153 1
	mov	r0, r3
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
.LFE39:
	.size	_stat, .-_stat
	.align	1
	.global	_link
	.syntax unified
	.thumb
	.thumb_func
	.type	_link, %function
_link:
.LFB40:
	.loc 1 156 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 159 3
	bl	__errno
	mov	r3, r0
	.loc 1 159 9
	movs	r2, #31
	str	r2, [r3]
	.loc 1 160 10
	mov	r3, #-1
	.loc 1 161 1
	mov	r0, r3
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE40:
	.size	_link, .-_link
	.align	1
	.global	_fork
	.syntax unified
	.thumb
	.thumb_func
	.type	_fork, %function
_fork:
.LFB41:
	.loc 1 164 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 165 3
	bl	__errno
	mov	r3, r0
	.loc 1 165 9
	movs	r2, #11
	str	r2, [r3]
	.loc 1 166 10
	mov	r3, #-1
	.loc 1 167 1
	mov	r0, r3
	pop	{r7, pc}
	.cfi_endproc
.LFE41:
	.size	_fork, .-_fork
	.align	1
	.global	_execve
	.syntax unified
	.thumb
	.thumb_func
	.type	_execve, %function
_execve:
.LFB42:
	.loc 1 170 1
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
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 174 3
	bl	__errno
	mov	r3, r0
	.loc 1 174 9
	movs	r2, #12
	str	r2, [r3]
	.loc 1 175 10
	mov	r3, #-1
	.loc 1 176 1
	mov	r0, r3
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE42:
	.size	_execve, .-_execve
	.weak	__io_putchar
	.weak	__io_getchar
.Letext0:
	.file 2 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_types.h"
	.file 4 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_timeval.h"
	.file 5 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/_timespec.h"
	.file 6 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/types.h"
	.file 7 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/stat.h"
	.file 8 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/times.h"
	.file 9 "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/arm-none-eabi/include/sys/errno.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x69b
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xf
	.4byte	.LASF84
	.byte	0x1d
	.4byte	.LASF85
	.4byte	.LASF86
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x55
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x1
	.4byte	.LASF9
	.byte	0x2
	.byte	0xc8
	.byte	0x1e
	.4byte	0x5c
	.uleb128 0x10
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x3
	.byte	0x1e
	.byte	0xe
	.4byte	0x42
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x3
	.byte	0x22
	.byte	0xe
	.4byte	0x42
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x3
	.byte	0x2e
	.byte	0xe
	.4byte	0x42
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x3
	.byte	0x38
	.byte	0xf
	.4byte	0x34
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x3
	.byte	0x3c
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x3
	.byte	0x3f
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x3
	.byte	0x4b
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x3
	.byte	0x5a
	.byte	0x14
	.4byte	0x49
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x3
	.byte	0x66
	.byte	0x10
	.4byte	0xa3
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x3
	.byte	0xd5
	.byte	0x18
	.4byte	0x3b
	.uleb128 0x8
	.4byte	0x108
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x4
	.byte	0x2a
	.byte	0x12
	.4byte	0x6a
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x10
	.byte	0x5
	.byte	0x2f
	.4byte	0x142
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x5
	.byte	0x30
	.byte	0x9
	.4byte	0x10f
	.byte	0
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x5
	.byte	0x31
	.byte	0x7
	.4byte	0x42
	.byte	0x8
	.byte	0
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x6
	.byte	0x61
	.byte	0x14
	.4byte	0x8b
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x6
	.byte	0x66
	.byte	0x15
	.4byte	0x97
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x6
	.byte	0x6b
	.byte	0x13
	.4byte	0x55
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x6
	.byte	0x89
	.byte	0x12
	.4byte	0xd3
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x6
	.byte	0x9b
	.byte	0x12
	.4byte	0xeb
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x6
	.byte	0x9f
	.byte	0x12
	.4byte	0xaf
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x6
	.byte	0xa3
	.byte	0x12
	.4byte	0xbb
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x6
	.byte	0xa7
	.byte	0x12
	.4byte	0xc7
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0xdf
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x6
	.byte	0xc0
	.byte	0x13
	.4byte	0xf7
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x58
	.byte	0x7
	.byte	0x1b
	.4byte	0x27d
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x7
	.byte	0x1d
	.byte	0xa
	.4byte	0x17e
	.byte	0
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x7
	.byte	0x1e
	.byte	0xa
	.4byte	0x166
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x7
	.byte	0x1f
	.byte	0xa
	.4byte	0x1a2
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x7
	.byte	0x20
	.byte	0xb
	.4byte	0x1ae
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x7
	.byte	0x21
	.byte	0xa
	.4byte	0x18a
	.byte	0xa
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x7
	.byte	0x22
	.byte	0xa
	.4byte	0x196
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x7
	.byte	0x23
	.byte	0xa
	.4byte	0x17e
	.byte	0xe
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x7
	.byte	0x24
	.byte	0xa
	.4byte	0x172
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x7
	.byte	0x2a
	.byte	0x13
	.4byte	0x11b
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0x7
	.byte	0x2b
	.byte	0x13
	.4byte	0x11b
	.byte	0x28
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x7
	.byte	0x2c
	.byte	0x13
	.4byte	0x11b
	.byte	0x38
	.uleb128 0x2
	.4byte	.LASF49
	.byte	0x7
	.byte	0x2d
	.byte	0x11
	.4byte	0x14e
	.byte	0x48
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0x7
	.byte	0x2e
	.byte	0xc
	.4byte	0x142
	.byte	0x4c
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0x7
	.byte	0x30
	.byte	0x9
	.4byte	0x27d
	.byte	0x50
	.byte	0
	.uleb128 0xa
	.4byte	0x42
	.4byte	0x28d
	.uleb128 0xb
	.4byte	0x7d
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.ascii	"tms\000"
	.byte	0x10
	.byte	0x8
	.byte	0x11
	.byte	0x8
	.4byte	0x2cf
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x8
	.byte	0x12
	.byte	0xa
	.4byte	0x15a
	.byte	0
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x8
	.byte	0x13
	.byte	0xa
	.4byte	0x15a
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x8
	.byte	0x14
	.byte	0xa
	.4byte	0x15a
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF55
	.byte	0x8
	.byte	0x15
	.byte	0xa
	.4byte	0x15a
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.4byte	0x103
	.4byte	0x2df
	.uleb128 0xb
	.4byte	0x7d
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF56
	.byte	0x27
	.byte	0x7
	.4byte	0x2cf
	.uleb128 0x5
	.byte	0x3
	.4byte	__env
	.uleb128 0xc
	.4byte	.LASF57
	.byte	0x28
	.byte	0x8
	.4byte	0x301
	.uleb128 0x5
	.byte	0x3
	.4byte	environ
	.uleb128 0x8
	.4byte	0x103
	.uleb128 0x12
	.4byte	.LASF87
	.byte	0x1
	.byte	0x23
	.byte	0xc
	.4byte	0x76
	.4byte	0x31c
	.uleb128 0x13
	.4byte	0x76
	.byte	0
	.uleb128 0xd
	.4byte	.LASF58
	.byte	0x1
	.byte	0x24
	.byte	0xc
	.4byte	0x76
	.uleb128 0xd
	.4byte	.LASF59
	.byte	0x9
	.byte	0x13
	.byte	0xd
	.4byte	0x334
	.uleb128 0x8
	.4byte	0x76
	.uleb128 0x6
	.4byte	.LASF62
	.byte	0xa9
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x37d
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0xa9
	.byte	0x13
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3
	.4byte	.LASF61
	.byte	0xa9
	.byte	0x20
	.4byte	0x301
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x4
	.ascii	"env\000"
	.byte	0xa9
	.byte	0x2d
	.4byte	0x301
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x1
	.byte	0xa3
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF63
	.byte	0x9b
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c9
	.uleb128 0x4
	.ascii	"old\000"
	.byte	0x9b
	.byte	0x11
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.ascii	"new\000"
	.byte	0x9b
	.byte	0x1c
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x7
	.4byte	.LASF64
	.byte	0x94
	.4byte	0x76
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3fd
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x94
	.byte	0x11
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.ascii	"st\000"
	.byte	0x94
	.byte	0x24
	.4byte	0x3fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.4byte	0x1ba
	.uleb128 0x7
	.4byte	.LASF66
	.byte	0x8e
	.4byte	0x76
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x429
	.uleb128 0x4
	.ascii	"buf\000"
	.byte	0x8e
	.byte	0x18
	.4byte	0x429
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.4byte	0x28d
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x87
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x456
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x87
	.byte	0x13
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x80
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47e
	.uleb128 0x3
	.4byte	.LASF69
	.byte	0x80
	.byte	0x10
	.4byte	0x334
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.4byte	.LASF70
	.byte	0x78
	.4byte	0x76
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b4
	.uleb128 0x3
	.4byte	.LASF71
	.byte	0x78
	.byte	0x11
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.4byte	.LASF72
	.byte	0x78
	.byte	0x1b
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.byte	0
	.uleb128 0x7
	.4byte	.LASF73
	.byte	0x70
	.4byte	0x76
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f7
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x70
	.byte	0x10
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.ascii	"ptr\000"
	.byte	0x70
	.byte	0x1a
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x4
	.ascii	"dir\000"
	.byte	0x70
	.byte	0x23
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x7
	.4byte	.LASF74
	.byte	0x6a
	.4byte	0x76
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x51e
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x6a
	.byte	0x11
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.4byte	.LASF75
	.byte	0x63
	.4byte	0x76
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x552
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x63
	.byte	0x10
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.ascii	"st\000"
	.byte	0x63
	.byte	0x23
	.4byte	0x3fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x7
	.4byte	.LASF76
	.byte	0x5c
	.4byte	0x76
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x579
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x5c
	.byte	0x10
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x50
	.byte	0x1b
	.4byte	0x76
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ca
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x50
	.byte	0x26
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.ascii	"ptr\000"
	.byte	0x50
	.byte	0x32
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.ascii	"len\000"
	.byte	0x50
	.byte	0x3b
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.4byte	.LASF79
	.byte	0x53
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x43
	.byte	0x1b
	.4byte	0x76
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61b
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x43
	.byte	0x25
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.ascii	"ptr\000"
	.byte	0x43
	.byte	0x31
	.4byte	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.ascii	"len\000"
	.byte	0x43
	.byte	0x3a
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.4byte	.LASF79
	.byte	0x46
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF80
	.byte	0x1
	.byte	0x3d
	.byte	0x6
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x640
	.uleb128 0x3
	.4byte	.LASF69
	.byte	0x3d
	.byte	0x11
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.4byte	.LASF81
	.byte	0x35
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x676
	.uleb128 0x4
	.ascii	"pid\000"
	.byte	0x35
	.byte	0xf
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x4
	.ascii	"sig\000"
	.byte	0x35
	.byte	0x18
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF83
	.byte	0x1
	.byte	0x30
	.byte	0x5
	.4byte	0x76
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF88
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x7
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
	.sleb128 5
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x12
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x87
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
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
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
.LASF44:
	.ascii	"st_rdev\000"
.LASF28:
	.ascii	"clock_t\000"
.LASF57:
	.ascii	"environ\000"
.LASF32:
	.ascii	"uid_t\000"
.LASF73:
	.ascii	"_lseek\000"
.LASF14:
	.ascii	"_off_t\000"
.LASF54:
	.ascii	"tms_cutime\000"
.LASF62:
	.ascii	"_execve\000"
.LASF24:
	.ascii	"tv_sec\000"
.LASF27:
	.ascii	"blksize_t\000"
.LASF64:
	.ascii	"_stat\000"
.LASF48:
	.ascii	"st_ctim\000"
.LASF56:
	.ascii	"__env\000"
.LASF80:
	.ascii	"_exit\000"
.LASF77:
	.ascii	"_write\000"
.LASF38:
	.ascii	"st_dev\000"
.LASF75:
	.ascii	"_fstat\000"
.LASF65:
	.ascii	"file\000"
.LASF81:
	.ascii	"_kill\000"
.LASF30:
	.ascii	"off_t\000"
.LASF23:
	.ascii	"time_t\000"
.LASF2:
	.ascii	"short int\000"
.LASF9:
	.ascii	"__int_least64_t\000"
.LASF49:
	.ascii	"st_blksize\000"
.LASF88:
	.ascii	"initialise_monitor_handles\000"
.LASF6:
	.ascii	"long long int\000"
.LASF43:
	.ascii	"st_gid\000"
.LASF19:
	.ascii	"__mode_t\000"
.LASF29:
	.ascii	"ino_t\000"
.LASF55:
	.ascii	"tms_cstime\000"
.LASF66:
	.ascii	"_times\000"
.LASF21:
	.ascii	"__nlink_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF60:
	.ascii	"name\000"
.LASF31:
	.ascii	"dev_t\000"
.LASF68:
	.ascii	"_wait\000"
.LASF11:
	.ascii	"long double\000"
.LASF39:
	.ascii	"st_ino\000"
.LASF78:
	.ascii	"_read\000"
.LASF58:
	.ascii	"__io_getchar\000"
.LASF25:
	.ascii	"tv_nsec\000"
.LASF0:
	.ascii	"signed char\000"
.LASF72:
	.ascii	"flags\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF34:
	.ascii	"mode_t\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF41:
	.ascii	"st_nlink\000"
.LASF70:
	.ascii	"_open\000"
.LASF61:
	.ascii	"argv\000"
.LASF13:
	.ascii	"__blksize_t\000"
.LASF46:
	.ascii	"st_atim\000"
.LASF63:
	.ascii	"_link\000"
.LASF69:
	.ascii	"status\000"
.LASF33:
	.ascii	"gid_t\000"
.LASF76:
	.ascii	"_close\000"
.LASF22:
	.ascii	"char\000"
.LASF4:
	.ascii	"long int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF35:
	.ascii	"nlink_t\000"
.LASF50:
	.ascii	"st_blocks\000"
.LASF74:
	.ascii	"_isatty\000"
.LASF47:
	.ascii	"st_mtim\000"
.LASF18:
	.ascii	"__ino_t\000"
.LASF53:
	.ascii	"tms_stime\000"
.LASF42:
	.ascii	"st_uid\000"
.LASF45:
	.ascii	"st_size\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF51:
	.ascii	"st_spare4\000"
.LASF87:
	.ascii	"__io_putchar\000"
.LASF79:
	.ascii	"DataIdx\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF82:
	.ascii	"_fork\000"
.LASF84:
	.ascii	"GNU C11 12.3.1 20230626 -mcpu=cortex-m4 -mthumb -mf"
	.ascii	"loat-abi=soft -march=armv7e-m -g -O0 -std=gnu11\000"
.LASF83:
	.ascii	"_getpid\000"
.LASF15:
	.ascii	"__dev_t\000"
.LASF20:
	.ascii	"__off_t\000"
.LASF26:
	.ascii	"blkcnt_t\000"
.LASF71:
	.ascii	"path\000"
.LASF36:
	.ascii	"timespec\000"
.LASF16:
	.ascii	"__uid_t\000"
.LASF37:
	.ascii	"stat\000"
.LASF40:
	.ascii	"st_mode\000"
.LASF52:
	.ascii	"tms_utime\000"
.LASF86:
	.ascii	"/home/mohamed/Downloads/test/corrected4/corrected/S"
	.ascii	"mart Car Parking Managment System\000"
.LASF67:
	.ascii	"_unlink\000"
.LASF12:
	.ascii	"__blkcnt_t\000"
.LASF85:
	.ascii	"Src/syscall.c\000"
.LASF59:
	.ascii	"__errno\000"
.LASF17:
	.ascii	"__gid_t\000"
	.ident	"GCC: (GNU Tools for STM32 12.3.rel1.20240612-1315) 12.3.1 20230626"
