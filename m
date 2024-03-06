Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19ACC5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 11:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729011129CF;
	Wed,  6 Mar 2024 11:06:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C2C10EC86;
 Wed,  6 Mar 2024 11:06:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_um=3A_Minor_fixes_and_cle?=
 =?utf-8?q?anups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tiwei Bie" <tiwei.btw@antgroup.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 11:06:23 -0000
Message-ID: <170972318329.524258.16325637848066509436@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
In-Reply-To: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: um: Minor fixes and cleanups
URL   : https://patchwork.freedesktop.org/series/130801/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d2e66e675ab22c6fc356d3488d2003697080a13f
Author: Tiwei Bie <tiwei.btw@antgroup.com>
Date:   Wed Mar 6 18:19:25 2024 +0800

    um: Fix -Wmissing-prototypes warnings for __warp_* and foo
    
    These functions are not called explicitly. Let's just workaround
    the -Wmissing-prototypes warnings by declaring them locally similar
    to what was done in arch/x86/kernel/asm-offsets_32.c.
    
    This will address below -Wmissing-prototypes warnings:
    
    ./arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
    arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
    arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
    arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    
    Signed-off-by: Tiwei Bie <tiwei.btw@antgroup.com>
+ /mt/dim checkpatch 6e50187af603728329f9d3c3a53ad162d7eda9a4 drm-intel
bd81ab775927 um: Make local functions and variables static
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
63ab129c2c35 um: Fix the declaration of vfree
-:21: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#21: FILE: arch/um/include/shared/um_malloc.h:15:
+extern void vfree(const void *ptr);

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
f0a6c5bae70b um: Remove unused functions
bf472d37b42f um: Fix the return type of __switch_to
a3eabba75f7e um: Add missing headers
-:96: CHECK:ARCH_INCLUDE_LINUX: Consider using #include <linux/mmu_context.h> instead of <asm/mmu_context.h>
#96: FILE: arch/um/kernel/skas/mmu.c:13:
+#include <asm/mmu_context.h>

-:132: CHECK:ARCH_INCLUDE_LINUX: Consider using #include <linux/mmu_context.h> instead of <asm/mmu_context.h>
#132: FILE: arch/um/kernel/tlb.c:11:
+#include <asm/mmu_context.h>

total: 0 errors, 0 warnings, 2 checks, 104 lines checked
fe467ce3bc98 um: Stop tracking host PID in cpu_tasks
4f445f0dbbf4 um: Move declarations to proper headers
-:32: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#32: FILE: arch/um/include/asm/ptrace-generic.h:39:
+extern int poke_user(struct task_struct *child, long addr, long data);

-:33: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#33: FILE: arch/um/include/asm/ptrace-generic.h:40:
+extern int peek_user(struct task_struct *child, long addr, long data);

-:46: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#46: FILE: arch/um/include/shared/kern_util.h:44:
+extern int parse_iomem(char *str, int *add);

-:106: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#106: FILE: arch/um/kernel/um_arch.h:14:
+extern int __init read_initrd(void);

-:129: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#129: FILE: arch/x86/um/asm/ptrace.h:57:
+extern int arch_switch_tls(struct task_struct *to);

-:141: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#141: FILE: arch/x86/um/asm/ptrace.h:91:
+extern void arch_switch_to(struct task_struct *to);

total: 0 errors, 0 warnings, 6 checks, 86 lines checked
4e4cfcf3aae4 um: Fix -Wmissing-prototypes warnings for text_poke*
d2e66e675ab2 um: Fix -Wmissing-prototypes warnings for __warp_* and foo
-:34: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#34: FILE: arch/um/os-Linux/main.c:190:
+void __wrap_free(void *ptr);

total: 0 errors, 1 warnings, 0 checks, 29 lines checked


