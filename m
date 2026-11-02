Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E6606A327
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 13:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004AF10EE4A;
	Mon,  2 Nov 2026 13:25:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366610EE38;
 Mon,  2 Nov 2026 13:25:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/vram=3A_add_decay-based?=
 =?utf-8?q?_reinstatement_of_soft-offlined_VRAM_pages_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 13:25:55 -0000
Message-ID: <179362595513.102575.2885359957282566077@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102122147.2361513-2-tejas.upadhyay@intel.com>
In-Reply-To: <20261102122147.2361513-2-tejas.upadhyay@intel.com>
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

Series: drm/xe/vram: add decay-based reinstatement of soft-offlined VRAM pages (rev2)
URL   : https://patchwork.freedesktop.org/series/173858/
State : failure

== Summary ==

+ trap cleanup EXIT
+ kunitconfigs=('/kernel/drivers/gpu/tests/.kunitconfig' '/kernel/drivers/gpu/drm/xe/.kunitconfig' '/kernel/drivers/gpu/drm/tests/.kunitconfig' '/kernel/drivers/gpu/drm/ttm/tests/.kunitconfig' '/kernel/drivers/dma-buf/.kunitconfig')
+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/tests/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/tests/.kunitconfig
[13:24:41] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:24:46] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
[13:25:07] Starting KUnit Kernel (1/1)...
[13:25:07] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[13:25:07] ================= gpu_buddy (14 subtests) ==================
[13:25:07] [PASSED] gpu_test_buddy_alloc_limit
[13:25:07] [PASSED] gpu_test_buddy_alloc_optimistic
[13:25:07] [PASSED] gpu_test_buddy_alloc_pessimistic
[13:25:07] [PASSED] gpu_test_buddy_alloc_pathological
[13:25:07] [PASSED] gpu_test_buddy_alloc_contiguous
[13:25:07] [PASSED] gpu_test_buddy_alloc_clear
[13:25:07] [PASSED] gpu_test_buddy_alloc_range
[13:25:07] [PASSED] gpu_test_buddy_alloc_range_bias
[13:25:08] [PASSED] gpu_test_buddy_fragmentation_performance
[13:25:09] [PASSED] gpu_test_buddy_dirty_tracker_performance
[13:25:09] [PASSED] gpu_test_buddy_alloc_exceeds_max_order
[13:25:09] [PASSED] gpu_test_buddy_offset_aligned_allocation
[13:25:09] [PASSED] gpu_test_buddy_subtree_offset_alignment_stress
[13:25:09] [PASSED] gpu_test_buddy_addr_to_block
[13:25:09] ==================== [PASSED] gpu_buddy ====================
[13:25:09] ============================================================
[13:25:09] Testing complete. Ran 14 tests: passed: 14
[13:25:09] Elapsed time: 27.481s total, 5.164s configuring, 20.450s building, 1.823s running

+ for kcfg in "${kunitconfigs[@]}"
+ [[ ! -f /kernel/drivers/gpu/drm/xe/.kunitconfig ]]
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:25:09] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:25:11] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c: In function ‘__xe_ttm_vram_mgr_init’:
../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:499:22: error: implicit declaration of function ‘xe_configfs_get_bad_page_decay_secs’ [-Werror=implicit-function-declaration]
  499 |         decay_secs = xe_configfs_get_bad_page_decay_secs(to_pci_dev(xe->drm.dev));
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:290: drivers/gpu/drm/xe/xe_ttm_vram_mgr.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:572: drivers/gpu/drm/xe] Error 2
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


