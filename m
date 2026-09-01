Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595F4C624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3B910EED4;
	Tue,  1 Sep 2026 19:35:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D783B10EEC9;
 Tue,  1 Sep 2026 19:35:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Crescent_Island_PMT_support_?=
 =?utf-8?q?=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Sep 2026 19:35:47 -0000
Message-ID: <178829134787.109472.5365691592704501955@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev6)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[19:34:47] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:34:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[19:35:11] Starting KUnit Kernel (1/1)...
[19:35:11] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[19:35:12] ============= refcount_interrupt (4 subtests) ==============
[19:35:12] [PASSED] test_single_irq_change
[19:35:12] [PASSED] test_nested_irq_change
[19:35:12] [PASSED] test_multiple_irq_change
[19:35:12] [PASSED] test_irq_save
[19:35:12] =============== [PASSED] refcount_interrupt ================
[19:35:12] ================= gpu_buddy (14 subtests) ==================
[19:35:12] [PASSED] gpu_test_buddy_alloc_limit
[19:35:12] [PASSED] gpu_test_buddy_alloc_optimistic
[19:35:12] [PASSED] gpu_test_buddy_alloc_pessimistic
[19:35:12] [PASSED] gpu_test_buddy_alloc_pathological
[19:35:12] [PASSED] gpu_test_buddy_alloc_contiguous
[19:35:12] [PASSED] gpu_test_buddy_alloc_clear
[19:35:12] [PASSED] gpu_test_buddy_alloc_range
[19:35:12] [PASSED] gpu_test_buddy_alloc_range_bias
[19:35:13] [PASSED] gpu_test_buddy_fragmentation_performance
[19:35:13] [PASSED] gpu_test_buddy_dirty_tracker_performance
[19:35:13] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[19:35:13] [PASSED] gpu_test_buddy_offset_aligned_allocation
[19:35:13] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[19:35:13] [PASSED] gpu_test_buddy_addr_to_block
[19:35:13] ==================== [PASSED] gpu_buddy ====================
[19:35:13] ============================================================
[19:35:13] Testing complete. Ran 18 tests: passed: 18
[19:35:13] Elapsed time: 26.461s total, 4.310s configuring, 20.233s building, 1.850s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_vsec.c: In function ‘cri_late_bind_probe_work’:
../drivers/gpu/drm/xe/xe_vsec.c:287:13: error: implicit declaration of function ‘xe_is_oobmsm_fw_ready’ [-Werror=implicit-function-declaration]
  287 |         if (xe_is_oobmsm_fw_ready(xe)) {
      |             ^~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_vsec.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[19:35:13] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:35:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


