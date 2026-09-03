Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FE6C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAB510E256;
	Thu,  3 Sep 2026 20:18:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5DB10E256;
 Thu,  3 Sep 2026 20:18:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Crescent_Island_PMT_support_?=
 =?utf-8?q?=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 20:18:13 -0000
Message-ID: <178846669310.120893.10660762503465248209@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
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

Series: Crescent Island PMT support (rev7)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[20:17:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:17:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[20:17:36] Starting KUnit Kernel (1/1)...
[20:17:36] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:17:36] ============= refcount_interrupt (4 subtests) ==============
[20:17:36] [PASSED] test_single_irq_change
[20:17:36] [PASSED] test_nested_irq_change
[20:17:36] [PASSED] test_multiple_irq_change
[20:17:36] [PASSED] test_irq_save
[20:17:36] =============== [PASSED] refcount_interrupt ================
[20:17:36] ================= gpu_buddy (14 subtests) ==================
[20:17:36] [PASSED] gpu_test_buddy_alloc_limit
[20:17:36] [PASSED] gpu_test_buddy_alloc_optimistic
[20:17:36] [PASSED] gpu_test_buddy_alloc_pessimistic
[20:17:36] [PASSED] gpu_test_buddy_alloc_pathological
[20:17:36] [PASSED] gpu_test_buddy_alloc_contiguous
[20:17:36] [PASSED] gpu_test_buddy_alloc_clear
[20:17:36] [PASSED] gpu_test_buddy_alloc_range
[20:17:37] [PASSED] gpu_test_buddy_alloc_range_bias
[20:17:38] [PASSED] gpu_test_buddy_fragmentation_performance
[20:17:38] [PASSED] gpu_test_buddy_dirty_tracker_performance
[20:17:38] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[20:17:38] [PASSED] gpu_test_buddy_offset_aligned_allocation
[20:17:38] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[20:17:38] [PASSED] gpu_test_buddy_addr_to_block
[20:17:38] ==================== [PASSED] gpu_buddy ====================
[20:17:38] ============================================================
[20:17:38] Testing complete. Ran 18 tests: passed: 18
[20:17:38] Elapsed time: 26.518s total, 4.402s configuring, 20.199s building, 1.844s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_vsec.c: In function ‘cri_late_bind_probe_work’:
../drivers/gpu/drm/xe/xe_vsec.c:298:13: error: implicit declaration of function ‘xe_is_oobmsm_fw_ready’ [-Werror=implicit-function-declaration]
  298 |         if (xe_is_oobmsm_fw_ready(xe)) {
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

[20:17:38] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:17:40] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


