Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8299ECA5FFC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 21:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6210E3D4;
	Tue,  6 Oct 2026 21:36:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7A910E3D4;
 Tue,  6 Oct 2026 21:36:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_fixing_endless_PF_ra?=
 =?utf-8?q?nge_response?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 21:36:48 -0000
Message-ID: <179132260836.245206.18355445963331596799@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006213449.4027749-1-fei.yang@intel.com>
In-Reply-To: <20261006213449.4027749-1-fei.yang@intel.com>
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

Series: drm/xe: fixing endless PF range response
URL   : https://patchwork.freedesktop.org/series/175636/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[21:35:52] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:35:57] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:36:17] Starting KUnit Kernel (1/1)...
[21:36:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:36:17] ================= gpu_buddy (14 subtests) ==================
[21:36:17] [PASSED] gpu_test_buddy_alloc_limit
[21:36:17] [PASSED] gpu_test_buddy_alloc_optimistic
[21:36:17] [PASSED] gpu_test_buddy_alloc_pessimistic
[21:36:17] [PASSED] gpu_test_buddy_alloc_pathological
[21:36:17] [PASSED] gpu_test_buddy_alloc_contiguous
[21:36:17] [PASSED] gpu_test_buddy_alloc_clear
[21:36:17] [PASSED] gpu_test_buddy_alloc_range
[21:36:17] [PASSED] gpu_test_buddy_alloc_range_bias
[21:36:18] [PASSED] gpu_test_buddy_fragmentation_performance
[21:36:19] [PASSED] gpu_test_buddy_dirty_tracker_performance
[21:36:19] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[21:36:19] [PASSED] gpu_test_buddy_offset_aligned_allocation
[21:36:19] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[21:36:19] [PASSED] gpu_test_buddy_addr_to_block
[21:36:19] ==================== [PASSED] gpu_buddy ====================
[21:36:19] ============================================================
[21:36:19] Testing complete. Ran 14 tests: passed: 14
[21:36:19] Elapsed time: 26.641s total, 4.466s configuring, 20.307s building, 1.822s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_device.c:59:
../drivers/gpu/drm/xe/xe_pagefault.h: In function ‘xe_pagefault_set_end_addr’:
../drivers/gpu/drm/xe/xe_pagefault.h:101:21: error: ‘struct <anonymous>’ has no member named ‘vma_info’
  101 |         pf->consumer.vma_info.end_addr = end_addr;
      |                     ^
../drivers/gpu/drm/xe/xe_pagefault.h: In function ‘xe_pagefault_set_start_addr’:
../drivers/gpu/drm/xe/xe_pagefault.h:141:21: error: ‘struct <anonymous>’ has no member named ‘vma_info’
  141 |         pf->consumer.vma_info.start_addr = start_addr;
      |                     ^
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_device.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:551: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:551: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:551: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:551: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2229: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[21:36:19] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:36:21] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


