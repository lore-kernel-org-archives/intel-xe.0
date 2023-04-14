Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23C4C77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 17:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8017F10EE2A;
	Fri, 14 Apr 2023 17:00:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6D10EE21;
 Fri, 14 Apr 2023 17:00:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 27F46AADEB;
 Fri, 14 Apr 2023 17:00:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 14 Apr 2023 17:00:56 -0000
Message-ID: <168149165615.26684.16586434827286075006@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230414165714.2969708-1-francois.dugast@intel.com>
In-Reply-To: <20230414165714.2969708-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_switch_to_using_drm=5Fexec_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: switch to using drm_exec (rev2)
URL   : https://patchwork.freedesktop.org/series/116477/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:/usr/bin/ld: drivers/gpu/drm/xe/xe_exec.o: in function `xe_exec_ioctl':
xe_exec.c:(.text+0x1da): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_exec.c:(.text+0x380): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_exec.c:(.text+0x512): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_exec.c:(.text+0x792): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `handle_acc.isra.0':
xe_gt_pagefault.c:(.text+0x281): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0x28b): undefined reference to `drm_exec_prepare_obj'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0x29a): undefined reference to `drm_exec_cleanup'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0x31a): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `handle_pagefault':
xe_gt_pagefault.c:(.text+0x80a): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0x834): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0x83e): undefined reference to `drm_exec_prepare_obj'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0x852): undefined reference to `drm_exec_cleanup'
/usr/bin/ld: xe_gt_pagefault.c:(.text+0xb40): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vm_lock_dma_resv':
xe_vm.c:(.text+0x1455): undefined reference to `drm_exec_prepare_obj'
/usr/bin/ld: xe_vm.c:(.text+0x146a): undefined reference to `drm_exec_cleanup'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vm_add_compute_engine':
xe_vm.c:(.text+0x1620): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_vm.c:(.text+0x164d): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `preempt_rebind_work_func':
xe_vm.c:(.text+0x1cbf): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_vm.c:(.text+0x1e82): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_vm.c:(.text+0x1f4a): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_vm.c:(.text+0x1f83): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `xe_vma_destroy_unlocked':
xe_vm.c:(.text+0x2a8b): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_vm.c:(.text+0x2a95): undefined reference to `drm_exec_cleanup'
/usr/bin/ld: xe_vm.c:(.text+0x2a9f): undefined reference to `drm_exec_prepare_obj'
/usr/bin/ld: xe_vm.c:(.text+0x2b63): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o: in function `vm_bind_ioctl.isra.0':
xe_vm.c:(.text+0x3d0e): undefined reference to `drm_exec_prepare_obj'
/usr/bin/ld: xe_vm.c:(.text+0x3d3f): undefined reference to `drm_exec_init'
/usr/bin/ld: xe_vm.c:(.text+0x3d52): undefined reference to `drm_exec_cleanup'
/usr/bin/ld: xe_vm.c:(.text+0x3dbb): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_vm.c:(.text+0x3dfa): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_vm.c:(.text+0x4133): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_vm.c:(.text+0x4196): undefined reference to `drm_exec_fini'
/usr/bin/ld: xe_vm.c:(.text+0x429d): undefined reference to `drm_exec_fini'
/usr/bin/ld: drivers/gpu/drm/xe/xe_vm.o:xe_vm.c:(.text+0x433f): more undefined references to `drm_exec_fini' follow
collect2: error: ld returned 1 exit status
make[2]: *** [../scripts/Makefile.vmlinux:35: vmlinux] Error 1
make[1]: *** [/kernel/Makefile:1249: vmlinux] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[17:00:28] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:00:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


