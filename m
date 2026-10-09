Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE5CA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 07:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320110FF39;
	Fri,  9 Oct 2026 07:48:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC22110FF39;
 Fri,  9 Oct 2026 07:48:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_Add_wa=5F14028434957?=
 =?utf-8?q?_to_Graphics_Version_35=2E11?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gupta, Varun" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 07:48:11 -0000
Message-ID: <179153209176.1824.10396249159945661710@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009065748.1304076-2-varun.gupta@intel.com>
In-Reply-To: <20261009065748.1304076-2-varun.gupta@intel.com>
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

Series: drm/xe: Add wa_14028434957 to Graphics Version 35.11
URL   : https://patchwork.freedesktop.org/series/175804/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[07:47:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:47:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[07:47:35] Starting KUnit Kernel (1/1)...
[07:47:35] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[07:47:35] ================= gpu_buddy (14 subtests) ==================
[07:47:35] [PASSED] gpu_test_buddy_alloc_limit
[07:47:35] [PASSED] gpu_test_buddy_alloc_optimistic
[07:47:35] [PASSED] gpu_test_buddy_alloc_pessimistic
[07:47:35] [PASSED] gpu_test_buddy_alloc_pathological
[07:47:35] [PASSED] gpu_test_buddy_alloc_contiguous
[07:47:35] [PASSED] gpu_test_buddy_alloc_clear
[07:47:35] [PASSED] gpu_test_buddy_alloc_range
[07:47:36] [PASSED] gpu_test_buddy_alloc_range_bias
[07:47:36] [PASSED] gpu_test_buddy_fragmentation_performance
[07:47:37] [PASSED] gpu_test_buddy_dirty_tracker_performance
[07:47:37] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[07:47:37] [PASSED] gpu_test_buddy_offset_aligned_allocation
[07:47:37] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[07:47:37] [PASSED] gpu_test_buddy_addr_to_block
[07:47:37] ==================== [PASSED] gpu_buddy ====================
[07:47:37] ============================================================
[07:47:37] Testing complete. Ran 14 tests: passed: 14
[07:47:37] Elapsed time: 26.637s total, 4.488s configuring, 20.182s building, 1.925s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/bitmap.h:8,
                 from ../drivers/gpu/drm/xe/xe_hw_error.c:6:
../drivers/gpu/drm/xe/xe_hw_error.c: In function ‘hw_error_source_handler’:
../drivers/gpu/drm/xe/xe_wa.h:52:18: error: ‘XE_DEVICE_WA_OOB_14028434957’ undeclared (first use in this function)
   52 |         test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);     \
      |                  ^~~~~~~~~~~~~~~~~
../include/linux/bitops.h:43:32: note: in definition of macro ‘bitop’
   43 |         ((__builtin_constant_p(nr) &&                                   \
      |                                ^~
../drivers/gpu/drm/xe/xe_wa.h:52:9: note: in expansion of macro ‘test_bit’
   52 |         test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);     \
      |         ^~~~~~~~
../drivers/gpu/drm/xe/xe_hw_error.c:468:58: note: in expansion of macro ‘XE_DEVICE_WA’
  468 |                 if (hw_err == HARDWARE_ERROR_NONFATAL && XE_DEVICE_WA(xe, 14028434957)) {
      |                                                          ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_wa.h:52:18: note: each undeclared identifier is reported only once for each function it appears in
   52 |         test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);     \
      |                  ^~~~~~~~~~~~~~~~~
../include/linux/bitops.h:43:32: note: in definition of macro ‘bitop’
   43 |         ((__builtin_constant_p(nr) &&                                   \
      |                                ^~
../drivers/gpu/drm/xe/xe_wa.h:52:9: note: in expansion of macro ‘test_bit’
   52 |         test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);     \
      |         ^~~~~~~~
../drivers/gpu/drm/xe/xe_hw_error.c:468:58: note: in expansion of macro ‘XE_DEVICE_WA’
  468 |                 if (hw_err == HARDWARE_ERROR_NONFATAL && XE_DEVICE_WA(xe, 14028434957)) {
      |                                                          ^~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_hw_error.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[07:47:37] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:47:39] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


