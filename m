Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5658C982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 19:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB3810E155;
	Fri, 18 Sep 2026 19:16:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828E10E155;
 Fri, 18 Sep 2026 19:16:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/guc=3A_Fix_race_around_?=
 =?utf-8?q?q-=3Eguc-=3Esuspend=5Fpending_access_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 19:16:51 -0000
Message-ID: <178975901168.182123.1161011490356811681@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
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

Series: drm/xe/guc: Fix race around q->guc->suspend_pending access (rev4)
URL   : https://patchwork.freedesktop.org/series/172176/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[19:15:50] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:15:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:16:15] Starting KUnit Kernel (1/1)...
[19:16:15] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:16:15] ============= refcount_interrupt (4 subtests) ==============
[19:16:15] [PASSED] test_single_irq_change
[19:16:15] [PASSED] test_nested_irq_change
[19:16:15] [PASSED] test_multiple_irq_change
[19:16:15] [PASSED] test_irq_save
[19:16:15] =============== [PASSED] refcount_interrupt ================
[19:16:15] ================= gpu_buddy (14 subtests) ==================
[19:16:15] [PASSED] gpu_test_buddy_alloc_limit
[19:16:15] [PASSED] gpu_test_buddy_alloc_optimistic
[19:16:15] [PASSED] gpu_test_buddy_alloc_pessimistic
[19:16:15] [PASSED] gpu_test_buddy_alloc_pathological
[19:16:15] [PASSED] gpu_test_buddy_alloc_contiguous
[19:16:15] [PASSED] gpu_test_buddy_alloc_clear
[19:16:15] [PASSED] gpu_test_buddy_alloc_range
[19:16:16] [PASSED] gpu_test_buddy_alloc_range_bias
[19:16:16] [PASSED] gpu_test_buddy_fragmentation_performance
[19:16:17] [PASSED] gpu_test_buddy_dirty_tracker_performance
[19:16:17] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[19:16:17] [PASSED] gpu_test_buddy_offset_aligned_allocation
[19:16:17] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[19:16:17] [PASSED] gpu_test_buddy_addr_to_block
[19:16:17] ==================== [PASSED] gpu_buddy ====================
[19:16:17] ============================================================
[19:16:17] Testing complete. Ran 18 tests: passed: 18
[19:16:17] Elapsed time: 26.768s total, 4.375s configuring, 20.425s building, 1.918s running

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

[19:16:17] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:16:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


