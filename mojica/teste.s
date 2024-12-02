	.text
	.file	"teste.ll"
	.globl	and__                           # -- Begin function and__
	.p2align	4, 0x90
	.type	and__,@function
and__:                                  # @and__
	.cfi_startproc
# %bb.0:
	movl	%edi, -4(%rsp)
	movl	%esi, -8(%rsp)
	testl	%edi, %edi
	je	.LBB0_1
# %bb.2:
	cmpl	$0, -8(%rsp)
	setne	%al
	movzbl	%al, %eax
	retq
.LBB0_1:
	xorl	%eax, %eax
	movzbl	%al, %eax
	retq
.Lfunc_end0:
	.size	and__, .Lfunc_end0-and__
	.cfi_endproc
                                        # -- End function
	.globl	or__                            # -- Begin function or__
	.p2align	4, 0x90
	.type	or__,@function
or__:                                   # @or__
	.cfi_startproc
# %bb.0:
	movl	%edi, -4(%rsp)
	movl	%esi, -8(%rsp)
	movb	$1, %al
	testl	%edi, %edi
	je	.LBB1_1
# %bb.2:
	movzbl	%al, %eax
	retq
.LBB1_1:
	cmpl	$0, -8(%rsp)
	setne	%al
	movzbl	%al, %eax
	retq
.Lfunc_end1:
	.size	or__, .Lfunc_end1-or__
	.cfi_endproc
                                        # -- End function
	.globl	fmodf__                         # -- Begin function fmodf__
	.p2align	4, 0x90
	.type	fmodf__,@function
fmodf__:                                # @fmodf__
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm0, 16(%rsp)
	movsd	%xmm1, 8(%rsp)
	callq	fmod@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	fmodf__, .Lfunc_end2-fmodf__
	.cfi_endproc
                                        # -- End function
	.globl	printBool__                     # -- Begin function printBool__
	.p2align	4, 0x90
	.type	printBool__,@function
printBool__:                            # @printBool__
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	testl	%edi, %edi
	je	.LBB3_2
# %bb.1:
	movl	$.L.str.true, %edi
	jmp	.LBB3_3
.LBB3_2:
	movl	$.L.str.false, %edi
.LBB3_3:
	xorl	%eax, %eax
	callq	printf@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	printBool__, .Lfunc_end3-printBool__
	.cfi_endproc
                                        # -- End function
	.globl	readFloat__                     # -- Begin function readFloat__
	.p2align	4, 0x90
	.type	readFloat__,@function
readFloat__:                            # @readFloat__
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsp, %rsi
	movl	$.L.str.scanf, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movsd	(%rsp), %xmm0                   # xmm0 = mem[0],zero
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	readFloat__, .Lfunc_end4-readFloat__
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	callq	readFloat__
	movsd	%xmm0, 8(%rsp)
	callq	readFloat__
	movsd	%xmm0, 16(%rsp)
	movsd	8(%rsp), %xmm1                  # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jb	.LBB5_2
# %bb.1:
	movsd	8(%rsp), %xmm0                  # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf@PLT
.LBB5_2:
	movsd	16(%rsp), %xmm0                 # xmm0 = mem[0],zero
	ucomisd	8(%rsp), %xmm0
	jbe	.LBB5_4
# %bb.3:
	movsd	16(%rsp), %xmm0                 # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf@PLT
.LBB5_4:
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf\n"
	.size	.L.str, 5

	.type	.L.str.true,@object             # @.str.true
.L.str.true:
	.asciz	"True\n"
	.size	.L.str.true, 6

	.type	.L.str.false,@object            # @.str.false
.L.str.false:
	.asciz	"False\n"
	.size	.L.str.false, 7

	.type	.L.str.scanf,@object            # @.str.scanf
.L.str.scanf:
	.asciz	"%lf"
	.size	.L.str.scanf, 4

	.section	".note.GNU-stack","",@progbits
