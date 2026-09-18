Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF4AC982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 18:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC46910F4B4;
	Fri, 18 Sep 2026 18:27:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582CC10F4B4;
 Fri, 18 Sep 2026 18:26:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/ptl=3A_Add_a_new_PTL_PC?=
 =?utf-8?q?I_ID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 18:26:59 -0000
Message-ID: <178975601935.181279.16478255712750429483@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918181923.35930-1-matthew.s.atwood@intel.com>
In-Reply-To: <20260918181923.35930-1-matthew.s.atwood@intel.com>
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

Series: drm/xe/ptl: Add a new PTL PCI ID
URL   : https://patchwork.freedesktop.org/series/174524/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[18:25:59] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:26:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[18:26:23] Starting KUnit Kernel (1/1)...
[18:26:23] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[18:26:23] ============= refcount_interrupt (4 subtests) ==============
[18:26:23] [PASSED] test_single_irq_change
[18:26:23] [PASSED] test_nested_irq_change
[18:26:23] [PASSED] test_multiple_irq_change
[18:26:23] [PASSED] test_irq_save
[18:26:23] =============== [PASSED] refcount_interrupt ================
[18:26:23] ================= gpu_buddy (14 subtests) ==================
[18:26:23] [PASSED] gpu_test_buddy_alloc_limit
[18:26:23] [PASSED] gpu_test_buddy_alloc_optimistic
[18:26:23] [PASSED] gpu_test_buddy_alloc_pessimistic
[18:26:23] [PASSED] gpu_test_buddy_alloc_pathological
[18:26:23] [PASSED] gpu_test_buddy_alloc_contiguous
[18:26:23] [PASSED] gpu_test_buddy_alloc_clear
[18:26:23] [PASSED] gpu_test_buddy_alloc_range
[18:26:24] [PASSED] gpu_test_buddy_alloc_range_bias
[18:26:24] [PASSED] gpu_test_buddy_fragmentation_performance
[18:26:25] [PASSED] gpu_test_buddy_dirty_tracker_performance
[18:26:25] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[18:26:25] [PASSED] gpu_test_buddy_offset_aligned_allocation
[18:26:25] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[18:26:25] [PASSED] gpu_test_buddy_addr_to_block
[18:26:25] ==================== [PASSED] gpu_buddy ====================
[18:26:25] ============================================================
[18:26:25] Testing complete. Ran 18 tests: passed: 18
[18:26:25] Elapsed time: 26.621s total, 4.345s configuring, 20.308s building, 1.926s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_pci.c: In function ‘xe_pci_runtime_suspend’:
../drivers/gpu/drm/xe/xe_pci.c:1394:9: error: ‘flags’ undeclared (first use in this function)
 1394 |         flags = memalloc_noreclaim_save();
      |         ^~~~~
../drivers/gpu/drm/xe/xe_pci.c:1394:9: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_pci.c:1395:9: error: ‘pme_enabled’ undeclared (first use in this function); did you mean ‘cpu_enabled’?
 1395 |         pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
      |         ^~~~~~~~~~~
      |         cpu_enabled
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_pci.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[18:26:25] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:26:27] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


