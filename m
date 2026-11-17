Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FD606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 21:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1ED10E6AC;
	Tue, 17 Nov 2026 21:36:35 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0910E095;
 Tue, 17 Nov 2026 21:36:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5Bv3=2C1?=
 =?utf-8?q?/2=5D_drm/xe/wopcm=3A_Use_the_size_from_HW_when_excluding_the_wop?=
 =?utf-8?q?cm_range_from_GGTT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Nov 2026 21:36:34 -0000
Message-ID: <179495139448.39943.12004481399273295009@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117212707.2159821-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261117212707.2159821-3-daniele.ceraolospurio@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: series starting with [v3,1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
URL   : https://patchwork.freedesktop.org/series/178825/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[21:35:25] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:35:30] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[21:35:51] Starting KUnit Kernel (1/1)...
[21:35:51] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[21:35:51] ================= gpu_buddy (15 subtests) ==================
[21:35:51] [PASSED] gpu_test_buddy_alloc_limit
[21:35:51] [PASSED] gpu_test_buddy_alloc_optimistic
[21:35:51] [PASSED] gpu_test_buddy_alloc_pessimistic
[21:35:51] [PASSED] gpu_test_buddy_alloc_pathological
[21:35:51] [PASSED] gpu_test_buddy_alloc_contiguous
[21:35:51] [PASSED] gpu_test_buddy_alloc_clear
[21:35:51] [PASSED] gpu_test_buddy_alloc_range
[21:35:51] [PASSED] gpu_test_buddy_alloc_range_bias
[21:35:51] [PASSED] gpu_test_buddy_alloc_range_clear_guard
[21:35:52] [PASSED] gpu_test_buddy_fragmentation_performance
[21:35:53] [PASSED] gpu_test_buddy_dirty_tracker_performance
[21:35:53] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[21:35:53] [PASSED] gpu_test_buddy_offset_aligned_allocation
[21:35:53] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[21:35:53] [PASSED] gpu_test_buddy_addr_to_block
[21:35:53] ==================== [PASSED] gpu_buddy ====================
[21:35:53] ============================================================
[21:35:53] Testing complete. Ran 15 tests: passed: 15
[21:35:53] Elapsed time: 27.576s total, 5.130s configuring, 20.528s building, 1.878s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[21:35:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[21:35:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_ggtt.c:1395:
../drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c: In function ‘ggtt_test_accessible_size’:
../drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c:17:31: error: implicit declaration of function ‘xe_wopcm_size’; did you mean ‘xe_bo_size’? [-Werror=implicit-function-declaration]
   17 |         return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
      |                               ^~~~~~~~~~~~~
      |                               xe_bo_size
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_ggtt.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:572: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:572: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:572: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:572: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2244: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


