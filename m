Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F266EC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9122B10E011;
	Wed, 16 Sep 2026 11:32:44 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1294B10E011;
 Wed, 16 Sep 2026 11:32:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Refresh_TTM_LRU_on_SVM_prefetc?=
 =?utf-8?q?h?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 11:32:43 -0000
Message-ID: <178955836307.171108.10792503949535445852@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
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

Series: Refresh TTM LRU on SVM prefetch
URL   : https://patchwork.freedesktop.org/series/174276/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[11:31:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:31:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[11:32:05] Starting KUnit Kernel (1/1)...
[11:32:05] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:32:06] ============= refcount_interrupt (4 subtests) ==============
[11:32:06] [PASSED] test_single_irq_change
[11:32:06] [PASSED] test_nested_irq_change
[11:32:06] [PASSED] test_multiple_irq_change
[11:32:06] [PASSED] test_irq_save
[11:32:06] =============== [PASSED] refcount_interrupt ================
[11:32:06] ================= gpu_buddy (14 subtests) ==================
[11:32:06] [PASSED] gpu_test_buddy_alloc_limit
[11:32:06] [PASSED] gpu_test_buddy_alloc_optimistic
[11:32:06] [PASSED] gpu_test_buddy_alloc_pessimistic
[11:32:06] [PASSED] gpu_test_buddy_alloc_pathological
[11:32:06] [PASSED] gpu_test_buddy_alloc_contiguous
[11:32:06] [PASSED] gpu_test_buddy_alloc_clear
[11:32:06] [PASSED] gpu_test_buddy_alloc_range
[11:32:06] [PASSED] gpu_test_buddy_alloc_range_bias
[11:32:07] [PASSED] gpu_test_buddy_fragmentation_performance
[11:32:07] [PASSED] gpu_test_buddy_dirty_tracker_performance
[11:32:07] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[11:32:07] [PASSED] gpu_test_buddy_offset_aligned_allocation
[11:32:07] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[11:32:07] [PASSED] gpu_test_buddy_addr_to_block
[11:32:07] ==================== [PASSED] gpu_buddy ====================
[11:32:07] ============================================================
[11:32:07] Testing complete. Ran 18 tests: passed: 18
[11:32:07] Elapsed time: 26.841s total, 4.422s configuring, 20.451s building, 1.919s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[11:32:08] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:32:09] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/xe/xe_vm.c: In function ‘vm_bind_ioctl_ops_create’:
../drivers/gpu/drm/xe/xe_vm.c:2588:47: error: implicit declaration of function ‘xe_svm_range_prefetch_lru_bump’ [-Werror=implicit-function-declaration]
 2588 |                                         err = xe_svm_range_prefetch_lru_bump(vm, vma,
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c: In function ‘prefetch_ranges’:
../drivers/gpu/drm/xe/xe_vm.c:3271:25: error: ‘xe_svm_devmem_lru_bump’ undeclared (first use in this function)
 3271 |         ctx.devmem_fn = xe_svm_devmem_lru_bump;
      |                         ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:3271:25: note: each undeclared identifier is reported only once for each function it appears in
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_vm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


