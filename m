Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFECBC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 16:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AFE10FA82;
	Fri,  4 Sep 2026 16:48:10 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236F10E212;
 Fri,  4 Sep 2026 16:48:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/gpusvm=3A_share_one_HMM_fa?=
 =?utf-8?q?ult_and_keep_single_mappings_inline?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 16:48:09 -0000
Message-ID: <178854048972.124366.1071014929577863269@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904163956.3433293-1-honghuan@amd.com>
In-Reply-To: <20260904163956.3433293-1-honghuan@amd.com>
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

Series: drm/gpusvm: share one HMM fault and keep single mappings inline
URL   : https://patchwork.freedesktop.org/series/173405/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[16:47:03] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:47:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[16:47:28] Starting KUnit Kernel (1/1)...
[16:47:28] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[16:47:28] ============= refcount_interrupt (4 subtests) ==============
[16:47:28] [PASSED] test_single_irq_change
[16:47:28] [PASSED] test_nested_irq_change
[16:47:28] [PASSED] test_multiple_irq_change
[16:47:28] [PASSED] test_irq_save
[16:47:28] =============== [PASSED] refcount_interrupt ================
[16:47:28] ================= gpu_buddy (14 subtests) ==================
[16:47:28] [PASSED] gpu_test_buddy_alloc_limit
[16:47:28] [PASSED] gpu_test_buddy_alloc_optimistic
[16:47:28] [PASSED] gpu_test_buddy_alloc_pessimistic
[16:47:28] [PASSED] gpu_test_buddy_alloc_pathological
[16:47:28] [PASSED] gpu_test_buddy_alloc_contiguous
[16:47:28] [PASSED] gpu_test_buddy_alloc_clear
[16:47:28] [PASSED] gpu_test_buddy_alloc_range
[16:47:29] [PASSED] gpu_test_buddy_alloc_range_bias
[16:47:29] [PASSED] gpu_test_buddy_fragmentation_performance
[16:47:30] [PASSED] gpu_test_buddy_dirty_tracker_performance
[16:47:30] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[16:47:30] [PASSED] gpu_test_buddy_offset_aligned_allocation
[16:47:30] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[16:47:30] [PASSED] gpu_test_buddy_addr_to_block
[16:47:30] ==================== [PASSED] gpu_buddy ====================
[16:47:30] ============================================================
[16:47:30] Testing complete. Ran 18 tests: passed: 18
[16:47:30] Elapsed time: 27.063s total, 4.380s configuring, 20.765s building, 1.874s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_pt.c: In function ‘xe_pt_stage_bind’:
../drivers/gpu/drm/xe/xe_pt.c:837:59: error: passing argument 1 of ‘drm_gpusvm_pages_first_dma’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  837 |                         addr = drm_gpusvm_pages_first_dma(&range->pages,
      |                                                           ^~~~~~~~~~~~~
      |                                                           |
      |                                                           struct <anonymous> *
In file included from ../drivers/gpu/drm/xe/xe_bo_types.h:11,
                 from ../drivers/gpu/drm/xe/xe_bo.h:12,
                 from ../drivers/gpu/drm/xe/xe_pt.c:9:
../include/drm/drm_gpusvm.h:406:59: note: expected ‘const struct drm_gpusvm_pages *’ but argument is of type ‘struct <anonymous> *’
  406 | drm_gpusvm_pages_first_dma(const struct drm_gpusvm_pages *svm_pages,
      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_pt.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[16:47:30] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[16:47:32] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


